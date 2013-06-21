//
//  AnyElementTest.m
//  picoTest
//
//  Created by bulldog on 13-3-5.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoTestBase.h"
#import "OrderedDictionary.h"

// Test that any element is Pico bindable class

@interface AnyElementTestCaseA : PicoTestBase

@end

@interface ElementEntryA : NSObject <PicoBindable>
{
@private
	NSString *name;
	NSString *value;
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *value;

@end

@implementation ElementEntryA

@synthesize name;
@synthesize value;


+(PicoClassSchema *)getClassMetaData {
	PicoClassSchema *cs = [[PicoClassSchema alloc] initWithXmlName: @"entry" nsUri: nil];
	[cs autorelease];
	return cs;
}

+(NSMutableDictionary *)getPropertyMetaData {
	NSMutableDictionary *map = [OrderedDictionary dictionary];
	PicoPropertySchema *ps = nil;
	
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ATTRIBUTE xmlName:@"key" propertyName:@"name" type:PICO_TYPE_STRING clazz:nil];
	[map setObject:ps forKey:@"name"];
	[ps release];
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"value" propertyName:@"value" type:PICO_TYPE_STRING clazz:nil];
	[map setObject:ps forKey:@"value"];
	[ps release];
	
	
	return map;
}

-(void)dealloc {
	self.name = nil;
	self.value = nil;
	[super dealloc];
}
@end


@interface GrandChildEntryA : NSObject <PicoBindable>
{
@private
	ElementEntryA *entryOne;
	ElementEntryA *entryTwo;
}

@property (nonatomic, retain) ElementEntryA *entryOne;
@property (nonatomic, retain) ElementEntryA *entryTwo;

@end

@implementation GrandChildEntryA

@synthesize entryOne;
@synthesize entryTwo;


+(PicoClassSchema *)getClassMetaData {
	PicoClassSchema *cs = [[PicoClassSchema alloc] initWithXmlName: @"grand-child" nsUri: nil];
	[cs autorelease];
	return cs;
}

+(NSMutableDictionary *)getPropertyMetaData {
	NSMutableDictionary *map = [OrderedDictionary dictionary];
	PicoPropertySchema *ps = nil;
	
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"entry-one" propertyName:@"entryOne" type:PICO_TYPE_OBJECT clazz:[ElementEntryA class]];
	[map setObject:ps forKey:@"entryOne"];
	[ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"entry-two" propertyName:@"entryTwo" type:PICO_TYPE_OBJECT clazz:[ElementEntryA class]];
	[map setObject:ps forKey:@"entryTwo"];
	[ps release];
	
	return map;
}

-(void)dealloc {
	self.entryOne = nil;
	self.entryTwo = nil;
	[super dealloc];
}
@end

@interface ChildEntryA : NSObject <PicoBindable>
{
@private
	NSString *name;
	NSString *one;
	NSString *two;
	NSString *three;
	GrandChildEntryA *grandChild;
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *one;
@property (nonatomic, retain) NSString *two;
@property (nonatomic, retain) NSString *three;
@property (nonatomic, retain) GrandChildEntryA *grandChild;

@end

@implementation ChildEntryA

@synthesize name;
@synthesize one;
@synthesize two;
@synthesize three;
@synthesize grandChild;

+(PicoClassSchema *)getClassMetaData {
	PicoClassSchema *cs = [[PicoClassSchema alloc] initWithXmlName: @"child" nsUri: nil];
	[cs autorelease];
	return cs;
}

+(NSMutableDictionary *)getPropertyMetaData {
	NSMutableDictionary *map = [OrderedDictionary dictionary];
	PicoPropertySchema *ps = nil;
	
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ATTRIBUTE xmlName:@"name" propertyName:@"name" type:PICO_TYPE_STRING clazz:nil];
	[map setObject:ps forKey:@"name"];
	[ps release];
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"one" propertyName:@"one" type:PICO_TYPE_STRING clazz:nil];
	[map setObject:ps forKey:@"one"];
	[ps release];
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"two" propertyName:@"two" type:PICO_TYPE_STRING clazz:nil];
	[map setObject:ps forKey:@"two"];
	[ps release];
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"three" propertyName:@"three" type:PICO_TYPE_STRING clazz:nil];
	[map setObject:ps forKey:@"three"];
	[ps release];
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"grand-child" propertyName:@"grandChild" type:PICO_TYPE_OBJECT clazz:[GrandChildEntryA class]];
	[map setObject:ps forKey:@"grandChild"];
	[ps release];
	
	return map;
}

-(void)dealloc {
	self.name = nil;
	self.one = nil;
	self.two = nil;
	self.three = nil;
	self.grandChild = nil;
	[super dealloc];
}
@end


@interface RootElementA : NSObject <PicoBindable>
{
@private
	NSNumber *number;
	NSNumber *flagBool;
	NSString *constant;
	NSString *name;
	NSString *path;
	NSString *text;
    ChildEntryA *entry;
	NSMutableArray *any;
}

@property (nonatomic, retain) NSNumber *number;
@property (nonatomic, retain) NSNumber *flagBool;
@property (nonatomic, retain) NSString *constant;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *path;
@property (nonatomic, retain) NSString *text;
@property (nonatomic, retain) ChildEntryA *entry;
@property (nonatomic, retain) NSMutableArray *any;

@end

@implementation RootElementA

@synthesize number;
@synthesize flagBool;
@synthesize constant;
@synthesize name;
@synthesize path;
@synthesize text;
@synthesize entry;
@synthesize any;

+(PicoClassSchema *)getClassMetaData {
	PicoClassSchema *cs = [[PicoClassSchema alloc] initWithXmlName: @"root" nsUri: nil];
	[cs autorelease];
	return cs;
}

+(NSMutableDictionary *)getPropertyMetaData {
	NSMutableDictionary *map = [OrderedDictionary dictionary];
	PicoPropertySchema *ps = nil;
	
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ATTRIBUTE xmlName:@"number" propertyName:@"number" type:PICO_TYPE_INT clazz:nil];
	[map setObject:ps forKey:@"number"];
	[ps release];
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ATTRIBUTE xmlName:@"flag" propertyName:@"flagBool" type:PICO_TYPE_BOOL clazz:nil];
	[map setObject:ps forKey:@"flagBool"];
	[ps release];
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"constant" propertyName:@"constant" type:PICO_TYPE_STRING clazz:nil];
	[map setObject:ps forKey:@"constant"];
	[ps release];
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"name" propertyName:@"name" type:PICO_TYPE_STRING clazz:nil];
	[map setObject:ps forKey:@"name"];
	[ps release];
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"path" propertyName:@"path" type:PICO_TYPE_STRING clazz:nil];
	[map setObject:ps forKey:@"path"];
	[ps release];
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"text" propertyName:@"text" type:PICO_TYPE_STRING clazz:nil];
	[map setObject:ps forKey:@"text"];
	[ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"child" propertyName:@"entry" type:PICO_TYPE_OBJECT clazz:[ChildEntryA class]];
	[map setObject:ps forKey:@"entry"];
	[ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ANY_ELEMENT xmlName:@"entry" propertyName:@"any" type:PICO_TYPE_ANYELEMENT clazz:[ElementEntryA class]];
	[map setObject:ps forKey:@"any"];
	[ps release];
    
	return map;
}

-(void)dealloc {
	self.number = nil;
	self.flagBool = nil;
	self.constant = nil;
	self.name = nil;
	self.path = nil;
	self.text = nil;
    self.entry = nil;
	self.any = nil;
	[super dealloc];
}
@end

static const NSString *ROOT_ENTRY_A = @"<?xml version=\"1.0\"?>\
        <root number='1234' flag='true'>\
        <name>some name</name>\
        <path>some path</path>\
        <constant>some constant</constant>\
        <text>\
            Some example text where some name is replaced\
            with the system property value and the path is\
            replaced with the path some name\
        </text>\
        <entry key='name.1'>\
            <value>value.1</value>\
        </entry>\
        <entry key='name.2'>\
            <value>value.2</value>\
        </entry>\
        <entry key='name.3'>\
            <value>value.3</value>\
        </entry>\
        <entry key='name.4'>\
            <value>value.4</value>\
        </entry>\
        <entry key='name.5'>\
            <value>value.5</value>\
        </entry>\
        <child name='first'>\
            <one>this is the first element</one>\
            <two>the second element</two>\
            <three>the third element</three>\
            <grand-child>\
                <entry-one key='name.1'>\
                    <value>value.1</value>\
                </entry-one>\
                <entry-two key='name.2'>\
                    <value>value.2</value>\
                </entry-two>\
            </grand-child>\
        </child>\
        </root>";


@implementation AnyElementTestCaseA

-(void)testEntry {
	NSData *xmlData = [ROOT_ENTRY_A dataUsingEncoding: NSUTF8StringEncoding];
	
	RootElementA *re = [xmlReader fromData: xmlData withClass:[RootElementA class]];
	
	GHAssertTrue([re.number intValue] == 1234, nil);
	GHAssertEqualStrings(re.name, @"some name", nil);
	GHAssertEqualStrings(re.path, @"some path", nil);
	GHAssertEqualStrings(re.constant, @"some constant", nil);
	GHAssertNotNil(re.text, nil);
	
	GHAssertTrue([re.any count] == 5, nil);
	ElementEntryA *ee = [re.any objectAtIndex:0];
	GHAssertEqualStrings(ee.name, @"name.1", nil);
	GHAssertEqualStrings(ee.value, @"value.1", nil);
	
	ee = [re.any objectAtIndex:4];
	GHAssertEqualStrings(ee.name, @"name.5", nil);
	GHAssertEqualStrings(ee.value, @"value.5", nil);
    
    ChildEntryA *ce = re.entry;
    GHAssertEqualStrings(ce.name, @"first", nil);
	GHAssertEqualStrings(ce.one, @"this is the first element", nil);
	GHAssertEqualStrings(ce.two, @"the second element", nil);
	GHAssertEqualStrings(ce.three, @"the third element", nil);
	
	GrandChildEntryA *gcd = ce.grandChild;
	ee = gcd.entryOne;
	GHAssertEqualStrings(ee.name, @"name.1", nil);
	GHAssertEqualStrings(ee.value, @"value.1", nil);
	ee = gcd.entryTwo;
	GHAssertEqualStrings(ee.name, @"name.2", nil);
	GHAssertEqualStrings(ee.value, @"value.2", nil);
    
    xmlData = [xmlWriter toData:re];
	
	NSString *xmlString = [[[NSString alloc] initWithData:xmlData encoding:NSUTF8StringEncoding] autorelease];
	
	GHTestLog(@"write result : %@", xmlString);
    
    //  repeat
    re = [xmlReader fromData: xmlData withClass:[RootElementA class]];
	
	GHAssertTrue([re.number intValue] == 1234, nil);
	GHAssertEqualStrings(re.name, @"some name", nil);
	GHAssertEqualStrings(re.path, @"some path", nil);
	GHAssertEqualStrings(re.constant, @"some constant", nil);
	GHAssertNotNil(re.text, nil);
	
	GHAssertTrue([re.any count] == 5, nil);
	ee = [re.any objectAtIndex:0];
	GHAssertEqualStrings(ee.name, @"name.1", nil);
	GHAssertEqualStrings(ee.value, @"value.1", nil);
	
	ee = [re.any objectAtIndex:4];
	GHAssertEqualStrings(ee.name, @"name.5", nil);
	GHAssertEqualStrings(ee.value, @"value.5", nil);
    
    ce = re.entry;
    GHAssertEqualStrings(ce.name, @"first", nil);
	GHAssertEqualStrings(ce.one, @"this is the first element", nil);
	GHAssertEqualStrings(ce.two, @"the second element", nil);
	GHAssertEqualStrings(ce.three, @"the third element", nil);
	
	gcd = ce.grandChild;
	ee = gcd.entryOne;
	GHAssertEqualStrings(ee.name, @"name.1", nil);
	GHAssertEqualStrings(ee.value, @"value.1", nil);
	ee = gcd.entryTwo;
	GHAssertEqualStrings(ee.name, @"name.2", nil);
	GHAssertEqualStrings(ee.value, @"value.2", nil);
}

@end
