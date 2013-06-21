//
//  DefaultTest.m
//  picoTest
//
//  Created by bulldog on 13-2-28.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//
#import "PicoTestBase.h"
#import "OrderedDictionary.h"

@interface DefaultTextEntry : NSObject <PicoBindable>
{
@private
	NSString *name;
	NSString *version;
	NSString *text;
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *text;
@property (nonatomic, retain) NSString *version;

@end

@implementation DefaultTextEntry

@synthesize name;
@synthesize text;
@synthesize version;

+(PicoClassSchema *)getClassMetaData {
	PicoClassSchema *cs = [[PicoClassSchema alloc] initWithXmlName: @"textEntry" nsUri: nil];
	[cs autorelease];
	return cs;
}

+(NSMutableDictionary *)getPropertyMetaData {
	NSMutableDictionary *map = [OrderedDictionary dictionary];
	PicoPropertySchema *ps = nil;
	
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ATTRIBUTE xmlName:@"name" propertyName:@"name" type:PICO_TYPE_STRING clazz:nil];
	[map setObject:ps forKey:@"name"];
	[ps release];
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_VALUE xmlName:@"text" propertyName:@"text" type:PICO_TYPE_STRING clazz:nil];
	[map setObject:ps forKey:@"text"];
	[ps release];
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ATTRIBUTE xmlName:@"version" propertyName:@"version" type:PICO_TYPE_STRING clazz:nil];
	[map setObject:ps forKey:@"version"];
	[ps release];
	
	return map;
}

-(void)dealloc {
	self.name = nil;
	self.text = nil;
	self.version = nil;
	[super dealloc];
}
@end

@interface DefaultTextList : NSObject <PicoBindable>
{
@private
	NSArray *list;
	NSString *version;
}

@property (nonatomic, retain) NSArray *list;
@property (nonatomic, retain) NSString *version;

@end

@implementation DefaultTextList

@synthesize list;
@synthesize version;

+(PicoClassSchema *)getClassMetaData {
	PicoClassSchema *cs = [[PicoClassSchema alloc] initWithXmlName: @"defaultTextList" nsUri: nil];
	[cs autorelease];
	return cs;
}

+(NSMutableDictionary *)getPropertyMetaData {
	NSMutableDictionary *map = [OrderedDictionary dictionary];
	PicoPropertySchema *ps = nil;
	
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT_ARRAY xmlName:@"textEntry" propertyName:@"list" type:PICO_TYPE_OBJECT clazz:[DefaultTextEntry class]];
	[map setObject:ps forKey:@"list"];
	[ps release];
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ATTRIBUTE xmlName:@"version" propertyName:@"version" type:PICO_TYPE_STRING clazz:nil];
	[map setObject:ps forKey:@"version"];
	[ps release];
	
	return map;
}

-(void)dealloc {
	self.list = nil;
	self.version = nil;
	[super dealloc];
}
@end

@interface DefaultTest : PicoTestBase

@end

@implementation DefaultTest

static const NSString *SOURCE =
    @"<defaultTextList version='ONE'>\
        <textEntry name='a' version='ONE'>Example 1</textEntry>\
        <textEntry name='b' version='TWO'>Example 2</textEntry>\
        <textEntry name='c' version='THREE'>Example 3</textEntry>\
    </defaultTextList>";

-(void)testList {
	NSData *xmlData = [SOURCE dataUsingEncoding: NSUTF8StringEncoding];
	
	DefaultTextList *dtl = [xmlReader fromData:xmlData withClass:[DefaultTextList class]];
	
	GHTestLog(@"number of entry : %i", [dtl.list count]);
	GHAssertEqualStrings(dtl.version, @"ONE", nil);
	DefaultTextEntry *dte = [dtl.list objectAtIndex:1];
	GHAssertEqualStrings(dte.name, @"b", nil);
	GHAssertEqualStrings(dte.version, @"TWO", nil);
	GHAssertEqualStrings(dte.text, @"Example 2", nil);
	
	xmlData = [xmlWriter toData:dtl];
	
	NSString *xmlString = [[NSString alloc] initWithData:xmlData encoding:NSUTF8StringEncoding];
	
	GHTestLog(@"marshal result : %@", xmlString);
	
	[xmlString release];
	
	dtl = [xmlReader fromData:xmlData withClass:[DefaultTextList class]];
	GHTestLog(@"number of entry : %i", [dtl.list count]);
	GHAssertEqualStrings(dtl.version, @"ONE", nil);
	dte = [dtl.list objectAtIndex:2];
	GHAssertEqualStrings(dte.name, @"c", nil);
	GHAssertEqualStrings(dte.version, @"THREE", nil);
	GHAssertEqualStrings(dte.text, @"Example 3", nil);
}

@end
