//
//  PicoRequestOperation.h
//  Pico
//
//  Created by bulldog on 13-3-15.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "AFHTTPRequestOperation.h"
#import "PicoConstants.h"
#import "PicoConfig.h"

/**
 `PicoSOAPRequestOperation` is a subclass of `AFHTTPRequestOperation` for Pico SOAP binding support.
 
 ## Acceptable Content Types
 
 By default, `PicoSOAPRequestOperation` accepts the following MIME types, which includes the official standard, `application/soap+xml`, as well as other commonly-used types:
 
 - `application/soap+xml`
 - `text/xml`
 */
@interface PicoSOAPRequestOperation : AFHTTPRequestOperation

///----------------------------
/// @name Getting Response Data
///----------------------------

/**
 A Pico bindable object constructed from the response data. If an error occurs while parsing, `nil` will be returned, and the `error` property will be set to the error.
 */
@property (readonly, nonatomic, retain) id responseObj;

/**
 Target Pico binding class
 */
@property (readwrite, nonatomic, retain) Class responseClazz;

/**
 SOAP version
 */
@property (readwrite, nonatomic, assign) PicoSOAPVersion soapVersion;

/**
 output debug info, such as response soap message
 */
@property (readwrite, nonatomic, assign) BOOL debug;

/**
 Configurations like encoding, date/number formatter, etc
 */
@property (readwrite, nonatomic, retain) PicoConfig *config;

///----------------------------------
/// @name Creating Request Operations
///----------------------------------

/**
 Creates and returns an `PicoRequestOperation` object and sets the specified success and failure callbacks.
 
 @param urlRequest The request object to be loaded asynchronously during execution of the operation
 @param success A block object to be executed when the operation finishes successfully. This block has no return value and takes three arguments: the request sent from the client, the response received from the server, and the Pico bindable object created from the response data of request.
 @param failure A block object to be executed when the operation finishes unsuccessfully, or that finishes successfully, but encountered an error while parsing the resonse data as Pico bindable. This block has no return value and takes three arguments: the request sent from the client, the response received from the server, and the error describing the network or parsing error that occurred.
 
 @return A new Pico request operation
 */
//+ (PicoSOAPRequestOperation *)PicoRequestOperationWithRequest:(NSURLRequest *)urlRequest
//                                                    success:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, id responseObj))success
//                                                    failure:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id responseObj))failure;

@end
