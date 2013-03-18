//
//  PicoXMLRequestOperation.m
//  Pico
//
//  Created by bulldog on 13-3-18.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoXMLRequestOperation.h"
#import "PicoXMLReader.h"

static dispatch_queue_t ls_xml_request_operation_processing_queue;
static dispatch_queue_t xml_request_operation_processing_queue() {
    if (ls_xml_request_operation_processing_queue == NULL) {
        ls_xml_request_operation_processing_queue = dispatch_queue_create("com.leansoft.pico.networking.xml-request.processing", 0);
    }
    
    return ls_xml_request_operation_processing_queue;
}

@interface PicoXMLRequestOperation ()
@property (readwrite, nonatomic, retain) NSError *PicoError;
@property (readwrite, nonatomic, retain) id responseObj;
@end

@implementation PicoXMLRequestOperation

@synthesize responseObj = _responseObj;
@synthesize PicoError  = _PicoError;
@synthesize responseClazz = _responseClazz;
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
            NSString *message = [[NSString alloc] initWithData:self.responseData encoding:CFStringConvertEncodingToNSStringEncoding(CFStringConvertIANACharSetNameToEncoding((CFStringRef)self.config.encoding))];
            NSLog(@"%@", message);
            [message release];
            if (self.response) {
                NSLog(@"Response HTTP headers : ");
                for(NSString *key in [self.response allHeaderFields]) {
                    NSLog(@"%@ = %@", key, [[self.response allHeaderFields] valueForKey:key]);
                }
            }
        }
        
        PicoXMLReader *xmlReader = nil;
        @try {
            // unmarshall to object
            xmlReader = [[PicoXMLReader alloc] initWithConfig:self.config];
            self.responseObj = [xmlReader fromData:self.responseData withClass:self.responseClazz];
        } @catch (NSException *ex) {
            NSMutableDictionary *userInfo = [NSMutableDictionary dictionaryWithObject:@"Error to read xml response" forKey:NSLocalizedDescriptionKey];
            [userInfo setValue:ex.reason forKey:NSLocalizedFailureReasonErrorKey];
            [userInfo setValue:ex forKey:NSUnderlyingErrorKey];
            self.PicoError = [NSError errorWithDomain:PicoErrorDomain code:ReaderError userInfo:userInfo];
            
        } @finally {
            [xmlReader release];
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
    return [NSSet setWithObjects:@"text/xml", nil];
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
            dispatch_async(xml_request_operation_processing_queue(), ^{
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
