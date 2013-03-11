//
//  PicoTBXMLReader.m
//  Pico
//
//  Created by bulldog on 13-3-11.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoXMLReader.h"
#import "GDataXMLNode.h"
#import "PicoBindingSchema.h"
#import "PicoPropertySchema.h"
#import "PicoClassSchema.h"
#import "PicoConstants.h"
#import "PicoConverter.h"
#import "PicoXMLElement.h"

@interface PicoXMLReader (Private)

-(void)read:(id)value element:(GDataXMLElement *)element;

-(PicoXMLElement *)convertToPicoElement:(GDataXMLElement *)element;

@end

@implementation PicoXMLReader

@synthesize config = _config;

- (id) init {
    PicoConfig *config = [[[PicoConfig alloc] init] autorelease];
    return [self initWithConfig:config];
}

- (id)initWithConfig:(PicoConfig *)config {
    self = [super init];
    if (self) {
        self.config = config;
    }
    
    return self;
}

-(id)fromData:(NSData *)data withClass:(Class)clazz {
    NSError *error;
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:data options:0 error:&error];
    
    if (!doc) {
        @throw [NSException exceptionWithName:@"ReaderException" reason:[NSString stringWithFormat:@"fail to parse xml data , Error : %@", error] userInfo:[error userInfo]];
    }
    
    GDataXMLElement *rootElement = [doc rootElement];
    PicoBindingSchema *bs = [PicoBindingSchema fromClass:clazz];
    PicoClassSchema *cs = bs.classSchema;
    NSString *xmlName = cs.xmlName;
    if ([xmlName length] == 0) {
        xmlName = bs.className;
    }
    NSString *rootName = [rootElement localName];
    if (![xmlName isEqualToString: rootName]) {
		@throw [NSException exceptionWithName:@"ReaderException" reason:[NSString stringWithFormat:@"root name mismatch , xml name : %@, root name : %@", xmlName, rootName] userInfo:nil];
	}
    
    id obj = [clazz new];
    
    [self read: obj element: rootElement];
    
    [obj autorelease];
    [doc release];
    
    return obj;
}

-(void)read:(id)value element:(GDataXMLElement *)element {
    PicoBindingSchema *bs = [PicoBindingSchema fromObject:value];
    
    // read xml attributes
    NSDictionary *attrMap = bs.xml2AttributeSchemaMapping;
    if(attrMap.count > 0) {
        for(NSString *xmlName in attrMap) {
            PicoPropertySchema *ps = [attrMap objectForKey:xmlName];
            GDataXMLNode *attrNode = [element attributeForName:xmlName];
            if (attrNode) {
                NSString *attrValue = [attrNode stringValue];
                if ([attrValue length] > 0) {
                    id objValue = [PicoConverter read:attrValue withType:ps.propertyType];
                    if (objValue) {
                        [value setValue:objValue forKey: ps.propertyName];
                    }
                }
            }
        }
    }
    
    // read xml value if any
    PicoPropertySchema *valuePs = bs.valueSchema;
    if (valuePs) {
        NSString *text = [element stringValue];
        if (text.length > 0) {
            id objValue = [PicoConverter read: text withType: valuePs.propertyType];
            if (objValue) {
                [value setValue: objValue forKey: valuePs.propertyName];
            }
        }
        
        return; // if xml value presents, no need to handle elements
    }
    
    // read xml element
    NSDictionary *elementMap = bs.xml2ElementSchemaMapping;
    if (elementMap.count > 0) {
        for(NSString *xmlName in elementMap) {
            PicoPropertySchema *ps = [elementMap objectForKey:xmlName];
            NSMutableArray *childElements = [[NSMutableArray alloc] init];
            NSArray *children = [element children];
            for(GDataXMLNode *node in children) {
                if ([node kind] == GDataXMLElementKind && [ps.xmlName isEqualToString:[node localName]]) {
                    [childElements addObject:node];
                }
            }
            
            if (childElements.count > 0) {
                if ([ps.propertyKind isEqualToString:PICO_KIND_ELEMENT]) {
                    GDataXMLElement *childElement = [childElements objectAtIndex:0];
                    // primitive
                    if ([PicoConverter isPrimitive:ps.propertyType]) {
                        NSString *xmlValue = [childElement stringValue];
                        if (xmlValue.length > 0) {
                            id objValue = [PicoConverter read: xmlValue withType: ps.propertyType];
                            if (objValue) {
                                [value setValue: objValue forKey: ps.propertyName];
                            }
                        }
                    } else if ([ps.propertyType isEqualToString:PICO_TYPE_OBJECT]) { // object
                        id obj = [ps.clazz new];
                        [value setValue:obj forKey: ps.propertyName];
                        [obj release];
                        [self read: obj element: childElement];
                    }
                } else if ([ps.propertyKind isEqualToString: PICO_KIND_ELEMENT_ARRAY]) {
                    NSMutableArray *array = [[NSMutableArray alloc] init];
                    [value setValue:array forKey: ps.propertyName];
                    [array release];
                    for(GDataXMLElement *childElement in childElements) {
                        // primitive
                        if ([PicoConverter isPrimitive: ps.propertyType]) {
                            NSString *xmlValue = [childElement stringValue];
                            if (xmlValue.length > 0) {
                                id objValue = [PicoConverter read:xmlValue withType:ps.propertyType];
                                [array addObject: objValue];
                            }
                        } else if ([ps.propertyType isEqualToString:PICO_TYPE_OBJECT]) { // object
                            id obj = [ps.clazz new];
                            [array addObject:obj];
                            [obj release];
                            [self read: obj element: childElement];
                        }
                    }
                }
            }
            
            [childElements release];
        }
    }
    
    // read xml any element
    PicoPropertySchema *anyPs = bs.anyElementSchema;
    if (anyPs) {
        if (anyPs.clazz) { // target class specified
            PicoBindingSchema *bs = [PicoBindingSchema fromClass:anyPs.clazz];
            PicoClassSchema *cs = [bs classSchema];;
            NSString *xmlName = cs.xmlName;
            if ([xmlName length] == 0) {
                xmlName = bs.className;
            }
            NSMutableArray *childElements = [[NSMutableArray alloc] init];
            NSArray *children = [element children];
            for(GDataXMLNode *node in children) {
                if ([node kind] == GDataXMLElementKind && [xmlName isEqualToString:[node localName]]) {
                    [childElements addObject:node];
                }
            }
            if (childElements.count > 0) {
                NSMutableArray *array = [[NSMutableArray alloc] init];
                [value setValue:array forKey: anyPs.propertyName];
                [array release];
                for(GDataXMLElement *childElement in childElements) {
                    id obj = [anyPs.clazz new];
                    [array addObject:obj];
                    [obj release];
                    [self read: obj element: childElement];
                }

            }
            [childElements release];
        } else {
            NSMutableArray *anyChildElements = [[NSMutableArray alloc] init];
            NSArray *children = [element children];
            
            for(GDataXMLNode *node in children) {
                if ([node kind] == GDataXMLElementKind) {
                    if (elementMap.count == 0 || ![elementMap objectForKey:[node localName]]) {
                        PicoXMLElement *picoElement = [self convertToPicoElement:(GDataXMLElement *)node];
                        [anyChildElements addObject:picoElement];
                        [picoElement release];
                    }
                }
            }
            [value setValue:anyChildElements forKey: anyPs.propertyName];
            [anyChildElements release];
        }
    }
}

-(PicoXMLElement *)convertToPicoElement:(GDataXMLElement *)element {
    PicoXMLElement *picoElement = [[PicoXMLElement alloc] init];
    picoElement.name = element.localName;
    picoElement.nsUri = element.URI;
    picoElement.value = element.stringValue;
    if (element.attributes) {
        NSMutableDictionary *attrDic = [[NSMutableDictionary alloc] init];
        picoElement.attributes = attrDic;
        [attrDic release];
        for(GDataXMLNode *attr in element.attributes) {
            [attrDic setObject:attr.stringValue forKey:attr.localName];
        }
    }
    if (element.children) {
        NSMutableArray *childrenArray = [[NSMutableArray alloc] init];
        picoElement.children = childrenArray;
        [childrenArray release];
        for(GDataXMLNode *node in element.children) {
            if ([node kind] == GDataXMLElementKind) {
                PicoXMLElement *childPicoElement = [self convertToPicoElement:(GDataXMLElement *)node];
                childPicoElement.parent = picoElement;
                [childrenArray addObject: childPicoElement];
                [childPicoElement release];
            }
        }
    }
    return picoElement;
}


-(id)fromString:(NSString *)string withClass:(Class)clazz {
    NSData *data = [string dataUsingEncoding: CFStringConvertEncodingToNSStringEncoding(CFStringConvertIANACharSetNameToEncoding((CFStringRef)self.config.encoding)) allowLossyConversion:NO];
    
    return [self fromData:data withClass:clazz];
}


-(void) dealloc {
    self.config = nil;
    [super dealloc];
}

@end
