//
//  PicoBindingSchema.m
//  pico
//
//  Created by bulldog on 13-2-25.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoBindingSchema.h"
#import "PicoConstants.h"
#import "PicoPropertySchema.h"
#import "PicoBindable.h"
#import "PicoCache.h"
#import "OrderedDictionary.h"

@implementation PicoBindingSchema

@synthesize classSchema = _classSchema;
@synthesize xml2AttributeSchemaMapping = _xml2AttributeSchemaMapping;
@synthesize xml2ElementSchemaMapping = _xml2ElementSchemaMapping;
@synthesize valueSchema = _valueSchema;
@synthesize anyElementSchema = _anyElementSchema;
@synthesize property2ElementSchemaMapping = _property2ElementSchemaMapping;
@synthesize property2AttributeSchemaMapping = _property2AttributeSchemaMapping;
@synthesize className = _className;

static PicoCache *schemaCache = nil;

static const int CACHE_SIZE = 100;

+ (void) initialize {
	schemaCache = [[PicoCache alloc] initWithCountLimit:CACHE_SIZE];
}

-(id)initWith: (Class)clazz {
	self = [super init];
	if (self != nil) {
		
		_xml2AttributeSchemaMapping = [[NSMutableDictionary alloc] init];
		_xml2ElementSchemaMapping = [[NSMutableDictionary alloc] init];
		_property2ElementSchemaMapping = [[OrderedDictionary alloc] init];
		_property2AttributeSchemaMapping = [[OrderedDictionary alloc] init];
		
		_className = [NSStringFromClass(clazz) retain];
		
		if (![clazz conformsToProtocol:@protocol(PicoBindable)]) {
			@throw [NSException exceptionWithName:@"BindingException" reason:[NSString stringWithFormat:@"class : %@ does not conform to PicoBindable protocol", self.className] userInfo:nil];
		}
		
		_classSchema = [clazz getClassMetaData];
		[_classSchema retain];
		
		NSMutableDictionary *propertyMetaDataMapping = [clazz getPropertyMetaData];
		
		Class parentClazz = [clazz superclass];
		while (parentClazz != [NSObject class]) {
			NSMutableDictionary *parentPropertyMetadataMapping = nil;
			if ([parentClazz conformsToProtocol:@protocol(PicoBindable)]) {
				parentPropertyMetadataMapping = [parentClazz getPropertyMetaData];
				[parentPropertyMetadataMapping addEntriesFromDictionary:propertyMetaDataMapping];
				propertyMetaDataMapping = parentPropertyMetadataMapping;
			} else {
				break;
			}
			parentClazz = [parentClazz superclass];
		}
		
		[self buildMapping:propertyMetaDataMapping];
		
	}
	return self;
}

+(id)fromClass:(Class)clazz {
    PicoBindingSchema *bindingSchema = [schemaCache objectForKey:clazz];
    if (bindingSchema == nil) {
        bindingSchema = [[PicoBindingSchema alloc] initWith: clazz];
        [schemaCache setObject: bindingSchema forKey: clazz];
        [bindingSchema release];
    }
    return bindingSchema;
}

+(id)fromObject:(id)object {
	Class clazz = [object class];
	return [PicoBindingSchema fromClass:clazz];
}

-(void)buildMapping:(NSMutableDictionary *)map {
    if (!map) return;
    
	for (NSString *propertyName in map) {
		PicoPropertySchema *ps = [map objectForKey:propertyName];
		
		if ([[ps propertyKind] isEqualToString:PICO_KIND_ATTRIBUTE]) {
			[_property2AttributeSchemaMapping setObject:ps forKey:propertyName];
			[_xml2AttributeSchemaMapping setObject:ps forKey:[ps xmlName]];
		} else if ([[ps propertyKind] isEqualToString:PICO_KIND_ELEMENT] ||
				   [[ps propertyKind] isEqualToString:PICO_KIND_ELEMENT_ARRAY]) {
			[_property2ElementSchemaMapping setObject:ps forKey:propertyName];
			[_xml2ElementSchemaMapping setObject:ps forKey:[ps xmlName]];
		} else if ([[ps propertyKind] isEqualToString:PICO_KIND_VALUE]) {
			_valueSchema = ps;
			[ps retain];
		} else if ([[ps propertyKind] isEqualToString:PICO_KIND_ANY_ELEMENT]) {
            _anyElementSchema = ps;
            [ps retain];
        }
		
	}
}

-(void)dealloc {
	[_classSchema release];
	[_xml2AttributeSchemaMapping release];
	[_xml2ElementSchemaMapping release];
	[_valueSchema release];
    [_anyElementSchema release];
	[_property2ElementSchemaMapping release];
	[_property2AttributeSchemaMapping release];
	[_className release];
	
	[super dealloc];
}

@end
