//
//  SOAPReaderTest.m
//  PicoTest
//
//  Created by bulldog on 13-5-11.
//  Copyright (c) 2013年 LeanSoft Technology. All rights reserved.
//

#import <GHUnitIOS/GHUNit.h>
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

@interface SOAPReaderTest  : GHTestCase

@end

@implementation SOAPReaderTest

static NSString *SOAP_11_MESSAGE =
    @"<?xml version='1.0' encoding='UTF-8'?>\
    <SOAP-ENV:Envelope \
    xmlns:SOAP-ENV='http://schemas.xmlsoap.org/soap/envelope/' \
    xmlns:xsi='http://www.w3.org/1999/XMLSchema-instance' \
    xmlns:xsd='http://www.w3.org/1999/XMLSchema'>\
    <SOAP-ENV:Body>\
    <SOAP-ENV:Fault>\
    <faultcode xsi:type='xsd:string'>SOAP-ENV:Client</faultcode>\
    <faultstring xsi:type='xsd:string'>\
     Failed to locate method (ValidateCreditCard) in class \
     (examplesCreditCard) at /usr/local/ActivePerl-5.6/lib/ \
     site_perl/5.6.0/SOAP/Lite.pm line 1555.\
     </faultstring>\
     </SOAP-ENV:Fault>\
    </SOAP-ENV:Body>\
    </SOAP-ENV:Envelope>";

static NSString *SOAP_12_MESSAGE =
    @"<env:Envelope xmlns:env='http://www.w3.org/2003/05/soap-envelope'>\
    <env:Header/><env:Body>\
    <env:Fault>\
    <env:Code><env:Value>env:Sender</env:Value></env:Code>\
    <env:Reason><env:Text xml:lang='en-US'>\
    Message does not have necessary info\
    </env:Text></env:Reason>\
    <env:Role>http://gizmos.com/order</env:Role>\
    <env:Detail>\
    <PO:order xmlns:PO='http://gizmos.com/orders/'>\
    Quantity element does not have a value</PO:order>\
    <PO:confirmation xmlns:PO='http://gizmos.com/confirm'>\
    Incomplete address: no zip code</PO:confirmation>\
    </env:Detail></env:Fault>\
    </env:Body></env:Envelope>";

-(void)testReadSOAP11FaultMessage {
    PicoSOAPReader *soapReader = [[PicoSOAPReader alloc] init];
    SOAP11Envelope *soap11Envelope = [soapReader fromString:SOAP_11_MESSAGE withSOAPClass:[SOAP11Envelope class] innerClass:[Bulldog class]];
    GHAssertTrue(soap11Envelope.body.any.count == 1, nil);
    
    id obj = [soap11Envelope.body.any objectAtIndex:0];
    GHAssertTrue([obj isMemberOfClass:[SOAP11Fault class]], nil);
    SOAP11Fault *fault = (SOAP11Fault *)obj;
    GHAssertEqualStrings(@"SOAP-ENV:Client", fault.faultcode, nil);
    
    @try {
        [soapReader fromString:SOAP_11_MESSAGE withSOAPClass:[SOAP12Envelope class] innerClass:[Bulldog class]];
        GHFail(@"should throw ReaderException");
    } @catch (NSException *ex) {
        GHAssertEqualStrings(@"ReaderException", ex.name, nil);
    }
    
    //[soap11Envelope release];
    [soapReader release];
}

-(void)testReadSOAP12FaultMessage {
    PicoSOAPReader *soapReader = [[PicoSOAPReader alloc] init];
    SOAP12Envelope *soap12Envelope = [soapReader fromString:SOAP_12_MESSAGE withSOAPClass:[SOAP12Envelope class] innerClass:[Bulldog class]];
    GHAssertTrue(soap12Envelope.body.any.count == 1, nil);
    
    id obj = [soap12Envelope.body.any objectAtIndex:0];
    GHAssertTrue([obj isMemberOfClass:[SOAP12Fault class]], nil);
    SOAP12Fault *fault = (SOAP12Fault *)obj;
    GHAssertEqualStrings(@"http://gizmos.com/order", fault.role, nil);
    GHAssertTrue(fault.reason.text.count == 1, nil);
    SOAP12Reasontext *reasonText = [fault.reason.text objectAtIndex:0];
    GHAssertEqualStrings(@"    Message does not have necessary info    ", reasonText.value, nil);
    
    @try {
        [soapReader fromString:SOAP_12_MESSAGE withSOAPClass:[SOAP11Envelope class] innerClass:[Bulldog class]];
        GHFail(@"should throw ReaderException");
    } @catch (NSException *ex) {
        GHAssertEqualStrings(@"ReaderException", ex.name, nil);
    }
}

@end
