//
//  EBayShoppingServiceClient.m
//  eBayShopping
//
//  Created by bulldog on 13-3-17.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

#import "EBayShoppingServiceClient.h"

static NSString *const eBayAppId = @"YOUR APPID HERE";

// production
static NSString *const eBayShoppingServiceURLString = @"http://open.api.ebay.com/shopping?";
// sandbox
//static NSString *const eBayShoppingServiceURLString = @"http://open.api.sandbox.ebay.com/shopping";

static NSString *const targetAPIVersion = @"809";
/**
 for site id list, see http://developer.ebay.com/DevZone/shopping/docs/CallRef/types/SiteCodeType.html
 */
static NSString *const targetSiteId = @"0"; // 0 for US

@implementation EBayShoppingServiceClient

+ (EBayShoppingServiceClient *)sharedClient {
    static EBayShoppingServiceClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[EBayShoppingServiceClient alloc] initWithEndpointURL:[NSURL URLWithString:eBayShoppingServiceURLString]];
    });
    
    return _sharedClient;
}

- (id)initWithEndpointURL:(NSURL *)URL {
    
    self = [super initWithEndpointURL:URL];
    if (!self) {
        return nil;
    }
    
    [super setDefaultHeader:@"X-EBAY-API-APP-ID" value:eBayAppId];
    [super setDefaultHeader:@"X-EBAY-API-REQUEST-ENCODING" value:@"XML"];
    //[super setDefaultHeader:@"X-EBAY-API-RESPONSE-ENCODING" value:@"XML"];
    [super setDefaultHeader:@"X-EBAY-API-VERSION" value:targetAPIVersion];
    [super setDefaultHeader:@"X-EBAY-API-SITE-ID"value:targetSiteId];
    
    return self;
}

@end
