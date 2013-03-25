//
//  BarCodeServiceClient.m
//  BarCode
//
//  Created by bulldog on 13-3-20.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

#import "BarCodeServiceClient.h"

static NSString *const barCodeServiceURLString = @"http://www.webservicex.net/genericbarcode.asmx";

@implementation BarCodeServiceClient

+ (BarCodeServiceClient *)sharedClient {
    static BarCodeServiceClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[BarCodeServiceClient alloc] initWithEndpointURL:[NSURL URLWithString:barCodeServiceURLString]];
    });
    
    return _sharedClient;
}

@end
