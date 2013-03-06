//
//  PicoXMLReadDelegate.m
//  pico
//
//  Created by bulldog on 13-2-26.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoXMLReadDelegate.h"
#import "PicoBindingSchema.h"
#import "PicoConverter.h"
#import "PicoPropertySchema.h"
#import "PicoClassSchema.h"
#import "PicoConstants.h"
#import "PicoBindable.h"
#import "PicoXMLElement.h"

@implementation PicoXMLReadDelegate

@synthesize helper = _helper;

- (id) initWithHelper:(PicoXMLReadHelper *) helper {
    self = [super init];
	if (self != nil) {
		self.helper = helper;
	}
	return self;
}

- (void) populate:(id) instance withAttributes:(NSDictionary *)attributes {
	PicoBindingSchema *bs = [PicoBindingSchema fromClass:[instance class]];
	NSDictionary *map = [bs xml2AttributeSchemaMapping];
	for (NSString *key in attributes) {
		PicoPropertySchema *ps = [map objectForKey:key];
		if (ps) {
            NSString *attr = [attributes objectForKey:key];
		    id value = [PicoConverter read:attr withType:ps.propertyType];
		    [instance setValue:value forKey:ps.propertyName];
        }
	}
}

- (void) parser:(NSXMLParser *)parser didStartElement:(NSString *) elementName
   namespaceURI:(NSString *)namespaceURI qualifiedName: (NSString *) qName attributes:(NSDictionary *) attrDic {
	
	_helper.depth++;
	[_helper clearBuffer];
	
	if (_helper.depth > [_helper size] + 1) {
		//unexpected xml element, just ignore
		return;
	}
    
    if (_helper.isAnyElement) { // in processing any element
        [self startAnyElement:elementName namespaceURI:namespaceURI attrDic:attrDic];
        return;
    }
	
	id instance = [_helper peek];
	PicoBindingSchema *bs = [PicoBindingSchema fromObject:instance];
	
	if ([_helper isRoot]) { // first time root element mapping
		PicoClassSchema *cs = [bs classSchema];
		NSString *xmlName;
		if (cs == nil || [cs.xmlName length] == 0) {
			xmlName = [bs className];
		} else {
			xmlName = cs.xmlName;
		}
        // simple validation only for root element
		if (![xmlName isEqualToString:elementName]) {
			@throw [NSException
					exceptionWithName:@"ReaderException"
					reason:[NSString stringWithFormat:@"root name mismatch , expected xml name : %@, actual element name : %@", xmlName, elementName]
					userInfo:nil];
		}
		
		if ([attrDic count] > 0) {
			[self populate:instance withAttributes:attrDic];
		}
	} else {
		NSDictionary *schemaMapping = [bs xml2ElementSchemaMapping];
		PicoPropertySchema *ps = [schemaMapping objectForKey:elementName];
        if (!ps) { // check any element with Pico bindable class provided
            ps = [self findAnyPropertySchema:bs elementName:elementName];
        }
		if (ps) {
            NSString *type = nil;
			if ([PICO_KIND_ELEMENT isEqualToString:[ps propertyKind]] ||
                [PICO_KIND_ELEMENT_ARRAY isEqualToString:[ps propertyKind]] ||
                [PICO_KIND_ANY_ELEMENT isEqualToString:[ps propertyKind]]) {
				type = [ps propertyType];
			}
            if (type && ![PicoConverter isPrimitive:type]) {
                if (ps.clazz && [ps.clazz conformsToProtocol:@protocol(PicoBindable)]) {
                    id newInstance = [ps.clazz new];
                    [newInstance autorelease];
                    if ([attrDic count] > 0) {
                        [self populate:newInstance withAttributes:attrDic];
                    }
                    [_helper push:newInstance];
                } 
            }
		} else if (bs.anyElementSchema) { // handle any xml element
            [self startAnyElement:elementName namespaceURI:namespaceURI attrDic:attrDic];
            _helper.isAnyElement = YES;
        }

	}
}

-(void) startAnyElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI attrDic: (NSDictionary *)attrDic {
    PicoXMLElement *element = [[[PicoXMLElement alloc] init] autorelease];
    element.name = elementName;
    element.nsUri = namespaceURI;
    element.attributes = attrDic;
    [_helper push:element];
}

- (PicoPropertySchema *) findAnyPropertySchema:(PicoBindingSchema *)bindingSchema elementName: (NSString *)elementName {
    PicoPropertySchema *anyPs = bindingSchema.anyElementSchema;
    if (anyPs) {
        Class anyClass = anyPs.clazz;
        if (anyClass) {
            PicoBindingSchema *bs = [PicoBindingSchema fromClass:anyClass];
            PicoClassSchema *cs = [bs classSchema];
            NSString *xmlName;
            if (cs == nil || [cs.xmlName length] == 0) {
                xmlName = [bs className];
            } else {
                xmlName = cs.xmlName;
            }
            if ([elementName isEqualToString:xmlName]) {
                return anyPs;
            }
        }
    }
    return nil;
}

- (void) endAndyElement:(NSString *) elementName namespaceURI:(NSString *)namespaceURI {
    
    NSString *xmlData = [NSString stringWithString:_helper.buffer];
    PicoXMLElement *element = [_helper pop];
    if ([xmlData length] > 0) {
        element.value = xmlData;
        [_helper clearBuffer];
    }
    
    id parent = [_helper peek];
    
    if ([parent isMemberOfClass:[PicoXMLElement class]]) {
        PicoXMLElement *parentElement = parent;
        NSMutableArray *children = parentElement.children;
        if (!children) {
            parentElement.children = [NSMutableArray arrayWithObject:element];
        } else {
            [children addObject:element];
        }
        element.parent = parentElement;
        
    } else { // parent is Pico bindable class instance
		PicoBindingSchema *parentBs = [PicoBindingSchema fromObject:parent];
		PicoPropertySchema *parentPs = parentBs.anyElementSchema;
        if (parentPs) {
		  	    NSMutableArray *array = [parent valueForKey:parentPs.propertyName];
			    if (array) {
                    [array addObject:element];
			    } else {
                    array = [NSMutableArray arrayWithObject:element];
				    [parent setValue:array forKey:parentPs.propertyName];
			    }
        }
        
        _helper.isAnyElement = NO;

    }
}

- (void) parser:(NSXMLParser *)parser didEndElement:(NSString *) elementName namespaceURI:(NSString *)namespaceURI qualifiedName: (NSString *)qName {
	if (_helper.depth > [_helper size] + 1) {
		//unexpected xml element, just ignore
		_helper.depth--;
		return;
	}
    
    if (_helper.isAnyElement) { // in processing any element
        [self endAndyElement:elementName namespaceURI:namespaceURI];
        _helper.depth--;
        return;
    }
	
	NSString *xmlData = [NSString stringWithString:_helper.buffer];
	
	if (_helper.depth == [_helper size] + 1) {//handle primitive type
		if ([xmlData length] > 0) {
			id instance = [_helper peek];
			PicoBindingSchema *bs = [PicoBindingSchema fromObject:instance];
			NSDictionary *xml2SchemaMapping = [bs xml2ElementSchemaMapping];
			PicoPropertySchema *ps = [xml2SchemaMapping objectForKey:elementName];
			if (ps) {
				id value = [PicoConverter read:xmlData withType:ps.propertyType];
				if ([PICO_KIND_ELEMENT isEqualToString:ps.propertyKind]) {
					[instance setValue:value forKey:ps.propertyName];
				} else if ([PICO_KIND_ELEMENT_ARRAY isEqualToString:ps.propertyKind]) {
					NSMutableArray *array = [instance valueForKey:ps.propertyName];
					if (array) {
                        [array addObject:value];
					} else {
                        array = [NSMutableArray arrayWithObject:value];
						[instance setValue:array forKey:ps.propertyName];
					}
				}
			}
		}
	} else if (_helper.depth == [_helper size]){//handle object field
		id instance = [_helper pop];
		if ([_helper size] == 0) {// the end
			[_helper push:instance];
			_helper.depth--;
			return;
		}
		if ([xmlData length] > 0) {
			PicoBindingSchema *bs = [PicoBindingSchema fromObject:instance];
			PicoPropertySchema *valueSchema = [bs valueSchema];
			if (valueSchema) {
				id value = [PicoConverter read:xmlData withType:valueSchema.propertyType];
				[instance setValue:value forKey:valueSchema.propertyName];
			}
		}
		
		//xml element or element list case --- set the value to its parent
		id parentInstance = [_helper peek];
		PicoBindingSchema *parentBs = [PicoBindingSchema fromObject:parentInstance];
		NSDictionary *parentXml2SchemaMapping = [parentBs xml2ElementSchemaMapping];
		PicoPropertySchema *parentPs = [parentXml2SchemaMapping objectForKey:elementName];
        if (!parentPs) { // check any element
            parentPs = [self findAnyPropertySchema:parentBs elementName:elementName];
        }
        if (parentPs) {
		    if ([PICO_KIND_ELEMENT isEqualToString:parentPs.propertyKind]) {
			    [parentInstance setValue:instance forKey:parentPs.propertyName];
		    } else if ([PICO_KIND_ELEMENT_ARRAY isEqualToString:parentPs.propertyKind] ||
                       [PICO_KIND_ANY_ELEMENT isEqualToString:parentPs.propertyKind]) {
		  	    NSMutableArray *array = [parentInstance valueForKey:parentPs.propertyName];
			    if (array) {
                    [array addObject:instance];
			    } else {
                    array = [NSMutableArray arrayWithObject:instance];
				    [parentInstance setValue:array forKey:parentPs.propertyName];
			    }
		    }
        }
	}
	_helper.depth--;
}

- (void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if (!string) return;
	[_helper.buffer appendString:string];
}

//- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
//    NSMutableDictionary *userInfo = [NSMutableDictionary dictionaryWithObject:parseError forKey:NSUnderlyingErrorKey];
//	NSNumber *lineNumber = [NSNumber numberWithInteger:parser.lineNumber];
//	NSNumber *columnNumber = [NSNumber numberWithInteger:parser.columnNumber];
//	[userInfo setObject:[NSString stringWithFormat:NSLocalizedString(@"Malformed XML document. Error at line %@:%@.", @""), lineNumber, columnNumber] forKey:NSLocalizedDescriptionKey];
//	[userInfo setObject:lineNumber forKey:@"LineNumber"];
//	[userInfo setObject:columnNumber forKey:@"ColumnNumber"];
//    @throw [NSException
//            exceptionWithName:@"ReaderException"
//            reason:[NSString stringWithFormat:@"error to parse xml, see userInfo for details."]
//            userInfo:userInfo];
//}

- (void) dealloc {
    self.helper = nil;
	[super dealloc];
}

@end
