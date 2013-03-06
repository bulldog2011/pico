//
//  ConverterTest.m
//  picoTest
//
//  Created by bulldog on 13-2-24.
//  Copyright (c) 2013 bulldog. All rights reserved.
//

#import <GHUnitIOS/GHUNit.h>
#import "PicoBoolConverter.h"
#import "PicoNumberConverter.h"
#import "PicoStringConverter.h"
#import "PicoDateConverter.h"
#import "PicoConverter.h"
#import "PicoConstants.h"

@interface ConverterTest : GHTestCase

@end

@implementation ConverterTest

- (void)testNumberConverter {
    GHTestLog(@"Begin to test PicoNumberConverter");
	
	PicoNumberConverter *numConverter = [[PicoNumberConverter alloc] init];
	
	NSNumber *num = [numConverter read:@"25"];
	
	GHAssertTrue([num intValue] == 25, nil);
	
	NSString *numstr = [numConverter write:num];
	GHAssertEqualStrings(numstr, @"25", nil);
	
	num = [numConverter read:@"26.5"];
	
	GHAssertTrue([num floatValue] == 26.5, nil);
	numstr = [numConverter write:num];
	GHAssertEqualStrings(numstr, @"26.5", nil);
	
	GHAssertTrue([num doubleValue] == 26.5, nil);
	
	[numConverter release];
}

-(void)testBoolConverter {
	GHTestLog(@"Begin to test EbayNs_BoolConverter");
	
	PicoBoolConverter *boolConverter = [[PicoBoolConverter alloc] init];
	
	NSNumber *boolNum = [boolConverter read:@"true"];
	
	GHAssertTrue([boolNum boolValue], nil);
	
	boolNum = [boolConverter read:@"True"];
	
	GHAssertTrue([boolNum boolValue], nil);
	GHAssertEqualStrings([boolConverter write:boolNum], @"true", nil);
	
	boolNum = [boolConverter read:@"YES"];
	
	GHAssertFalse([boolNum boolValue], nil);
	GHAssertEqualStrings([boolConverter write:boolNum], @"false", nil);
	
	boolNum = [boolConverter read:@"True1"];
	
	GHAssertFalse([boolNum boolValue], nil);
	
	boolNum = [boolConverter read:@"100"];
	
	GHAssertFalse([boolNum boolValue], nil);
	
	boolNum = [boolConverter read:@"1"];
	GHAssertTrue([boolNum boolValue], nil);
	
	boolNum = [boolConverter read:@"0"];
	GHAssertFalse([boolNum boolValue], nil);
	
	
	[boolConverter release];
}

-(void)testStringConverter {
	GHTestLog(@"Begin to test PicoStringConverter");
	
	PicoStringConverter *stringConverter = [[[PicoStringConverter alloc] init] autorelease];
	
	NSString *str = [stringConverter read:@"test"];
	
	GHAssertEqualStrings(str, @"test", nil);
	
	str = [stringConverter write:@"test"];
	
	GHAssertEqualStrings(str, @"test", nil);
	
}

-(void)testDateConverter {
	PicoDateConverter *dateConverter = [[PicoDateConverter alloc] init];
	
	NSDate *date = [dateConverter read: @"2011-07-17T16:23:40.000Z"];
	NSDateComponents *dateComp = [[[NSDateComponents alloc] init] autorelease];
	[dateComp setYear:2011];
	[dateComp setMonth:7];
	[dateComp setDay:17];
	[dateComp setHour:16];
	[dateComp setMinute:23];
	[dateComp setSecond:40];
	NSCalendar *cal = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
	[cal setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
	NSDate *theDate = [cal dateFromComponents:dateComp];
	GHAssertTrue([theDate isEqualToDate:date], nil);
	
	NSDateComponents *localDateComp = [[[NSDateComponents alloc] init] autorelease];
	[localDateComp setYear:2012];
	[localDateComp setMonth:11];
	[localDateComp setDay:30];
	[localDateComp setHour:17];
	[localDateComp setMinute:10];
	[localDateComp setSecond:30];
	NSCalendar *localCalendar = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
	NSDate *localDate = [localCalendar dateFromComponents:localDateComp];
	
	NSString *dateString = [dateConverter write: localDate];
	
	GHAssertEqualStrings(@"2012-11-30T09:10:30.000Z", dateString, nil);
	
	[dateConverter release];
}

-(void)testConverter {
	GHTestLog(@"Begin to test PicoConverter");
	
	PicoConverter *converter = [[PicoConverter alloc] init];
	
	GHAssertTrue([PicoConverter isPrimitive:PICO_TYPE_INT], nil);
	GHAssertTrue([PicoConverter isPrimitive:PICO_TYPE_STRING], nil);
	GHAssertFalse([PicoConverter isPrimitive:PICO_TYPE_OBJECT], nil);
	
	NSNumber *value = [PicoConverter read:@"25" withType:PICO_TYPE_INT];
	GHAssertTrue([value intValue] == 25, nil);
	
	GHAssertEqualStrings([PicoConverter write:value withType:PICO_TYPE_INT], @"25", nil);
	
	value = [PicoConverter read:@"25.1" withType:PICO_TYPE_FLOAT];
	float f = [value floatValue];
	GHAssertTrue(abs(f - 25.1) <= 1e-6, nil);
	GHAssertEqualStrings([PicoConverter write:value withType:PICO_TYPE_FLOAT], @"25.1", nil);
	
	value = [PicoConverter read:@"true" withType:PICO_TYPE_BOOL];
	GHAssertTrue([value boolValue], nil);
	GHAssertEqualStrings([PicoConverter write:value withType:PICO_TYPE_BOOL], @"true", nil);
	
	NSString *str = [PicoConverter read:@"27" withType:PICO_TYPE_STRING];
	GHAssertEqualStrings(str, @"27", nil);
	GHAssertEqualStrings([PicoConverter write:str withType:PICO_TYPE_STRING], @"27", nil);
	
	str = [PicoConverter read:@"GREEN" withType:PICO_TYPE_ENUM];
	GHAssertEqualStrings(str, @"GREEN", nil);
	GHAssertEqualStrings([PicoConverter write:str withType:PICO_TYPE_ENUM], @"GREEN", nil);
	
	[converter release];
	
}

@end
