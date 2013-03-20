//
//  WeatherServiceClient.h
//  Weather
//
//  Created by bulldog on 13-3-20.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

#import "WeatherSoap_SOAPClient.h"

@interface WeatherServiceClient : WeatherSoap_SOAPClient

+ (WeatherServiceClient *)sharedClient;

@end
