//
//  CurrencyConverterSerivceClient.m
//  CurrencyConverter
//
//  Created by bulldog on 13-3-19.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

#import "CurrencyConverterSerivceClient.h"
static NSString *const currencyConverterServiceURLString = @"http://www.webservicex.net/CurrencyConvertor.asmx";

@implementation CurrencyConverterSerivceClient

+ (CurrencyConverterSerivceClient *)sharedClient {
    static CurrencyConverterSerivceClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[CurrencyConverterSerivceClient alloc] initWithEndpointURL:[NSURL URLWithString:currencyConverterServiceURLString]];
    });
    
    return _sharedClient;
}

@end
