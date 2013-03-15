//
//  SOAPTest.m
//  picoTest
//
//  Created by bulldog on 13-3-14.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoTestBase.h"
#import "PicoSOAPReader.h"
#import "PicoSOAPWriter.h"
#import "SOAP11Envelope.h"
#import "SOAP11Body.h"
#import "SOAP11Header.h"
#import "Bulldog.h"
#import "SOAP11Fault.h"
#import "SOAP12Envelope.h"
#import "SOAP12Body.h"
#import "SOAP12Header.h"
#import "SOAP12Fault.h"
#import "SOAP12Faultcode.h"
#import "SOAP12Faultreason.h"
#import "SOAP12Reasontext.h"

@interface SOAPTest  : GHTestCase

@end

@implementation SOAPTest

-(void)testSOAP11 {
    SOAP11Envelope *soap11Envelope = [[SOAP11Envelope alloc] init];
    SOAP11Header *soap11Header = [[[SOAP11Header alloc] init] autorelease];
    soap11Envelope.header = soap11Header;
    soap11Header.any = [NSMutableArray array];
    Bulldog *dog = [self getBulldog];
    [soap11Header.any addObject:dog];
    
    SOAP11Body *soap11Body = [[[SOAP11Body alloc] init] autorelease];
    soap11Envelope.body = soap11Body;
    soap11Body.any = [NSMutableArray array];
    [soap11Body.any addObject:dog];
    
    PicoSOAPWriter *soapWriter = [[PicoSOAPWriter alloc] init];
    
    NSString *soap11String = [soapWriter toString:soap11Envelope];
    
    GHTestLog(@"write result : %@", soap11String);
    
    [soap11Envelope release];
    
    PicoSOAPReader *soapReader = [[PicoSOAPReader alloc] init];
    soap11Envelope = [soapReader fromString:soap11String withSOAPClass:[SOAP11Envelope class] innerClass:[Bulldog class]];
    
    [self checkDog:dog equalWith:[soap11Envelope.body.any objectAtIndex:0]];
    
    soap11String = [soapWriter toString:soap11Envelope];
    
    GHTestLog(@"write result : %@", soap11String);
    
    [soapWriter release];
    [soapReader release];
}

-(void)testSOAP11Fault {
    SOAP11Envelope *soap11Envelope = [[SOAP11Envelope alloc] init];
    SOAP11Header *soap11Header = [[[SOAP11Header alloc] init] autorelease];
    soap11Envelope.header = soap11Header;
    soap11Header.any = [NSMutableArray array];
    Bulldog *dog = [self getBulldog];
    [soap11Header.any addObject:dog];
    
    SOAP11Body *soap11Body = [[[SOAP11Body alloc] init] autorelease];
    soap11Envelope.body = soap11Body;
    soap11Body.any = [NSMutableArray array];
    SOAP11Fault *soap11Fault = [[[SOAP11Fault alloc] init] autorelease];
    soap11Fault.faultstring = @"test";
    soap11Fault.faultcode = @"2000";
    [soap11Body.any addObject:soap11Fault];
    
    PicoSOAPWriter *soapWriter = [[PicoSOAPWriter alloc] init];
    
    NSString *soap11String = [soapWriter toString:soap11Envelope];
    
    GHTestLog(@"write result : %@", soap11String);
    
    [soap11Envelope release];
    
    PicoSOAPReader *soapReader = [[PicoSOAPReader alloc] init];
    soap11Envelope = [soapReader fromString:soap11String withSOAPClass:[SOAP11Envelope class] innerClass:[Bulldog class]];
    
    GHAssertNotNil(soap11Envelope.body, nil);
    GHAssertTrue(soap11Envelope.body.any.count == 1, nil);
    soap11Fault = [soap11Envelope.body.any objectAtIndex:0];
    GHAssertEqualStrings(@"test", soap11Fault.faultstring, nil);
    GHAssertEqualStrings(@"2000", soap11Fault.faultcode, nil);
    
    soap11String = [soapWriter toString:soap11Envelope];
    
    GHTestLog(@"write result : %@", soap11String);
    
    [soapWriter release];
    [soapReader release];
}

-(void)testSOAP12 {
    SOAP12Envelope *soap12Envelope = [[SOAP12Envelope alloc] init];
    SOAP12Header *soap12Header = [[[SOAP12Header alloc] init] autorelease];
    soap12Envelope.header = soap12Header;
    soap12Header.any = [NSMutableArray array];
    Bulldog *dog = [self getBulldog];
    [soap12Header.any addObject:dog];
    
    SOAP12Body *soap12Body = [[[SOAP12Body alloc] init] autorelease];
    soap12Envelope.body = soap12Body;
    soap12Body.any = [NSMutableArray array];
    [soap12Body.any addObject:dog];
    
    PicoSOAPWriter *soapWriter = [[PicoSOAPWriter alloc] init];
    
    NSString *soap12String = [soapWriter toString:soap12Envelope];
    
    GHTestLog(@"write result : %@", soap12String);
    
    [soap12Envelope release];
    
    PicoSOAPReader *soapReader = [[PicoSOAPReader alloc] init];
    soap12Envelope = [soapReader fromString:soap12String withSOAPClass:[SOAP12Envelope class] innerClass:[Bulldog class]];
    
    [self checkDog:dog equalWith:[soap12Envelope.body.any objectAtIndex:0]];
    
    soap12String = [soapWriter toString:soap12Envelope];
    
    GHTestLog(@"write result : %@", soap12String);
    
    [soapWriter release];
    [soapReader release];
}

-(void)testSOAP12Fault {
    SOAP12Envelope *soap12Envelope = [[SOAP12Envelope alloc] init];
    SOAP12Header *soap12Header = [[[SOAP12Header alloc] init] autorelease];
    soap12Envelope.header = soap12Header;
    soap12Header.any = [NSMutableArray array];
    Bulldog *dog = [self getBulldog];
    [soap12Header.any addObject:dog];
    
    SOAP12Body *soap12Body = [[[SOAP12Body alloc] init] autorelease];
    soap12Envelope.body = soap12Body;
    soap12Body.any = [NSMutableArray array];
    SOAP12Fault *soap12Fault = [[[SOAP12Fault alloc] init] autorelease];
    SOAP12Faultcode *soap12Faultcode = [[[SOAP12Faultcode alloc] init] autorelease];
    soap12Faultcode.value = @"faultcode";
    soap12Fault.code = soap12Faultcode;
    
    SOAP12Faultreason *soap12Faultreason = [[[SOAP12Faultreason alloc] init] autorelease];
    soap12Faultreason.text = [NSMutableArray array];
    soap12Fault.reason = soap12Faultreason;
    SOAP12Reasontext *soap12Reasontext = [[[SOAP12Reasontext alloc] init] autorelease];
    soap12Reasontext.value = @"reason1";
    soap12Reasontext.lang = @"lang1";
    [soap12Faultreason.text addObject:soap12Reasontext];
    soap12Reasontext = [[[SOAP12Reasontext alloc] init] autorelease];
    soap12Reasontext.value = @"reason2";
    soap12Reasontext.lang = @"lang2";
    [soap12Faultreason.text addObject:soap12Reasontext];
    soap12Fault.reason = soap12Faultreason;
    
    [soap12Body.any addObject:soap12Fault];
    
    PicoSOAPWriter *soapWriter = [[PicoSOAPWriter alloc] init];
    
    NSString *soap12String = [soapWriter toString:soap12Envelope];
    
    GHTestLog(@"write result : %@", soap12String);
    
    [soap12Envelope release];
    
    PicoSOAPReader *soapReader = [[PicoSOAPReader alloc] init];
    soap12Envelope = [soapReader fromString:soap12String withSOAPClass:[SOAP12Envelope class] innerClass:[Bulldog class]];
    
    GHAssertNotNil(soap12Envelope.body, nil);
    GHAssertTrue(soap12Envelope.body.any.count == 1, nil);
    soap12Fault = [soap12Envelope.body.any objectAtIndex:0];
    soap12Faultcode = [soap12Fault code];
    GHAssertNotNil(soap12Faultcode, nil);
    GHAssertEqualStrings(@"faultcode", soap12Faultcode.value, nil);
    
    soap12Faultreason = [soap12Fault reason];
    GHAssertNotNil(soap12Faultreason, nil);
    GHAssertTrue(soap12Faultreason.text.count == 2, nil);
    soap12Reasontext = [soap12Faultreason.text objectAtIndex:0];
    GHAssertEqualStrings(@"reason1", soap12Reasontext.value, nil);
    GHAssertEqualStrings(@"lang1", soap12Reasontext.lang, nil);
    soap12Reasontext = [soap12Faultreason.text objectAtIndex:1];
    GHAssertEqualStrings(@"reason2", soap12Reasontext.value, nil);
    GHAssertEqualStrings(@"lang2", soap12Reasontext.lang, nil);
    
    soap12String = [soapWriter toString:soap12Envelope];
    
    GHTestLog(@"write result : %@", soap12String);
    
    [soapWriter release];
    [soapReader release];
}

-(void) checkDog:(Bulldog *)dog1 equalWith:(Bulldog *)dog2 {
    GHAssertEqualStrings(dog1.name, dog2.name, nil);
    GHAssertEquals(dog1.age, dog2.age, nil);
    GHAssertEqualStrings(dog1.color, dog2.color, nil);
    GHAssertEqualStrings(dog1.desc, dog2.desc, nil);
    if (dog1.children.count > 0) {
        GHAssertTrue(dog1.children.count == dog2.children.count, nil);
        for(int i; i < 2; i++) {
            [self checkDog:[dog1.children objectAtIndex:i] equalWith:[dog2.children objectAtIndex:i]];
        }
    }
}

-(Bulldog *) getBulldog {
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
    
    return [dog autorelease];
}

@end
