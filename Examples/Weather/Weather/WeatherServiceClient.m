//
//  WeatherServiceClient.m
//  Weather
//
//  Created by bulldog on 13-3-20.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

#import "WeatherServiceClient.h"

static NSString *const weatherServiceURLString = @"http://wsf.cdyne.com/WeatherWS/Weather.asmx";

@implementation WeatherServiceClient

+ (WeatherServiceClient *)sharedClient {
    static WeatherServiceClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[WeatherServiceClient alloc] initWithEndpointURL:[NSURL URLWithString:weatherServiceURLString]];
    });
    
    return _sharedClient;
}

@end
