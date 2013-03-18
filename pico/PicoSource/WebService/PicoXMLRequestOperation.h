//
//  PicoXMLRequestOperation.h
//  Pico
//
//  Created by bulldog on 13-3-18.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "AFHTTPRequestOperation.h"
#import "PicoConstants.h"
#import "PicoConfig.h"

/**
 `PicoXMLRequestOperation` is a subclass of `AFHTTPRequestOperation` for Pico XML binding support.
 
 ## Acceptable Content Types
 
 By default, `PicoSOAPRequestOperation` accepts the following MIME types:
 
 - `text/xml`
 */
@interface PicoXMLRequestOperation : AFHTTPRequestOperation

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
 output debug info, such as response xml message
 */
@property (readwrite, nonatomic, assign) BOOL debug;

/**
 Configurations like encoding, date/number formatter, etc
 */
@property (readwrite, nonatomic, retain) PicoConfig *config;

@end
