//
//  PicoSOAPWriter.m
//  Pico
//
//  Created by bulldog on 13-3-14.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoSOAPWriter.h"
#import "XMLWriter.h"
#import "PicoBindingSchema.h"
#import "PicoClassSchema.h"
#import "PicoConfig.h"
#import "SOAP11Envelope.h"
#import "SOAP12Envelope.h"
#import "SOAP11Body.h"
#import "SOAP12Body.h"

@interface PicoXMLWriter (Private)

-(void)writeObject:(XMLWriter *)xmlWriter source:(id)source;

@end

@implementation PicoSOAPWriter

static NSString *SOAP_PREFIX = @"soap";

-(NSString *)toString:(id)obj {
    
    if (obj == nil) {
		@throw [NSException exceptionWithName:@"WriterException" reason:@"Can't write nil object." userInfo:nil];
	}
    
    if (![obj isMemberOfClass:[SOAP11Envelope class]] && ![obj isMemberOfClass:[SOAP12Envelope class]]) {
        @throw [NSException exceptionWithName:@"WriterException" reason:[NSString stringWithFormat:@"can't write non-soap object of type : %@", NSStringFromClass([obj class])] userInfo:nil];
    }
    
    XMLWriter *xmlWriter = [[XMLWriter alloc] init];
    _autoPrefixCount = 0;
    
    [xmlWriter writeStartDocumentWithEncodingAndVersion:self.config.encoding version:@"1.0"];
    
    
    PicoBindingSchema *bindingSchema = [PicoBindingSchema fromObject:obj];
    PicoClassSchema *classSchema = [bindingSchema classSchema];
    NSString *xmlName = classSchema.xmlName;
    NSString *namespace = classSchema.nsURI;
    
    // set soap prefix
    [xmlWriter setPrefix:SOAP_PREFIX namespaceURI:namespace];
    
    NSString *innerNamespace = [self findInnerClassNamespace:obj];
    // set default namespace without prefix
    if (innerNamespace.length > 0 && ![xmlWriter getPrefix:innerNamespace]) {
        [xmlWriter setDefaultNamespace:innerNamespace];
    }
    
    [xmlWriter writeStartElementWithNamespace:namespace localName:xmlName];
    
    [super writeObject:xmlWriter source:obj];
    
    [xmlWriter writeEndElementWithNamespace:namespace localName:xmlName];
    
    [xmlWriter writeEndDocument];
    
    NSString *xmlString = [xmlWriter toString];
    xmlString = [NSMutableString stringWithString:xmlString];
    
    [xmlWriter release];
    
    return xmlString;
    
}

-(NSString *) findInnerClassNamespace:(id)obj {
    id innerObj = nil;
    if ([obj isMemberOfClass:[SOAP11Envelope class]]) {
        SOAP11Envelope *soap11Envelope = obj;
        SOAP11Body *soap11Body = soap11Envelope.body;
        if (soap11Body && soap11Body.any.count > 0) {
            innerObj = [soap11Body.any objectAtIndex:0];
        }
    } else { //soap 12
        SOAP12Envelope *soap12Envelope = obj;
        SOAP12Body *soap12Body = soap12Envelope.body;
        if (soap12Body && soap12Body.any.count > 0) {
            innerObj = [soap12Body.any objectAtIndex:0];
        }
    }
    if (innerObj) {
        PicoBindingSchema *innerBindingSchema = [PicoBindingSchema fromObject:innerObj];
        PicoClassSchema *innerClassSchema = [innerBindingSchema classSchema];
        NSString *innerNamespace = innerClassSchema.nsURI;
        return innerNamespace;
    }
    return nil;
}

-(NSData *)toData:(id)obj {
    
    NSString *xmlString = [[self toString:obj] retain];
    
    NSData *data = [xmlString dataUsingEncoding: CFStringConvertEncodingToNSStringEncoding(CFStringConvertIANACharSetNameToEncoding((CFStringRef)self.config.encoding)) allowLossyConversion:NO];
    
    [xmlString release];
    
    return data;
    
}

@end
