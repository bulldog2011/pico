//
//  BindingSchemaTest.m
//  picoTest
//
//  Created by bulldog on 13-2-25.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import <GHUnitIOS/GHUNit.h>
#import "PicoBindingSchema.h"
#import "PicoConstants.h"
#import "PicoClassSchema.h"
#import "PicoPropertySchema.h"
#import "Bulldog.h"
#import "ChineseBulldog.h"

@interface BindingSchemaTest : GHTestCase 

@end

@implementation BindingSchemaTest

-(void)testFromClass {
	PicoBindingSchema *bo = [PicoBindingSchema fromClass:[Bulldog class]];
	
	GHAssertEqualStrings([bo className], @"Bulldog", nil);
	
	PicoClassSchema *cs = bo.classSchema;
	GHAssertNotNil(cs, nil);
	GHAssertEqualStrings([cs xmlName], @"MyPet", nil);
	GHAssertEqualStrings([cs nsURI], @"a.b.c", nil);
	
	NSMutableDictionary *map = bo.property2ElementSchemaMapping;
	
	GHAssertTrue([map count] == 3, nil);
	PicoPropertySchema *ps = [map objectForKey:@"name"];
	GHAssertNotNil(ps, nil);
	GHAssertEqualStrings([ps xmlName], @"Name", nil);
	GHAssertEqualStrings([ps propertyKind], PICO_KIND_ELEMENT, nil);
	GHAssertEqualStrings([ps propertyName], @"name", nil);
	GHAssertEqualStrings([ps propertyType], PICO_TYPE_STRING, nil);
	GHAssertNil([ps clazz], nil);
	
	ps = [map objectForKey:@"desc"];
	GHAssertNotNil(ps, nil);
	GHAssertEqualStrings([ps xmlName], @"Desc", nil);
	GHAssertEqualStrings([ps propertyKind], PICO_KIND_ELEMENT, nil);
	GHAssertEqualStrings([ps propertyName], @"desc", nil);
	GHAssertEqualStrings([ps propertyType], PICO_TYPE_STRING, nil);
	GHAssertNil([ps clazz], nil);
	
	ps = [map objectForKey:@"children"];
	GHAssertNotNil(ps, nil);
	GHAssertEqualStrings([ps xmlName], @"Children", nil);
	GHAssertEqualStrings([ps propertyKind], PICO_KIND_ELEMENT_ARRAY, nil);
	GHAssertEqualStrings([ps propertyName], @"children", nil);
	GHAssertEqualStrings([ps propertyType], PICO_TYPE_OBJECT, nil);
	GHAssertEquals([ps clazz], [Bulldog class], nil);
	
	map = bo.xml2ElementSchemaMapping;
	
	ps = [map objectForKey:@"Name"];
	GHAssertNotNil(ps, nil);
	GHAssertEqualStrings([ps xmlName], @"Name", nil);
	GHAssertEqualStrings([ps propertyKind], PICO_KIND_ELEMENT, nil);
	GHAssertEqualStrings([ps propertyName], @"name", nil);
	GHAssertEqualStrings([ps propertyType], PICO_TYPE_STRING, nil);
	GHAssertNil([ps clazz], nil);
	
	ps = [map objectForKey:@"Desc"];
	GHAssertNotNil(ps, nil);
	GHAssertEqualStrings([ps xmlName], @"Desc", nil);
	GHAssertEqualStrings([ps propertyKind], PICO_KIND_ELEMENT, nil);
	GHAssertEqualStrings([ps propertyName], @"desc", nil);
	GHAssertEqualStrings([ps propertyType], PICO_TYPE_STRING, nil);
	GHAssertNil([ps clazz], nil);
	
	ps = [map objectForKey:@"Children"];
	GHAssertNotNil(ps, nil);
	GHAssertEqualStrings([ps xmlName], @"Children", nil);
	GHAssertEqualStrings([ps propertyKind], PICO_KIND_ELEMENT_ARRAY, nil);
	GHAssertEqualStrings([ps propertyName], @"children", nil);
	GHAssertEqualStrings([ps propertyType], PICO_TYPE_OBJECT, nil);
	GHAssertEquals([ps clazz], [Bulldog class], nil);
	
	map = bo.property2AttributeSchemaMapping;
	
	ps = [map objectForKey:@"age"];
	GHAssertNotNil(ps, nil);
	GHAssertEqualStrings([ps xmlName], @"Age", nil);
	GHAssertEqualStrings([ps propertyKind], PICO_KIND_ATTRIBUTE, nil);
	GHAssertEqualStrings([ps propertyName], @"age", nil);
	GHAssertEqualStrings([ps propertyType], PICO_TYPE_INT, nil);
	GHAssertNil([ps clazz], nil);
	
	ps = [map objectForKey:@"color"];
	GHAssertNotNil(ps, nil);
	GHAssertEqualStrings([ps xmlName], @"Color", nil);
	GHAssertEqualStrings([ps propertyKind], PICO_KIND_ATTRIBUTE, nil);
	GHAssertEqualStrings([ps propertyName], @"color", nil);
	GHAssertEqualStrings([ps propertyType], PICO_TYPE_ENUM, nil);
	GHAssertNil([ps clazz], nil);
	
	map = bo.xml2AttributeSchemaMapping;
	
	ps = [map objectForKey:@"Age"];
	GHAssertNotNil(ps, nil);
	GHAssertEqualStrings([ps xmlName], @"Age", nil);
	GHAssertEqualStrings([ps propertyKind], PICO_KIND_ATTRIBUTE, nil);
	GHAssertEqualStrings([ps propertyName], @"age", nil);
	GHAssertEqualStrings([ps propertyType], PICO_TYPE_INT, nil);
	GHAssertNil([ps clazz], nil);
	
	ps = [map objectForKey:@"Color"];
	GHAssertNotNil(ps, nil);
	GHAssertEqualStrings([ps xmlName], @"Color", nil);
	GHAssertEqualStrings([ps propertyKind], PICO_KIND_ATTRIBUTE, nil);
	GHAssertEqualStrings([ps propertyName], @"color", nil);
	GHAssertEqualStrings([ps propertyType], PICO_TYPE_ENUM, nil);
	GHAssertNil([ps clazz], nil);
}

-(void)testFromObject {
	Bulldog *dog = [[[Bulldog alloc] init] autorelease];
	
	PicoBindingSchema *bo = [PicoBindingSchema fromObject:dog];
	
	GHAssertEqualStrings([bo className], @"Bulldog", nil);
	
	PicoClassSchema *cs = bo.classSchema;
	GHAssertNotNil(cs, nil);
	GHAssertEqualStrings([cs xmlName], @"MyPet", nil);
	GHAssertEqualStrings([cs nsURI], @"a.b.c", nil);
	
	NSMutableDictionary *map = bo.property2ElementSchemaMapping;
	
	GHAssertTrue([map count] == 3, nil);
	PicoPropertySchema *ps = [map objectForKey:@"name"];
	GHAssertNotNil(ps, nil);
	GHAssertEqualStrings([ps xmlName], @"Name", nil);
	GHAssertEqualStrings([ps propertyKind], PICO_KIND_ELEMENT, nil);
	GHAssertEqualStrings([ps propertyName], @"name", nil);
	GHAssertEqualStrings([ps propertyType], PICO_TYPE_STRING, nil);
	GHAssertNil([ps clazz], nil);
	
	ps = [map objectForKey:@"desc"];
	GHAssertNotNil(ps, nil);
	GHAssertEqualStrings([ps xmlName], @"Desc", nil);
	GHAssertEqualStrings([ps propertyKind], PICO_KIND_ELEMENT, nil);
	GHAssertEqualStrings([ps propertyName], @"desc", nil);
	GHAssertEqualStrings([ps propertyType], PICO_TYPE_STRING, nil);
	GHAssertNil([ps clazz], nil);
	
	ps = [map objectForKey:@"children"];
	GHAssertNotNil(ps, nil);
	GHAssertEqualStrings([ps xmlName], @"Children", nil);
	GHAssertEqualStrings([ps propertyKind], PICO_KIND_ELEMENT_ARRAY, nil);
	GHAssertEqualStrings([ps propertyName], @"children", nil);
	GHAssertEqualStrings([ps propertyType], PICO_TYPE_OBJECT, nil);
	GHAssertEquals([ps clazz], [Bulldog class], nil);
	
	map = bo.xml2ElementSchemaMapping;
	
	ps = [map objectForKey:@"Name"];
	GHAssertNotNil(ps, nil);
	GHAssertEqualStrings([ps xmlName], @"Name", nil);
	GHAssertEqualStrings([ps propertyKind], PICO_KIND_ELEMENT, nil);
	GHAssertEqualStrings([ps propertyName], @"name", nil);
	GHAssertEqualStrings([ps propertyType], PICO_TYPE_STRING, nil);
	GHAssertNil([ps clazz], nil);
	
	ps = [map objectForKey:@"Desc"];
	GHAssertNotNil(ps, nil);
	GHAssertEqualStrings([ps xmlName], @"Desc", nil);
	GHAssertEqualStrings([ps propertyKind], PICO_KIND_ELEMENT, nil);
	GHAssertEqualStrings([ps propertyName], @"desc", nil);
	GHAssertEqualStrings([ps propertyType], PICO_TYPE_STRING, nil);
	GHAssertNil([ps clazz], nil);
	
	ps = [map objectForKey:@"Children"];
	GHAssertNotNil(ps, nil);
	GHAssertEqualStrings([ps xmlName], @"Children", nil);
	GHAssertEqualStrings([ps propertyKind], PICO_KIND_ELEMENT_ARRAY, nil);
	GHAssertEqualStrings([ps propertyName], @"children", nil);
	GHAssertEqualStrings([ps propertyType], PICO_TYPE_OBJECT, nil);
	GHAssertEquals([ps clazz], [Bulldog class], nil);
	
	map = bo.property2AttributeSchemaMapping;
	
	ps = [map objectForKey:@"age"];
	GHAssertNotNil(ps, nil);
	GHAssertEqualStrings([ps xmlName], @"Age", nil);
	GHAssertEqualStrings([ps propertyKind], PICO_KIND_ATTRIBUTE, nil);
	GHAssertEqualStrings([ps propertyName], @"age", nil);
	GHAssertEqualStrings([ps propertyType], PICO_TYPE_INT, nil);
	GHAssertNil([ps clazz], nil);
	
	ps = [map objectForKey:@"color"];
	GHAssertNotNil(ps, nil);
	GHAssertEqualStrings([ps xmlName], @"Color", nil);
	GHAssertEqualStrings([ps propertyKind], PICO_KIND_ATTRIBUTE, nil);
	GHAssertEqualStrings([ps propertyName], @"color", nil);
	GHAssertEqualStrings([ps propertyType], PICO_TYPE_ENUM, nil);
	GHAssertNil([ps clazz], nil);
	
	map = bo.xml2AttributeSchemaMapping;
	
	ps = [map objectForKey:@"Age"];
	GHAssertNotNil(ps, nil);
	GHAssertEqualStrings([ps xmlName], @"Age", nil);
	GHAssertEqualStrings([ps propertyKind], PICO_KIND_ATTRIBUTE, nil);
	GHAssertEqualStrings([ps propertyName], @"age", nil);
	GHAssertEqualStrings([ps propertyType], PICO_TYPE_INT, nil);
	GHAssertNil([ps clazz], nil);
	
	ps = [map objectForKey:@"Color"];
	GHAssertNotNil(ps, nil);
	GHAssertEqualStrings([ps xmlName], @"Color", nil);
	GHAssertEqualStrings([ps propertyKind], PICO_KIND_ATTRIBUTE, nil);
	GHAssertEqualStrings([ps propertyName], @"color", nil);
	GHAssertEqualStrings([ps propertyType], PICO_TYPE_ENUM, nil);
	GHAssertNil([ps clazz], nil);
}

-(void)testInheritance {
	
	PicoBindingSchema *bo = [PicoBindingSchema fromClass:[ChineseBulldog class]];
	
	GHAssertEqualStrings([bo className], @"ChineseBulldog", nil);
	
	PicoClassSchema *cs = bo.classSchema;
	GHAssertNotNil(cs, nil);
	GHAssertEqualStrings([cs xmlName], @"CNBulldog", nil);
	GHAssertEqualStrings([cs nsURI], @"x.y.z", nil);
	
    
	NSMutableDictionary *map = bo.property2ElementSchemaMapping;
	
	GHAssertTrue([map count] == 4, nil);
	PicoPropertySchema *ps = [map objectForKey:@"name"];
	GHAssertNotNil(ps, nil);
	GHAssertEqualStrings([ps xmlName], @"Name", nil);
	GHAssertEqualStrings([ps propertyKind], PICO_KIND_ELEMENT, nil);
	GHAssertEqualStrings([ps propertyName], @"name", nil);
	GHAssertEqualStrings([ps propertyType], PICO_TYPE_STRING, nil);
	GHAssertNil([ps clazz], nil);
	
	ps = [map objectForKey:@"desc"];
	GHAssertNotNil(ps, nil);
	GHAssertEqualStrings([ps xmlName], @"Desc", nil);
	GHAssertEqualStrings([ps propertyKind], PICO_KIND_ELEMENT, nil);
	GHAssertEqualStrings([ps propertyName], @"desc", nil);
	GHAssertEqualStrings([ps propertyType], PICO_TYPE_STRING, nil);
	GHAssertNil([ps clazz], nil);
	
	ps = [map objectForKey:@"children"];
	GHAssertNotNil(ps, nil);
	GHAssertEqualStrings([ps xmlName], @"Children", nil);
	GHAssertEqualStrings([ps propertyKind], PICO_KIND_ELEMENT_ARRAY, nil);
	GHAssertEqualStrings([ps propertyName], @"children", nil);
	GHAssertEqualStrings([ps propertyType], PICO_TYPE_OBJECT, nil);
	GHAssertEquals([ps clazz], [Bulldog class], nil);
	
	ps = [map objectForKey:@"native"];
	GHAssertNotNil(ps, nil);
	GHAssertEqualStrings([ps xmlName], @"Native", nil);
	GHAssertEqualStrings([ps propertyKind], PICO_KIND_ELEMENT, nil);
	GHAssertEqualStrings([ps propertyName], @"native", nil);
	GHAssertEqualStrings([ps propertyType], PICO_TYPE_STRING, nil);
	GHAssertNil([ps clazz], nil);
	
    
	map = bo.xml2ElementSchemaMapping;
	
	ps = [map objectForKey:@"Name"];
	GHAssertNotNil(ps, nil);
	GHAssertEqualStrings([ps xmlName], @"Name", nil);
	GHAssertEqualStrings([ps propertyKind], PICO_KIND_ELEMENT, nil);
	GHAssertEqualStrings([ps propertyName], @"name", nil);
	GHAssertEqualStrings([ps propertyType], PICO_TYPE_STRING, nil);
	GHAssertNil([ps clazz], nil);
	
	ps = [map objectForKey:@"Desc"];
	GHAssertNotNil(ps, nil);
	GHAssertEqualStrings([ps xmlName], @"Desc", nil);
	GHAssertEqualStrings([ps propertyKind], PICO_KIND_ELEMENT, nil);
	GHAssertEqualStrings([ps propertyName], @"desc", nil);
	GHAssertEqualStrings([ps propertyType], PICO_TYPE_STRING, nil);
	GHAssertNil([ps clazz], nil);
	
	ps = [map objectForKey:@"Native"];
	GHAssertNotNil(ps, nil);
	GHAssertEqualStrings([ps xmlName], @"Native", nil);
	GHAssertEqualStrings([ps propertyKind], PICO_KIND_ELEMENT, nil);
	GHAssertEqualStrings([ps propertyName], @"native", nil);
	GHAssertEqualStrings([ps propertyType], PICO_TYPE_STRING, nil);
	GHAssertNil([ps clazz], nil);
	
	ps = [map objectForKey:@"Children"];
	GHAssertNotNil(ps, nil);
	GHAssertEqualStrings([ps xmlName], @"Children", nil);
	GHAssertEqualStrings([ps propertyKind], PICO_KIND_ELEMENT_ARRAY, nil);
	GHAssertEqualStrings([ps propertyName], @"children", nil);
	GHAssertEqualStrings([ps propertyType], PICO_TYPE_OBJECT, nil);
	GHAssertEquals([ps clazz], [Bulldog class], nil);
	
	map = bo.property2AttributeSchemaMapping;
	
	ps = [map objectForKey:@"age"];
	GHAssertNotNil(ps, nil);
	GHAssertEqualStrings([ps xmlName], @"Age", nil);
	GHAssertEqualStrings([ps propertyKind], PICO_KIND_ATTRIBUTE, nil);
	GHAssertEqualStrings([ps propertyName], @"age", nil);
	GHAssertEqualStrings([ps propertyType], PICO_TYPE_INT, nil);
	GHAssertNil([ps clazz], nil);
	
	ps = [map objectForKey:@"color"];
	GHAssertNotNil(ps, nil);
	GHAssertEqualStrings([ps xmlName], @"Color", nil);
	GHAssertEqualStrings([ps propertyKind], PICO_KIND_ATTRIBUTE, nil);
	GHAssertEqualStrings([ps propertyName], @"color", nil);
	GHAssertEqualStrings([ps propertyType], PICO_TYPE_ENUM, nil);
	GHAssertNil([ps clazz], nil);
	
	map = bo.xml2AttributeSchemaMapping;
	
	ps = [map objectForKey:@"Age"];
	GHAssertNotNil(ps, nil);
	GHAssertEqualStrings([ps xmlName], @"Age", nil);
	GHAssertEqualStrings([ps propertyKind], PICO_KIND_ATTRIBUTE, nil);
	GHAssertEqualStrings([ps propertyName], @"age", nil);
	GHAssertEqualStrings([ps propertyType], PICO_TYPE_INT, nil);
	GHAssertNil([ps clazz], nil);
	
	ps = [map objectForKey:@"Color"];
	GHAssertNotNil(ps, nil);
	GHAssertEqualStrings([ps xmlName], @"Color", nil);
	GHAssertEqualStrings([ps propertyKind], PICO_KIND_ATTRIBUTE, nil);
	GHAssertEqualStrings([ps propertyName], @"color", nil);
	GHAssertEqualStrings([ps propertyType], PICO_TYPE_ENUM, nil);
	GHAssertNil([ps clazz], nil);
}

@end
