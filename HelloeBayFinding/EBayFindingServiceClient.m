//
//  EBayFindingServiceClient.m
//  HelloeBayFinding
//
//  Created by bulldog on 13-3-16.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

#import "EBayFindingServiceClient.h"

static NSString *const eBayAppId = @"ebaysjinternal";

// production
static NSString *const eBayFindingServiceURLString = @"http://svcs.ebay.com/services/search/FindingService/v1";

// sandbox
//static NSString *const eBayFindingServiceURLString = @"http://svcs.sandbox.ebay.com/services/search/FindingService/v1";

@implementation EBayFindingServiceClient

+ (EBayFindingServiceClient *)sharedClient {
    static EBayFindingServiceClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[EBayFindingServiceClient alloc] initWithBaseURL:[NSURL URLWithString:eBayFindingServiceURLString]];
    });
    
    return _sharedClient;
}

- (id)initWithEndpointURL:(NSURL *)URL {
    
    self = [super initWithEndpointURL:URL];
    if (!self) {
        return nil;
    }
    
    self.soapVersion = SOAP12; // eBay finding service use SOAP 12
    
    [super setDefaultHeader:@"X-EBAY-SOA-SECURITY-APPNAME" value:eBayAppId];
    [super setDefaultHeader:@"X-EBAY-SOA-MESSAGE-PROTOCOL" value:@"SOAP12"];
    [super setDefaultHeader:@"X-EBAY-SOA-REQUEST-DATA-FORMAT" value:@"SOAP"];
}

@end
