//
//  ArrayEntryTest.m
//  picoTest
//
//  Created by bulldog on 13-2-27.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoTestBase.h"
#import "OrderedDictionary.h"

@interface Entry : NSObject <PicoBindable>
{
@private
	NSNumber *id;
	NSString *text;
}

@property (nonatomic, retain) NSNumber *id;
@property (nonatomic, retain) NSString *text;

@end

@implementation Entry

@synthesize id;
@synthesize text;

+(PicoClassSchema *)getClassMetaData {
	PicoClassSchema *cs =
	[[PicoClassSchema alloc] initWithXmlName: @"Entry" nsUri: nil];
	[cs autorelease];
	return cs;
}

+(NSMutableDictionary *)getPropertyMetaData {
	NSMutableDictionary *map = [OrderedDictionary dictionary];
	PicoPropertySchema *ps = nil;
	
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"text" propertyName:@"text" type:PICO_TYPE_STRING clazz:nil];
	[map setObject:ps forKey:@"text"];
	[ps release];
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ATTRIBUTE xmlName:@"id" propertyName:@"id" type:PICO_TYPE_INT clazz:nil];
	[map setObject:ps forKey:@"id"];
	[ps release];
	
	return map;
}

-(void)dealloc {
	self.id = nil;
	self.text = nil;
	[super dealloc];
}
@end

@interface ExamplePrimitiveArray : NSObject <PicoBindable>
{
@private
	NSArray *list;
}

@property (nonatomic, retain) NSArray *list;

@end

@implementation ExamplePrimitiveArray

@synthesize list;

+(PicoClassSchema *)getClassMetaData {
	PicoClassSchema *cs =
	[[PicoClassSchema alloc] initWithXmlName: @"examplePrimitiveArray" nsUri: nil];
	[cs autorelease];
	return cs;
}

+(NSMutableDictionary *)getPropertyMetaData {
	NSMutableDictionary *map = [OrderedDictionary dictionary];
	PicoPropertySchema *ps = nil;
	
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT_ARRAY xmlName:@"substitute" propertyName:@"list" type:PICO_TYPE_CHAR clazz:nil];
	[map setObject:ps forKey:@"list"];
	[ps release];
	
	return map;
}

-(void)dealloc {
	self.list = nil;
	[super dealloc];
}
@end

@interface ExampleArray : NSObject <PicoBindable>
{
@private
	NSArray *list;
}

@property (nonatomic, retain) NSArray *list;

@end

@implementation ExampleArray

@synthesize list;

+(PicoClassSchema *)getClassMetaData {
	PicoClassSchema *cs = [[PicoClassSchema alloc] initWithXmlName: @"exampleArray" nsUri: nil];
	[cs autorelease];
	return cs;
}

+(NSMutableDictionary *)getPropertyMetaData {
	NSMutableDictionary *map = [OrderedDictionary dictionary];
	PicoPropertySchema *ps = nil;
	
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT_ARRAY xmlName:@"substitute" propertyName:@"list" type:PICO_TYPE_OBJECT clazz:[Entry class]];
	[map setObject:ps forKey:@"list"];
	[ps release];
	
	return map;
}

-(void)dealloc {
	self.list = nil;
	[super dealloc];
}
@end

@interface ArrayEntryTest : PicoTestBase
@end

@implementation ArrayEntryTest

static const NSString *LIST = @"<?xml version=\"1.0\"?>\
    <exampleArray>\
        <substitute id='1'>\
            <text>one</text>\
        </substitute>\
        <substitute id='2'>\
            <text>two</text>\
        </substitute>\
        <substitute id='3'>\
            <text>three</text>\
        </substitute>\
    </exampleArray>";

static const NSString *PRIMITIVE_LIST = @"<?xml version=\"1.0\"?>\
    <examplePrimitiveArray>\
        <substitute>a</substitute>\
        <substitute>b</substitute>\
        <substitute>c</substitute>\
        <substitute>d</substitute>\
    </examplePrimitiveArray>";

-(void)testExampleArray {
	NSData *xmlData = [LIST dataUsingEncoding: NSUTF8StringEncoding];
	
	ExampleArray *ea = [xmlReader fromData:xmlData withClass:[ExampleArray class]];
	
	//GHTestLog(@"number of entry : %i", [ec.list count]);
	Entry *e1 = [ea.list objectAtIndex:0];
	GHAssertTrue([e1.id intValue] == 1, nil);
	GHAssertEqualStrings(e1.text, @"one", nil);
	Entry *e3 = [ea.list objectAtIndex:2];
	GHAssertTrue([e3.id intValue] == 3, nil);
	GHAssertEqualStrings(e3.text, @"three", nil);
	
	xmlData = [xmlWriter toData:ea];
	
	NSString *xmlString = [[NSString alloc] initWithData:xmlData encoding:NSUTF8StringEncoding];
	
	GHTestLog(@"marshal result : %@", xmlString);
	
	[xmlString release];
	
	
	ea = [xmlReader fromData:xmlData withClass:[ExampleArray class]];
	Entry *e2 = [ea.list objectAtIndex:1];
	GHAssertTrue([e2.id intValue] == 2, nil);
	GHAssertEqualStrings(e2.text, @"two", nil);
	
}

-(void)testPrimitiveExampleArray {
	NSData *xmlData = [PRIMITIVE_LIST dataUsingEncoding: NSUTF8StringEncoding];
	
	ExamplePrimitiveArray *epa = [xmlReader fromData:xmlData withClass:[ExamplePrimitiveArray class]];
	
	GHTestLog(@"number of entry : %i", [epa.list count]);
	NSString *s1 = [epa.list objectAtIndex:0];
	GHAssertEqualStrings(s1, @"a", nil);
	NSString *s3 = [epa.list objectAtIndex:2];
	GHAssertEqualStrings(s3, @"c", nil);
	
	xmlData = [xmlWriter toData:epa];
	
	NSString *xmlString = [[NSString alloc] initWithData:xmlData encoding:NSUTF8StringEncoding];
	
	GHTestLog(@"marshal result : %@", xmlString);
	
	[xmlString release];
	
	
	epa = [xmlReader fromData:xmlData withClass:[ExamplePrimitiveArray class]];
	NSString *s4 = [epa.list objectAtIndex:3];
	GHAssertEqualStrings(s4, @"d", nil);
}


@end
