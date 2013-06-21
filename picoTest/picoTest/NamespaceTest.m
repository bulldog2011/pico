//
//  NamespaceTest.m
//  picoTest
//
//  Created by bulldog on 13-2-28.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoTestBase.h"
#import "OrderedDictionary.h"

@class Bbb;
@interface Aaa : NSObject <PicoBindable>
{
@private
	Bbb *bbb;
	
}

@property (nonatomic, retain) Bbb *bbb;

@end

@implementation Aaa

@synthesize bbb;

+(PicoClassSchema *)getClassMetaData {
	PicoClassSchema *cs = [[PicoClassSchema alloc] initWithXmlName: @"aaa" nsUri: @"namespace1"];
	[cs autorelease];
	return cs;
}

+(NSMutableDictionary *)getPropertyMetaData {
	NSMutableDictionary *map = [OrderedDictionary dictionary];
	PicoPropertySchema *ps = nil;
	
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"bbb" propertyName:@"bbb" type:PICO_TYPE_OBJECT clazz:[Bbb class]];
	[map setObject:ps forKey:@"bbb"];
	[ps release];
	
	return map;
}

-(void)dealloc {
	self.bbb = nil;
	[super dealloc];
}

@end

@interface Bbb : NSObject <PicoBindable>
{
@private
	Aaa *aaa;
	
}

@property (nonatomic, retain) Aaa *aaa;

@end

@implementation Bbb

@synthesize aaa;

+(PicoClassSchema *)getClassMetaData {
	PicoClassSchema *cs = [[PicoClassSchema alloc] initWithXmlName: @"bbb" nsUri: @"namespace2"];
	[cs autorelease];
	return cs;
}

+(NSMutableDictionary *)getPropertyMetaData {
	NSMutableDictionary *map = [OrderedDictionary dictionary];
	PicoPropertySchema *ps = nil;
	
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"aaa" propertyName:@"aaa" type:PICO_TYPE_OBJECT clazz:[Aaa class]];
	[map setObject:ps forKey:@"aaa"];
	[ps release];
	
	return map;
}

-(void)dealloc {
	self.aaa = nil;
	[super dealloc];
}
@end

@interface NamespaceTest : PicoTestBase

@end

@implementation NamespaceTest

-(void)testNamespace {
	Aaa *parent = [Aaa new];
	Bbb *child = [Bbb new];
	parent.bbb = child;
	Aaa *grandchild = [Aaa new];
	child.aaa = grandchild;
	grandchild.bbb = [[Bbb new] autorelease];
	
	NSData *xmlData = [xmlWriter toData:parent];
	
	NSString *xmlString = [[NSString alloc] initWithData:xmlData encoding:NSUTF8StringEncoding];
	
	GHTestLog(@"marshal result : %@", xmlString);
	
	[parent release];
	[child release];
	[grandchild release];
	[xmlString release];
	
}

@end
