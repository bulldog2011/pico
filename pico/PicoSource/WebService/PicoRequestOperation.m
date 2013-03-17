//
//  PicoRequestOperation.m
//  Pico
//
//  Created by bulldog on 13-3-15.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoRequestOperation.h"
#import "PicoSOAPReader.h"
#import "SOAP11Envelope.h"
#import "SOAP12Envelope.h"
#import "SOAP11Body.h"
#import "SOAP12Body.h"

static dispatch_queue_t ls_pico_request_operation_processing_queue;
static dispatch_queue_t pico_request_operation_processing_queue() {
    if (ls_pico_request_operation_processing_queue == NULL) {
        ls_pico_request_operation_processing_queue = dispatch_queue_create("com.leansoft.pico.networking.pico-request.processing", 0);
    }
    
    return ls_pico_request_operation_processing_queue;
}

@interface PicoRequestOperation ()
@property (readwrite, nonatomic, retain) NSError *PicoError;
@property (readwrite, nonatomic, retain) id responseObj;
@end

@implementation PicoRequestOperation

@synthesize responseObj = _responseObj;
@synthesize PicoError  = _PicoError;
@synthesize responseClazz = _responseClazz;
@synthesize soapVersion = _soapVersion;
@synthesize debug = _debug;
@synthesize config = _config;

-(void)dealloc {
    [_responseObj release];
    [_PicoError release];
    [_responseClazz release];
    [super dealloc];
}

-(id)responseObj {
    if (!_responseObj && [self isFinished] && [self.responseData length] > 0 && !self.PicoError) {
        
        if (self.debug) {
            NSLog(@"Response message:");
            NSLog(@"%@", [NSString stringWithUTF8String:[self.responseData bytes]]);
            if (self.response) {
                NSLog(@"Response HTTP headers : ");
                for(NSString *key in [self.response allHeaderFields]) {
                    NSLog(@"%@ = %@", key, [[self.response allHeaderFields] valueForKey:key]);
                }
            }
        }
        
        PicoSOAPReader *soapReader = nil;
        @try {
            // unmarshall to object
            soapReader = [[PicoSOAPReader alloc] initWithConfig:self.config];
            if (self.soapVersion == SOAP11) {
                SOAP11Envelope *soap11Envelope = [soapReader fromData:self.responseData withSOAPClass:[SOAP11Envelope class] innerClass:self.responseClazz];
                if (soap11Envelope && soap11Envelope.body && soap11Envelope.body.any.count > 0) {
                    self.responseObj = [soap11Envelope.body.any objectAtIndex:0];
                }
            } else {
                SOAP12Envelope *soap12Envelope = [soapReader fromData:self.responseData withSOAPClass:[SOAP12Envelope class] innerClass:self.responseClazz];
                if (soap12Envelope && soap12Envelope.body && soap12Envelope.body.any.count > 0) {
                    self.responseObj = [soap12Envelope.body.any objectAtIndex:0];
                }
            }
        } @catch (NSException *ex) {
            NSMutableDictionary *userInfo = [NSMutableDictionary dictionaryWithObject:@"Error to read soap response" forKey:NSLocalizedDescriptionKey];
            [userInfo setValue:ex.reason forKey:NSLocalizedFailureReasonErrorKey];
            [userInfo setValue:ex forKey:NSUnderlyingErrorKey];
            self.PicoError = [NSError errorWithDomain:PicoErrorDomain code:ReaderError userInfo:userInfo];
            
        } @finally {
            [soapReader release];
        }
    }
    
    return _responseObj;
}

- (NSError *)error {
    if (_PicoError) {
        return _PicoError;
    } else {
        return [super error];
    }
}

#pragma mark - AFHTTPRequestOperation

+ (NSSet *)acceptableContentTypes {
    return [NSSet setWithObjects:@"application/soap+xml", @"text/xml", nil];
}

- (void)setCompletionBlockWithSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                              failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    self.completionBlock = ^ {
        if ([self isCancelled]) {
            return;
        }
        
        if (self.error) {
            if (failure) {
                dispatch_async(self.failureCallbackQueue ? self.failureCallbackQueue : dispatch_get_main_queue(), ^{
                    failure(self, self.error);
                });
            }
        } else {
            dispatch_async(pico_request_operation_processing_queue(), ^{
                id obj = self.responseObj;
                
                if (self.PicoError) {
                    if (failure) {
                        dispatch_async(self.failureCallbackQueue ? self.failureCallbackQueue : dispatch_get_main_queue(), ^{
                            failure(self, self.error);
                        });
                    }
                } else {
                    if (success) {
                        dispatch_async(self.successCallbackQueue ? self.successCallbackQueue : dispatch_get_main_queue(), ^{
                            success(self, obj);
                        });
                    }
                }
            });
        }
        
    };
}

@end
