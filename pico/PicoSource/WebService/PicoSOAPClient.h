//
//  PicoSOAPClient.h
//  Pico
//
//  Created by bulldog on 13-3-15.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "AFHTTPClient.h"
#import "PicoBindable.h"
#import "PicoSOAPRequestOperation.h"
#import "PicoConfig.h"

@interface PicoSOAPClient : AFHTTPClient

/**
 Target endpoint url, mandatory
 */
@property (readonly, nonatomic, retain) NSURL *endpointURL;

/**
 SOAP version used, default to SOAP11
 */
@property (readwrite, nonatomic, assign) PicoSOAPVersion soapVersion;

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
 
 */
- (id)initWithEndpointURL:(NSURL *)URL;


/**
 
 */
- (void)invoke:(id<PicoBindable>)requestObject responseClass:(Class)responseClazz
             success:(void (^)(PicoSOAPRequestOperation *operation, id<PicoBindable> responseObject))success
             failure:(void (^)(PicoSOAPRequestOperation *operation, NSError *error, id<PicoBindable> soapFault))failure;

@end
