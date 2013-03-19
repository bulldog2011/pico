//
//  PicoXMLClient.h
//  Pico
//
//  Created by bulldog on 13-3-18.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "AFHTTPClient.h"
#import "PicoBindable.h"
#import "PicoXMLRequestOperation.h"
#import "PicoConfig.h"

@interface PicoXMLClient : AFHTTPClient

/**
 Target endpoint url, mandatory
 */
@property (readonly, nonatomic, retain) NSURL *endpointURL;

/**
 Should request/response be output for debugging
 */
@property (readwrite, nonatomic, assign) BOOL debug;

/**
 Configurations like encoding, date/number formatter, etc.
 Defaults will be used if not set explicitly.
 */
@property (readwrite, nonatomic, retain) PicoConfig *config;

/**
 Additional parameters that will be appended as query string at the end of the request url
 */
@property (readwrite, nonatomic, retain) NSMutableDictionary *additionalParameters;

/**
 HTTP request timeout settting
 */
@property (readwrite, nonatomic, assign) NSTimeInterval timeoutInverval;

/**
 
 */
- (id)initWithEndpointURL:(NSURL *)URL;


/**
 
 */
- (void)invoke:(id<PicoBindable>)requestObject responseClass:(Class)responseClazz
       success:(void (^)(PicoXMLRequestOperation *operation, id<PicoBindable> responseObject))success
       failure:(void (^)(PicoXMLRequestOperation *operation, NSError *error))failure;

@end
