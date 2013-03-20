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
#import "PicoDataConverter.h"

@interface ConverterTest : GHTestCase

@end

@implementation ConverterTest

- (void)testNumberConverter {
    GHTestLog(@"Begin to test PicoNumberConverter");
	
    PicoConfig *config = [[PicoConfig alloc] init];
	PicoNumberConverter *numConverter = [[PicoNumberConverter alloc] init];
	
	NSNumber *num = [numConverter read:@"25" withConfig:config];
	
	GHAssertTrue([num intValue] == 25, nil);
	
	NSString *numstr = [numConverter write:num withConfig:config];
	GHAssertEqualStrings(numstr, @"25", nil);
	
	num = [numConverter read:@"26.5" withConfig:config];
	
	GHAssertTrue([num floatValue] == 26.5, nil);
	numstr = [numConverter write:num withConfig: config];
	GHAssertEqualStrings(numstr, @"26.5", nil);
	
	GHAssertTrue([num doubleValue] == 26.5, nil);
	
	[numConverter release];
    [config release];
}

-(void)testBoolConverter {
	GHTestLog(@"Begin to test EbayNs_BoolConverter");
	
    PicoConfig *config = [[PicoConfig alloc] init];
	PicoBoolConverter *boolConverter = [[PicoBoolConverter alloc] init];
	
	NSNumber *boolNum = [boolConverter read:@"true" withConfig: config];
	
	GHAssertTrue([boolNum boolValue], nil);
	
	boolNum = [boolConverter read:@"True" withConfig:config];
	
	GHAssertTrue([boolNum boolValue], nil);
	GHAssertEqualStrings([boolConverter write:boolNum withConfig:config], @"true", nil);
	
	boolNum = [boolConverter read:@"YES" withConfig:config];
	
	GHAssertFalse([boolNum boolValue], nil);
	GHAssertEqualStrings([boolConverter write:boolNum withConfig:config], @"false", nil);
	
	boolNum = [boolConverter read:@"True1" withConfig:config];
	
	GHAssertFalse([boolNum boolValue], nil);
	
	boolNum = [boolConverter read:@"100" withConfig: config];
	
	GHAssertFalse([boolNum boolValue], nil);
	
	boolNum = [boolConverter read:@"1" withConfig: config];
	GHAssertTrue([boolNum boolValue], nil);
	
	boolNum = [boolConverter read:@"0" withConfig: config];
	GHAssertFalse([boolNum boolValue], nil);
	
	
	[boolConverter release];
    [config release];
}

-(void)testStringConverter {
	GHTestLog(@"Begin to test PicoStringConverter");
	
    PicoConfig *config = [[PicoConfig alloc] init];
	PicoStringConverter *stringConverter = [[[PicoStringConverter alloc] init] autorelease];
	
	NSString *str = [stringConverter read:@"test" withConfig: config];
	
	GHAssertEqualStrings(str, @"test", nil);
	
	str = [stringConverter write:@"test" withConfig: config];
	
	GHAssertEqualStrings(str, @"test", nil);
    [config release];
	
}

-(void)testDateConverter {
	PicoDateConverter *dateConverter = [[PicoDateConverter alloc] init];
    
    PicoConfig *config = [[PicoConfig alloc] init];
	NSDate *date = [dateConverter read: @"2011-07-17T16:23:40.000Z" withConfig:config];
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
	
	NSString *dateString = [dateConverter write: localDate withConfig:config];
	
	GHAssertEqualStrings(@"2012-11-30T09:10:30.000Z", dateString, nil);
	
	[dateConverter release];
    [config release];
}

-(void)testDataConverter {
    PicoDataConverter *dataConverter = [[PicoDataConverter alloc] init];
    PicoConfig *config = [[PicoConfig alloc] init];
    
    NSString *str = @"hello world!";
    GHTestLog(@"original string : %@", str);
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    NSString *base64Str = [dataConverter write:data withConfig:config];
    GHTestLog(@"base64 encoded string : %@", base64Str);
    
    NSData *decodedData = [dataConverter read:base64Str withConfig:config];
    NSString *decodedStr = [[NSString alloc] initWithData:decodedData encoding:NSUTF8StringEncoding];
    GHTestLog(@"decoded string : %@", decodedStr);
    
    GHAssertEqualStrings(str, decodedStr, nil);
    
    char test_string[] = "So?<p>"
    "This 4, 5, 6, 7, 8, 9, z, {, |, } tests Base64 encoder. "
    "Show me: @, A, B, C, D, E, F, G, H, I, J, K, L, M, "
    "N, O, P, Q, R, S, T, U, V, W, X, Y, Z, [, \\, ], ^, _, `, "
    "a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s.";
    
    int length = (sizeof test_string) / sizeof(char);
    NSData *testData = [NSData dataWithBytes:test_string length:length];
    NSString *testBase64Str = [dataConverter write:testData withConfig:config];
    GHTestLog(@"base64 encoded test string : %@", testBase64Str);
    
    NSData *decodedTestData = [dataConverter read:testBase64Str withConfig:config];
    unsigned char* decodedTestString  = (unsigned char*)[decodedTestData bytes];
    
    for(int i = 0; i < length; i++) {
        GHAssertTrue(test_string[i] == decodedTestString[i], nil);
    }
    
    [dataConverter release];
    [config release];
}

-(void)testConverter {
	GHTestLog(@"Begin to test PicoConverter");
	
    PicoConfig *config = [[PicoConfig alloc] init];
	PicoConverter *converter = [[PicoConverter alloc] init];
	
	GHAssertTrue([PicoConverter isPrimitive:PICO_TYPE_INT], nil);
	GHAssertTrue([PicoConverter isPrimitive:PICO_TYPE_STRING], nil);
	GHAssertFalse([PicoConverter isPrimitive:PICO_TYPE_OBJECT], nil);
	
	NSNumber *value = [PicoConverter read:@"25" withType:PICO_TYPE_INT config:config];
	GHAssertTrue([value intValue] == 25, nil);
	
	GHAssertEqualStrings([PicoConverter write:value withType:PICO_TYPE_INT config:config], @"25", nil);
	
	value = [PicoConverter read:@"25.1" withType:PICO_TYPE_FLOAT config:config];
	float f = [value floatValue];
	GHAssertTrue(abs(f - 25.1) <= 1e-6, nil);
	GHAssertEqualStrings([PicoConverter write:value withType:PICO_TYPE_FLOAT config:config], @"25.1", nil);
	
	value = [PicoConverter read:@"true" withType:PICO_TYPE_BOOL config:config];
	GHAssertTrue([value boolValue], nil);
	GHAssertEqualStrings([PicoConverter write:value withType:PICO_TYPE_BOOL config:config], @"true", nil);
	
	NSString *str = [PicoConverter read:@"27" withType:PICO_TYPE_STRING config:config];
	GHAssertEqualStrings(str, @"27", nil);
	GHAssertEqualStrings([PicoConverter write:str withType:PICO_TYPE_STRING config:config], @"27", nil);
	
	str = [PicoConverter read:@"GREEN" withType:PICO_TYPE_ENUM config:config];
	GHAssertEqualStrings(str, @"GREEN", nil);
	GHAssertEqualStrings([PicoConverter write:str withType:PICO_TYPE_ENUM config:config], @"GREEN", nil);
	
	[converter release];
    [config release];	
}

@end
