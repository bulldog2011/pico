//
//  Bulldog.m
//  picoTest
//
//  Created by bulldog on 13-2-25.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "Bulldog.h"
#import "PicoClassSchema.h"
#import "PicoPropertySchema.h"
#import "PicoConstants.h"
#import "OrderedDictionary.h"

@implementation Bulldog

@synthesize name;
@synthesize age;
@synthesize color;
@synthesize desc;
@synthesize children;

+(PicoClassSchema *)getClassMetaData {
	PicoClassSchema *cs = [[PicoClassSchema alloc] initWithXmlName:@"MyPet" nsUri:@"a.b.c"];
	[cs autorelease];
	return cs;
}

+(NSMutableDictionary *)getPropertyMetaData {
	NSMutableDictionary *map = [OrderedDictionary dictionary];
	PicoPropertySchema *ps = nil;
    
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"Name" propertyName:@"name" type:PICO_TYPE_STRING clazz:nil];
	[map setObject:ps forKey:@"name"];
	[ps release];
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ATTRIBUTE xmlName:@"Age" propertyName:@"age" type:PICO_TYPE_INT clazz:nil];
	[map setObject:ps forKey:@"age"];
	[ps release];
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ATTRIBUTE xmlName:@"Color" propertyName:@"color" type:PICO_TYPE_ENUM clazz:nil];
	[map setObject:ps forKey:@"color"];
	[ps release];
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"Desc" propertyName:@"desc" type:PICO_TYPE_STRING clazz:nil];
	[map setObject:ps forKey:@"desc"];
	[ps release];
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT_ARRAY xmlName:@"Children" propertyName:@"children" type:PICO_TYPE_OBJECT clazz:[Bulldog class]];
	[map setObject:ps forKey:@"children"];
	[ps release];
	
	return map;
}

-(void)dealloc {
	
	self.name = nil;
	self.age = nil;
	self.color = nil;
	self.desc = nil;
	self.children = nil;
	[super dealloc];
	
}

@end
