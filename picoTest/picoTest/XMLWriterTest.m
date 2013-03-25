//
//  XMLWriterTest.m
//  picoTest
//
//  Created by bulldog on 13-2-28.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoTestBase.h"
#import "Bulldog.h"
#import "ChineseBulldog.h"

@interface XMLWriterTest : PicoTestBase

@end

@implementation XMLWriterTest

-(void)testWrite {
	
	Bulldog *dog = [Bulldog new];
	
	dog.name = @"tomy";
	dog.age = [NSNumber numberWithInt: 3];
	dog.color = @"WHITE";
	dog.desc = @"my favorate dog";
	
	Bulldog *dog1 = [Bulldog new];
	dog1.name = @"jacky";
	dog1.age = [NSNumber numberWithInt: 1];
	dog1.color = @"YELLOW";
	dog1.desc = @"my baby dog";
	[dog1 autorelease];
	
	Bulldog *dog2 = [Bulldog new];
	dog2.name = @"andy";
	dog2.age = [NSNumber numberWithInt: 1];
	dog2.color = @"BLACK";
	dog2.desc = @"tomy's child dog";
	[dog2 autorelease];
	
	dog.children = [NSMutableArray array];
	[dog.children addObject:dog1];
	[dog.children addObject:dog2];
	
	
	NSData *data = [xmlWriter toData: dog];
	NSString *xmlString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
	GHTestLog(@"write dog result1 : %@", xmlString);
    [xmlString release];
    
    xmlString = [xmlWriter toString:dog];
	GHTestLog(@"write dog result2 : %@", xmlString);
	
	[dog release];
}

-(void)testRead {
	
	
	NSString *xmlString = @"<?xml version=\"1.0\" encoding=\"utf-8\"?><MyPet xmlns:Will=\"x.y.z\" Age=\"3\" Color=\"WHITE\"><Name>tomy</Name><Children Age=\"1\" Color=\"YELLOW\"><Name>jacky</Name><Desc>my baby dog</Desc></Children><Children Age=\"1\" Color=\"BLACK\"><Name>andy</Name><Desc>tomy's child dog</Desc></Children><Desc>my favorate dog</Desc></MyPet>";
	
	NSData *xmlData = [xmlString dataUsingEncoding: NSUTF8StringEncoding];
	
	Bulldog *dog = [xmlReader fromData: xmlData withClass: [Bulldog class]];
	GHAssertEqualStrings(dog.name, @"tomy", nil);
	GHAssertTrue([dog.age intValue] == 3, nil);
	GHAssertEqualStrings(dog.color, @"WHITE", nil);
	GHAssertEqualStrings(dog.desc, @"my favorate dog", nil);
	GHAssertTrue(dog.children.count == 2, nil);
	
	Bulldog *dog1 = [dog.children objectAtIndex:0];
	GHAssertEqualStrings(dog1.name, @"jacky", nil);
	GHAssertTrue([dog1.age intValue] == 1, nil);
	GHAssertEqualStrings(dog1.color, @"YELLOW", nil);
	GHAssertEqualStrings(dog1.desc, @"my baby dog", nil);
	GHAssertNil(dog1.children, nil);
	
	Bulldog *dog2 = [dog.children objectAtIndex:1];
	GHAssertEqualStrings(dog2.name, @"andy", nil);
	GHAssertTrue([dog2.age intValue] == 1, nil);
	GHAssertEqualStrings(dog2.color, @"BLACK", nil);
	GHAssertEqualStrings(dog2.desc, @"tomy's child dog", nil);
	GHAssertNil(dog2.children, nil);
}

-(void)testBoth {
	
	ChineseBulldog *dog = [ChineseBulldog new];
	
	dog.name = @"tomy";
	dog.age = [NSNumber numberWithInt: 3];
	dog.color = @"WHITE";
	dog.desc = @"my favorate dog";
	dog.native = @"US";
	
	ChineseBulldog *dog1 = [ChineseBulldog new];
	dog1.name = @"jacky";
	dog1.age = [NSNumber numberWithInt: 1];
	dog1.color = @"YELLOW";
	dog1.desc = @"my baby dog";
	[dog1 autorelease];
	
	ChineseBulldog *dog2 = [ChineseBulldog new];
	dog2.name = @"andy";
	dog2.age = [NSNumber numberWithInt: 1];
	dog2.color = @"BLACK";
	dog2.desc = @"tomy's child dog";
	[dog2 autorelease];
	
	dog.children = [NSMutableArray array];
	[dog.children addObject:dog1];
	[dog.children addObject:dog2];
	
	NSData *data = [xmlWriter toData:dog];
	NSString *xmlString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
	
	GHTestLog(@"write chinese dog result : %@", xmlString);
	
	[dog release];
	[xmlString release];
	
	dog = [[xmlReader fromData:data withClass: [ChineseBulldog class]] retain];

	GHAssertEqualStrings(dog.name, @"tomy", nil);
	GHAssertTrue([dog.age intValue] == 3, nil);
	GHAssertEqualStrings(dog.color, @"WHITE", nil);
	GHAssertEqualStrings(dog.desc, @"my favorate dog", nil);
	GHAssertEqualStrings(dog.native, @"US", nil);
	GHAssertTrue(dog.children.count == 2, nil);
	
	dog1 = [dog.children objectAtIndex:0];
	GHAssertEqualStrings(dog1.name, @"jacky", nil);
	GHAssertTrue([dog1.age intValue] == 1, nil);
	GHAssertEqualStrings(dog1.color, @"YELLOW", nil);
	GHAssertEqualStrings(dog1.desc, @"my baby dog", nil);
	GHAssertNil(dog1.children, nil);
	
	dog2 = [dog.children objectAtIndex:1];
	GHAssertEqualStrings(dog2.name, @"andy", nil);
	GHAssertTrue([dog2.age intValue] == 1, nil);
	GHAssertEqualStrings(dog2.color, @"BLACK", nil);
	GHAssertEqualStrings(dog2.desc, @"tomy's child dog", nil);
	GHAssertNil(dog2.children, nil);
}


@end
