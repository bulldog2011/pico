//
//  AWSECommerceServiceClient.h
//  AWSECommerce
//
//  Created by user on 13-3-21.
//  Copyright (c) 2013年 Leansoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AWSECommerceServicePortType_SOAPClient.h"

extern NSString *const AWSAccessKeyId;

@interface AWSECommerceServiceClient : AWSECommerceServicePortType_SOAPClient

+ (AWSECommerceServiceClient *)sharedClient;

- (void)authenticateRequest:(NSString *)action;

@end
