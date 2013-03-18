//
//  EBayTradingSerivceClient.m
//  eBayTrading
//
//  Created by bulldog on 13-3-18.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

#import "EBayTradingServiceClient.h"
#import "Trading_CustomSecurityHeaderType.h"

static NSString *const eBayAppId = @"YOUR APPID HERE";
static NSString *const eBayAuthToken = @"YOUR TOKEN HERE";

// production
//static NSString *const eBayTradingServiceURLString = @"https://api.ebay.com/wsapi ";
// sandbox
static NSString *const eBayTradingServiceURLString = @"https://api.sandbox.ebay.com/wsapi";

static NSString *const targetAPIVersion = @"809";
/**
 for site id list, see http://developer.ebay.com/DevZone/shopping/docs/CallRef/types/SiteCodeType.html
 */
static NSString *const targetSiteId = @"0"; // 0 for US

@implementation EBayTradingServiceClient

+ (EBayTradingServiceClient *)sharedClient {
    static EBayTradingServiceClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[EBayTradingServiceClient alloc] initWithEndpointURL:[NSURL URLWithString:eBayTradingServiceURLString]];
    });
    
    return _sharedClient;
}

- (id)initWithEndpointURL:(NSURL *)URL {
    
    self = [super initWithEndpointURL:URL];
    if (!self) {
        return nil;
    }
    
    [self setDefaultHeader:@"Accept" value:@"application/soap+xml"];
    [self setDefaultHeader:@"Content-Type" value:@"application/soap+xml"];
    
    self.additionalParameters = [NSMutableDictionary dictionary];
    [self.additionalParameters setObject:targetSiteId forKey:@"siteid"];
    [self.additionalParameters setObject:targetAPIVersion forKey:@"version"];
    [self.additionalParameters setObject:eBayAppId forKey:@"appid"];
    [self.additionalParameters setObject:@"Routing" forKey:@"new"];
    
    [self setDefaultHeader:@"SOAPAction" value:@""];
    
    Trading_CustomSecurityHeaderType *customHeader = [[[Trading_CustomSecurityHeaderType alloc] init] autorelease];
    customHeader.eBayAuthToken = eBayAuthToken;
    self.customSoapHeader = customHeader;
    // for some calls like FetchToken, RevokeToken, GetTokenStatus, and GetSessionID,
    // you also need to add DevId, AppId and AuthCert in the custom header.
    
    return self;
}

@end
