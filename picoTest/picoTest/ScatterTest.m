//
//  ScatterTest.m
//  picoTest
//
//  Created by bulldog on 13-2-28.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoTestBase.h"
#import "OrderedDictionary.h"

@interface TextEntry2 : NSObject <PicoBindable>
{
@private
	NSString *name;
	NSString *version;
	NSString *text;
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *version;
@property (nonatomic, retain) NSString *text;

@end

@implementation TextEntry2

@synthesize name;
@synthesize version;
@synthesize text;

+(PicoClassSchema *)getClassMetaData {
	PicoClassSchema *cs = [[PicoClassSchema alloc] initWithXmlName: @"text" nsUri: nil];
	[cs autorelease];
	return cs;
}

+(NSMutableDictionary *)getPropertyMetaData {
	NSMutableDictionary *map = [OrderedDictionary dictionary];
	PicoPropertySchema *ps = nil;
	
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ATTRIBUTE xmlName:@"name" propertyName:@"name" type:PICO_TYPE_STRING clazz:nil];
	[map setObject:ps forKey:@"name"];
	[ps release];
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ATTRIBUTE xmlName:@"version" propertyName:@"version" type:PICO_TYPE_STRING clazz:nil];
	[map setObject:ps forKey:@"version"];
	[ps release];
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_VALUE xmlName:@"text" propertyName:@"text" type:PICO_TYPE_STRING clazz:nil];
	[map setObject:ps forKey:@"text"];
	[ps release];
	
	return map;
}

-(void)dealloc {
	self.name = nil;
	self.version = nil;
	self.text = nil;
	[super dealloc];
}
@end

@interface InlineTextList : NSObject <PicoBindable>
{
@private
	NSString *message;
	NSArray *numbers;
	NSArray *list;
	NSString *version;
}

@property (nonatomic, retain) NSString *message;
@property (nonatomic, retain) NSArray *numbers;
@property (nonatomic, retain) NSArray *list;
@property (nonatomic, retain) NSString *version;

@end

@implementation InlineTextList

@synthesize message;
@synthesize numbers;
@synthesize list;
@synthesize version;

+(PicoClassSchema *)getClassMetaData {
	PicoClassSchema *cs = [[PicoClassSchema alloc] initWithXmlName: @"test" nsUri: nil];
	[cs autorelease];
	return cs;
}

+(NSMutableDictionary *)getPropertyMetaData {
	NSMutableDictionary *map = [OrderedDictionary dictionary];
	PicoPropertySchema *ps = nil;
	
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"message" propertyName:@"message" type:PICO_TYPE_STRING clazz:nil];
	[map setObject:ps forKey:@"message"];
	[ps release];
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT_ARRAY xmlName:@"numbers" propertyName:@"numbers" type:PICO_TYPE_DOUBLE clazz:nil];
	[map setObject:ps forKey:@"numbers"];
	[ps release];
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT_ARRAY xmlName:@"list" propertyName:@"list" type:PICO_TYPE_OBJECT clazz:[TextEntry2 class]];
	[map setObject:ps forKey:@"list"];
	[ps release];
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ATTRIBUTE xmlName:@"version" propertyName:@"version" type:PICO_TYPE_STRING clazz:nil];
	[map setObject:ps forKey:@"version"];
	[ps release];
	
	return map;
}

-(void)dealloc {
	self.message = nil;
	self.numbers = nil;
	self.list = nil;
	self.version = nil;
	[super dealloc];
}
@end

@interface InlinePrimitiveList : NSObject <PicoBindable>
{
@private
	NSString *message;
	NSArray *list;
	NSString *version;
}

@property (nonatomic, retain) NSString *message;
@property (nonatomic, retain) NSArray *list;
@property (nonatomic, retain) NSString *version;

@end

@implementation InlinePrimitiveList

@synthesize message;
@synthesize list;
@synthesize version;

+(PicoClassSchema *)getClassMetaData {
	PicoClassSchema *cs = [[PicoClassSchema alloc] initWithXmlName: @"test" nsUri: nil];
	[cs autorelease];
	return cs;
}

+(NSMutableDictionary *)getPropertyMetaData {
	NSMutableDictionary *map = [OrderedDictionary dictionary];
	PicoPropertySchema *ps = nil;
	
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"message" propertyName:@"message" type:PICO_TYPE_STRING clazz:nil];
	[map setObject:ps forKey:@"message"];
	[ps release];
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT_ARRAY xmlName:@"list" propertyName:@"list" type:PICO_TYPE_STRING clazz:nil];
	[map setObject:ps forKey:@"list"];
	[ps release];
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ATTRIBUTE xmlName:@"version" propertyName:@"version" type:PICO_TYPE_STRING clazz:nil];
	[map setObject:ps forKey:@"version"];
	[ps release];
	
	return map;
}

-(void)dealloc {
	self.message = nil;
	self.list = nil;
	self.version = nil;
	[super dealloc];
}
@end

@interface ScatterTest : PicoTestBase

@end

@implementation ScatterTest

static const NSString *INLINE_LIST =
    @"<test version='ONE'>\
        <list name='a' version='ONE'>Example 1</list>\
        <message>Some example message</message>\
        <list name='b' version='TWO'>Example 2</list>\
        <numbers>1.0</numbers>\
        <numbers>2.0</numbers>\
        <list name='c' version='THREE'>Example 3</list>\
        <numbers>3.0</numbers>\
    </test>";

static const NSString *INLINE_PRIMITIVE_LIST =
    @"<test version='ONE'>\
        <list>Example 1</list>\
        <message>Some example message</message>\
        <list>Example 2</list>\
        <list>Example 3</list>\
    </test>";

static const NSString *INLINE_NAMED_LIST =
    @"<test version='ONE'>\
        <include name='1' file='1.txt'/>\
        <exclude name='2' file='2.txt'/>\
        <exclude name='3' file='3.txt'/>\
        <include name='4' file='4.txt'/>\
        <exclude name='5' file='5.txt'/>\
    </test>";

-(void)testList {
	
	NSData *xmlData = [INLINE_LIST dataUsingEncoding: NSUTF8StringEncoding];
	
	InlineTextList *itl = [xmlReader fromData:xmlData withClass:[InlineTextList class]];
	
	GHAssertEqualStrings(itl.version, @"ONE", nil);
	GHAssertEqualStrings(itl.message, @"Some example message", nil);
	TextEntry2 *te = [itl.list objectAtIndex:1];
	GHAssertEqualStrings(te.version, @"TWO", nil);
	GHAssertEqualStrings(te.name, @"b", nil);
	GHAssertEqualStrings(te.text, @"Example 2", nil);
	
	NSNumber *num = [itl.numbers objectAtIndex:2];
    
	GHTestLog(@"double value %f", [num doubleValue]);
	GHAssertTrue([num doubleValue] == 3.0, nil);
	
	
	xmlData = [xmlWriter toData:itl];
	
	NSString *xmlString = [[[NSString alloc] initWithData:xmlData encoding:NSUTF8StringEncoding] autorelease];
	
	GHTestLog(@"write result : %@", xmlString);
	
	itl = [xmlReader fromData:xmlData withClass:[InlineTextList class]];
	GHAssertEqualStrings(itl.version, @"ONE", nil);
	GHAssertEqualStrings(itl.message, @"Some example message", nil);
	te = [itl.list objectAtIndex:1];
	GHAssertEqualStrings(te.version, @"TWO", nil);
	GHAssertEqualStrings(te.name, @"b", nil);
	GHAssertEqualStrings(te.text, @"Example 2", nil);
	
	num = [itl.numbers objectAtIndex:2];
	
	GHTestLog(@"double value %f", [num doubleValue]);
	GHAssertTrue([num doubleValue] == 3.0, nil);
    
}

-(void)testPrimitiveList {
	NSData *xmlData = [INLINE_LIST dataUsingEncoding: NSUTF8StringEncoding];
	
	InlinePrimitiveList *ipl = [xmlReader fromData:xmlData withClass:[InlinePrimitiveList class]];
	GHAssertEqualStrings(ipl.version, @"ONE", nil);
	GHAssertEqualStrings(ipl.message, @"Some example message", nil);
	
	GHAssertEqualStrings([ipl.list objectAtIndex:2], @"Example 3", nil);
	
	xmlData = [xmlWriter toData:ipl];
	
	NSString *xmlString = [[[NSString alloc] initWithData:xmlData encoding:NSUTF8StringEncoding] autorelease];
	
	GHTestLog(@"write result : %@", xmlString);
	
	ipl = [xmlReader fromData:xmlData withClass:[InlinePrimitiveList class]];
	GHAssertEqualStrings([ipl.list objectAtIndex:1], @"Example 2", nil);
	
}

@end
