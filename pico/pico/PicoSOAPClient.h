//
//  PicoSOAPClient.h
//  Pico
//
//  Created by bulldog on 13-3-15.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "AFHTTPClient.h"
#import "PicoBindable.h"
#import "PicoRequestOperation.h"

@interface PicoSOAPClient : AFHTTPClient

/**
 
 */
@property (readonly, nonatomic, retain) NSURL *endpointURL;

/**
 
 */
@property (readwrite, nonatomic, assign) PicoSOAPVersion soapVersion;

/**
 
 */
@property (readwrite, nonatomic, assign) BOOL debug;

/**
 
 */
- (id)initWithEndpointURL:(NSURL *)URL;


/**
 
 */
- (void)invoke:(id<PicoBindable>)requestObject responseClass:(Class)responseClazz
             success:(void (^)(PicoRequestOperation *operation, id<PicoBindable> responseObject))success
             failure:(void (^)(PicoRequestOperation *operation, NSError *error, id<PicoBindable> soapFault))failure;

@end
