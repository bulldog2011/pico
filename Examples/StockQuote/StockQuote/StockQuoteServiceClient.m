//
//  StockQuoteServiceClient.m
//  StockQuote
//
//  Created by user on 13-3-19.
//  Copyright (c) 2013年 Leansoft. All rights reserved.
//

#import "StockQuoteServiceClient.h"

static NSString *const stockQuoteServiceURLString = @"http://www.webservicex.net/stockquote.asmx";

@implementation StockQuoteServiceClient

+ (StockQuoteServiceClient *)sharedClient {
    static StockQuoteServiceClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[StockQuoteServiceClient alloc] initWithEndpointURL:[NSURL URLWithString:stockQuoteServiceURLString]];
    });
    
    return _sharedClient;
}

@end
