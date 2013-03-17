//
//  PicoXMLWriter.m
//  pico
//
//  Created by bulldog on 13-2-26.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoXMLWriter.h"
#import "PicoConverter.h"
#import "XMLWriter.h"
#import "PicoConfig.h"
#import "PicoBindingSchema.h"
#import "PicoClassSchema.h"
#import "PicoPropertySchema.h"
#import "PicoConstants.h"
#import "PicoXMLElement.h"
#import "PicoBindable.h"

@implementation PicoXMLWriter

@synthesize config = _config;

- (id)init {
    return [self initWithConfig:[[[PicoConfig alloc] init] autorelease]];
}

- (id)initWithConfig:(PicoConfig *)config {
    self = [super init];
    if (self) {
        self.config = config;
    }
    
    return self;
}

-(NSData *)toData:(id)obj {
    
    NSString *xmlString = [[self toString:obj] retain];
    
    NSData *data = [xmlString dataUsingEncoding: CFStringConvertEncodingToNSStringEncoding(CFStringConvertIANACharSetNameToEncoding((CFStringRef)self.config.encoding)) allowLossyConversion:NO];
    
    [xmlString release];
    
    return data;
    
}

-(NSString *)toString:(id)obj {
    
    
    if (obj == nil) {
		@throw [NSException exceptionWithName:@"WriterException" reason:@"Can't write nil object." userInfo:nil];
	}
    
    XMLWriter *xmlWriter = [[XMLWriter alloc] init];
    _autoPrefixCount = 0;
    
    [xmlWriter writeStartDocumentWithEncodingAndVersion:self.config.encoding version:@"1.0"];
    
    
    PicoBindingSchema *bindingSchema = [PicoBindingSchema fromObject:obj];
    PicoClassSchema *classSchema = [bindingSchema classSchema];
    NSString *xmlName = classSchema.xmlName;
    NSString *namespace = classSchema.nsURI;
    if (!xmlName) { // workaround, in case xml name is not provided in class schema, use class name instead
        xmlName = bindingSchema.className;
    }
    
    if ([namespace length] != 0) {
        [xmlWriter setDefaultNamespace:namespace]; // bind to default namespace
    }
    
    [xmlWriter writeStartElementWithNamespace:namespace localName:xmlName];
    
    [self writeObject:xmlWriter source:obj];
    
    [xmlWriter writeEndElementWithNamespace:namespace localName:xmlName];
    
    [xmlWriter writeEndDocument];
    
    NSString *xmlString = [xmlWriter toString];
    xmlString = [NSMutableString stringWithString:xmlString];
    
    [xmlWriter release];
    
    return xmlString;
    
}

-(void)writeObject:(XMLWriter *)xmlWriter source:(id)source {
    PicoBindingSchema *bindingSchema = [PicoBindingSchema fromObject:source];
    NSString *namespace = nil;
    PicoClassSchema *classSchema = [bindingSchema classSchema];
    if (classSchema) {
        namespace = classSchema.nsURI;
    }
    
    [self writeAttributes:xmlWriter source:source schema:bindingSchema];
    
    [self writeValue:xmlWriter source:source schema:bindingSchema];
    
    // automatic prefixing
    if (namespace && ![xmlWriter getPrefix:namespace]) {
        NSString *prefix = [NSString stringWithFormat:@"ns%d", _autoPrefixCount++];
        [xmlWriter setPrefix:prefix namespaceURI:namespace];
    }
    [self writeElements:xmlWriter source:source schema:bindingSchema namespace:namespace];
    
    [self writeAnyElements:xmlWriter source:source schema:bindingSchema];
}

-(void)writeAttributes:(XMLWriter *)xmlWriter source:(id)source schema:(PicoBindingSchema *)bindingSchema {
    NSDictionary *map = bindingSchema.property2AttributeSchemaMapping;
    if (map.count > 0) {
        for(NSString *propertyName in map) {
            PicoPropertySchema *ps = [map objectForKey:propertyName];
            id propertyValue = [source valueForKey:propertyName];
            if (propertyValue) {
                NSString *xmlString = [PicoConverter write:propertyValue withType:ps.propertyType];
                if (xmlString.length > 0) {
                    [xmlWriter writeAttribute:ps.xmlName value:xmlString];
                }
            }
        }
    }
}


-(void)writeValue:(XMLWriter *)xmlWriter source:(id)source schema:(PicoBindingSchema *)bindingSchema {
    PicoPropertySchema *valuePs = bindingSchema.valueSchema;
    if (valuePs) {
        id propertyValue = [source valueForKey:valuePs.propertyName];
        NSString *xmlString = [PicoConverter write:propertyValue withType:valuePs.propertyType];
        if (xmlString.length > 0) {
            [xmlWriter writeCharacters:xmlString];
        }
    }
}

-(void)writeAnyElements:(XMLWriter *)xmlWriter source:(id)source schema:(PicoBindingSchema *)bindingSchema {
    PicoPropertySchema *anyPs = bindingSchema.anyElementSchema;
    if(anyPs) {
        NSArray *anyArray = [source valueForKey: anyPs.propertyName];
        if (anyArray) {
            for(id entry in anyArray) {
                if (entry) {
                    if ([entry isMemberOfClass:[PicoXMLElement class]]) {
                        [self writePicoXMLElement:xmlWriter xmlElement:entry];
                    } else if ([entry conformsToProtocol:@protocol(PicoBindable)]) {
                        [self writePicoObject:xmlWriter source:entry];
                    }
                }
            }
        }
    }
}

-(void)writePicoXMLElement:(XMLWriter *)xmlWriter xmlElement:(PicoXMLElement *)element {
    if (!element) return; // to be cautious
    if (element.name) {
        NSString *namespace = element.nsUri;
        if (namespace.length == 0) {
            namespace = nil;
        }
        // automatic prefixing
        if (namespace && ![xmlWriter getPrefix:namespace]) {
            NSString *prefix = [NSString stringWithFormat:@"ns%d", _autoPrefixCount++];
            [xmlWriter setPrefix:prefix namespaceURI:namespace];
        }
        [xmlWriter writeStartElementWithNamespace:namespace localName:element.name];
        if (element.attributes) { // write attributes
            for(NSString *key in element.attributes) {
                NSString *value = [element.attributes valueForKey:key];
                [xmlWriter writeAttribute:key value:value];
            }
        }
        if (element.value) { // write element text
            [xmlWriter writeCharacters:element.value];
        }
        if (element.children) { // write element children
            for(PicoXMLElement *child in element.children) {
                [self writePicoXMLElement:xmlWriter xmlElement:child];
            }
        }
        [xmlWriter writeEndElementWithNamespace:namespace localName:element.name];
    }
}

-(void)writePicoObject:(XMLWriter *)xmlWriter source:(id)source {
    if (!source) return; // to be cautious
    PicoBindingSchema *bindingSchema = [PicoBindingSchema fromObject:source];
    PicoClassSchema *classSchema = [bindingSchema classSchema];
    NSString *xmlName = classSchema.xmlName;
    NSString *namespace = classSchema.nsURI;
    if (!xmlName) { // workaround, in case xml name is not provided in class schema, use class name instead
        xmlName = bindingSchema.className;
    }
    
    // automatic prefixing
    if (namespace && ![xmlWriter getPrefix:namespace]) {
        NSString *prefix = [NSString stringWithFormat:@"ns%d", _autoPrefixCount++];
        [xmlWriter setPrefix:prefix namespaceURI:namespace];
    }
    [xmlWriter writeStartElementWithNamespace:namespace localName:xmlName];
    [self writeObject:xmlWriter source:source];
    [xmlWriter writeEndElementWithNamespace:namespace localName:xmlName];
}


-(void)writeElements:(XMLWriter *)xmlWriter source:(id)source schema:(PicoBindingSchema *)bindingSchema namespace:(NSString *)nsURI  {
    NSDictionary *map = bindingSchema.property2ElementSchemaMapping;
    if (map.count > 0) {
        for(NSString *propertyName in map) {
            PicoPropertySchema *ps = [map objectForKey:propertyName];
            id propertyValue = [source valueForKey:propertyName];
            if (propertyValue) {
                if ([ps.propertyKind isEqualToString:PICO_KIND_ELEMENT]) {
                    [self writeElement:xmlWriter source:propertyValue schema:ps namespace:nsURI];
                }
                // array elements
                else if ([ps.propertyKind isEqualToString:PICO_KIND_ELEMENT_ARRAY]) {
                    NSArray *array = propertyValue;
                    for(id entry in array) {
                        if (entry) {
                            [self writeElement:xmlWriter source:entry schema:ps namespace:nsURI];
                        }
                    }
                }
            }
        }
    }
}

-(void)writeElement:(XMLWriter *)xmlWriter source:(id)source schema:(PicoPropertySchema *)propertySchema namespace:(NSString *)nsURI {
    if (!source) return;
    
    if ([PicoConverter isPrimitive:propertySchema.propertyType]) {
        NSString *xmlString = [PicoConverter write:source withType:propertySchema.propertyType];
        if (xmlString.length > 0) {
            [xmlWriter writeStartElementWithNamespace:nsURI localName:propertySchema.xmlName];
            [xmlWriter writeCharacters:xmlString];
            [xmlWriter writeEndElementWithNamespace:nsURI localName:propertySchema.xmlName];
        }
        return;
    }
    
    if ([propertySchema.propertyType isEqualToString:PICO_TYPE_OBJECT]) {
        [xmlWriter writeStartElementWithNamespace:nsURI localName:propertySchema.xmlName];
        [self writeObject:xmlWriter source:source];
        [xmlWriter writeEndElementWithNamespace:nsURI localName:propertySchema.xmlName];
    }
    
}



-(void) dealloc {
    self.config = nil;
    [super dealloc];
}

@end
