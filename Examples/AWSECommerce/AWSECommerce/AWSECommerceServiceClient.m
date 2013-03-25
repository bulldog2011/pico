//
//  AWSECommerceServiceClient.m
//  AWSECommerce
//
//  Created by bulldog on 13-3-21.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

#import "AWSECommerceServiceClient.h"
#import "AmazonAuthUtils.h"
#import "PicoXMLElement.h"


@implementation AWSECommerceServiceClient

/**
 update url according to your local location, see a list of supported location at the end of the wsdl:
 http://webservices.amazon.com/AWSECommerceService/AWSECommerceService.wsdl
 */
//static NSString *const AWSECServiceURLString = @"https://webservices.amazon.cn/onca/soap?Service=AWSECommerceService";
static NSString *const AWSECServiceURLString = @"https://webservices.amazon.com/onca/soap?Service=AWSECommerceService";

NSString *const AWSAccessKeyId = @"YOUR AWS ACCESS KEY";
NSString *const AWSSecureKeyId = @"YOUR AWS SECURE KEY";

static NSString *const AuthHeaderNS = @"http://security.amazonaws.com/doc/2007-01-01/";


+ (AWSECommerceServiceClient *)sharedClient {
    static AWSECommerceServiceClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[AWSECommerceServiceClient alloc] initWithEndpointURL:[NSURL URLWithString:AWSECServiceURLString]];
    });
    
    return _sharedClient;
}

/**
 Authentication of SOAP request
 see details here: http://docs.aws.amazon.com/AWSECommerceService/latest/DG/NotUsingWSSecurity.html
*/
- (void)authenticateRequest:(NSString *)action {
    
    // build timestamp
    NSDateFormatter *dataFormatter = [[[NSDateFormatter alloc] init] autorelease];
    [dataFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    [dataFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    NSString *timestamp = [dataFormatter stringFromDate:[NSDate date]];
    
    // build signature
    NSString *signatureInput = [action stringByAppendingString:timestamp];
    NSString *signature = [AmazonAuthUtils sha256HMac:[signatureInput dataUsingEncoding:NSUTF8StringEncoding] withKey:AWSSecureKeyId];
    
    // add SOAP headers
    self.customSoapHeaders = [NSMutableArray array];
    PicoXMLElement *accessKeyElement = [[[PicoXMLElement alloc] init] autorelease];
    accessKeyElement.nsUri = AuthHeaderNS;
    accessKeyElement.name = @"AWSAccessKeyId";
    accessKeyElement.value = AWSAccessKeyId;
    [self.customSoapHeaders addObject:accessKeyElement];
    PicoXMLElement *timestampElement = [[[PicoXMLElement alloc] init] autorelease];
    timestampElement.nsUri = AuthHeaderNS;
    timestampElement.name = @"Timestamp";
    timestampElement.value = timestamp;
    [self.customSoapHeaders addObject:timestampElement];
    PicoXMLElement *signatureElement = [[[PicoXMLElement alloc] init] autorelease];
    signatureElement.nsUri = AuthHeaderNS;
    signatureElement.name = @"Signature";
    signatureElement.value = signature;
    [self.customSoapHeaders addObject:signatureElement];
}

@end
