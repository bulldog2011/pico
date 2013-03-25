//
//  PicoSOAPReader.m
//  Pico
//
//  Created by bulldog on 13-3-13.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoSOAPReader.h"
#import "GDataXMLNode.h"
#import "PicoBindingSchema.h"
#import "PicoPropertySchema.h"
#import "PicoClassSchema.h"
#import "PicoConstants.h"
#import "PicoConverter.h"
#import "PicoXMLElement.h"
#import "SOAP11Envelope.h"
#import "SOAP12Envelope.h"
#import "SOAP11Body.h"
#import "SOAP12Body.h"
#import "SOAP11Fault.h"
#import "SOAP12Fault.h"

#import "PicoXMLElement.h"

@interface PicoXMLReader (Private)

-(void)read:(id)value element:(GDataXMLElement *)element;

-(void)readAnyElement:(id)value element:(GDataXMLElement *)element;

-(BOOL)readAnyElement:(id)value element:(GDataXMLElement *)element bindClass:(Class) clazz;

@end


@implementation PicoSOAPReader

static NSString *INNER_CLASS_KEY = @"innerClass";

// Convert binary data to object of specific class
-(id)fromData:(NSData *)data withSOAPClass:(Class)soapClazz innerClass:(Class)innerClazz {
    
    if ((soapClazz != [SOAP11Envelope class]) && (soapClazz != [SOAP12Envelope class])) {
        @throw [NSException exceptionWithName:@"ReaderException" reason:[NSString stringWithFormat:@"can't read non-soap class : %@", NSStringFromClass(soapClazz)] userInfo:nil];
    }
    
    NSError *error;
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:data options:0 error:&error];
    
    if (!doc) {
        @throw [NSException exceptionWithName:@"ReaderException" reason:[NSString stringWithFormat:@"fail to parse xml data , Error : %@", error] userInfo:[error userInfo]];
    }
    
    GDataXMLElement *rootElement = [doc rootElement];
    PicoBindingSchema *bs = [PicoBindingSchema fromClass:soapClazz];
    PicoClassSchema *cs = bs.classSchema;
    NSString *xmlName = cs.xmlName;
    if ([xmlName length] == 0) {
        xmlName = bs.className;
    }
    NSString *rootName = [rootElement localName];
    if (![xmlName isEqualToString: rootName]) {
        [doc release];
		@throw [NSException exceptionWithName:@"ReaderException" reason:[NSString stringWithFormat:@"root name mismatch , xml name : %@, root name : %@", xmlName, rootName] userInfo:nil];
	}
    
    NSMutableDictionary *threadDictionary = [[NSThread currentThread] threadDictionary];
    [threadDictionary setObject:innerClazz forKey:INNER_CLASS_KEY];
    
    id obj = [soapClazz new];
    
    [super read: obj element: rootElement];
    
    [obj autorelease];
    [doc release];
    
    return obj;
}

-(void)readAnyElement:(id)value element:(GDataXMLElement *)element {
    PicoBindingSchema *bs = [PicoBindingSchema fromObject:value];
    PicoPropertySchema *anyPs = bs.anyElementSchema;
    if (!anyPs) return;
    
    BOOL soap11 = [value isMemberOfClass:[SOAP11Body class]];
    BOOL soap12 = [value isMemberOfClass:[SOAP12Body class]];
    
    if (soap11 || soap12) {
        NSMutableDictionary *threadDictionary = [[NSThread currentThread] threadDictionary];
        Class innerClazz = [threadDictionary objectForKey:INNER_CLASS_KEY];
        
        BOOL success = [super readAnyElement:value element:element bindClass:innerClazz];
        if (!success) {
            Class faultClass = soap11? [SOAP11Fault class] : [SOAP12Fault class];
            [super readAnyElement:value element:element bindClass:faultClass];
        }
        
    } else {
        [super readAnyElement:value element:element];
    }
}

-(id)fromString:(NSString *)string withSOAPClass:(Class)clazz innerClass:(Class)innerClazz {
    NSData *data = [string dataUsingEncoding: CFStringConvertEncodingToNSStringEncoding(CFStringConvertIANACharSetNameToEncoding((CFStringRef)self.config.encoding)) allowLossyConversion:NO];
    
    return [self fromData:data withSOAPClass:clazz innerClass:innerClazz];
}

@end
