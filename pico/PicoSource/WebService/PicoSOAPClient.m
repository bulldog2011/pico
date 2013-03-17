//
//  PicoSOAPClient.m
//  Pico
//
//  Created by bulldog on 13-3-15.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoSOAPClient.h"
#import "SOAP11Fault.h"
#import "SOAP12Fault.h"
#import "PicoSOAPWriter.h"
#import "SOAP11Envelope.h"
#import "SOAP11Body.h"
#import "SOAP12Envelope.h"
#import "SOAP12Body.h"

enum {
    PicoSOAPParameterEncoding = 10
};

@interface PicoSOAPClient ()

@property (readwrite, nonatomic, retain) NSURL *endpointURL;

@end

@implementation PicoSOAPClient
@synthesize endpointURL = _endpointURL;
@synthesize soapVersion = _soapVersion;
@synthesize debug = _debug;
@synthesize config = _config;

- (id)initWithEndpointURL:(NSURL *)URL {
    NSParameterAssert(URL);
    
    self = [super initWithBaseURL:URL];
    if (!self) {
        return nil;
    }
    
    self.soapVersion = SOAP11; // defaut to soap 11
    
    _config = [[PicoConfig alloc] init]; // default config
    
    self.parameterEncoding = PicoSOAPParameterEncoding;
    
    [self registerHTTPOperationClass:[PicoRequestOperation class]];
    [self setDefaultHeader:@"Accept" value:@"text/xml"];
    [self setDefaultHeader:@"Content-Type" value:@"text/xml"];
    
    self.endpointURL = URL;
    
    return self;
}

- (void)invoke:(id<PicoBindable>)requestObject responseClass:(Class)responseClazz
       success:(void (^)(PicoRequestOperation *operation, id<PicoBindable> responseObject))success
       failure:(void (^)(PicoRequestOperation *operation, NSError *error, id<PicoBindable> soapFault))failure {
    
    NSParameterAssert(self.config);

    @try {
        NSMutableURLRequest *request = [self requestWithMethod:@"POST" requestObject:requestObject];

        AFHTTPRequestOperation *httpOperation = [self HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *operation, id responseObject) {
            PicoRequestOperation *picoOperation = (PicoRequestOperation *)operation;
            if (picoOperation.error) {
                if (failure) {
                    failure(picoOperation, picoOperation.error, nil); // parsing error
                }
            } else if (picoOperation.responseObj) {
                if ([picoOperation.responseObj isMemberOfClass:[SOAP11Fault class]] || [picoOperation.responseObj isMemberOfClass:[SOAP12Fault class]]) {
                    if (failure) {
                        failure(picoOperation, nil, picoOperation.responseObj); // soap fault
                    }
                } else {
                    if (success) {
                        success(picoOperation, picoOperation.responseObj);
                    }
                }
            }

        } failure:^(AFHTTPRequestOperation *operation, NSError *error) { // http error
            if (failure) {
                PicoRequestOperation *picoOperation = (PicoRequestOperation *)operation;
                if (picoOperation.responseObj) {
                    if ([picoOperation.responseObj isMemberOfClass:[SOAP11Fault class]] || [picoOperation.responseObj isMemberOfClass:[SOAP12Fault class]]) {
                        failure(picoOperation, nil, picoOperation.responseObj); // soap fault
                    }
                } else {
                    failure(picoOperation, picoOperation.error, nil);
                }
            }
        }];

        PicoRequestOperation *picoOperation = (PicoRequestOperation *)httpOperation;
        picoOperation.soapVersion = self.soapVersion;
        picoOperation.responseClazz = responseClazz;
        picoOperation.debug = self.debug;
        picoOperation.config = self.config;

        if (self.debug) {
            NSLog(@"Sending reqeust to : %@", [self.endpointURL absoluteString]);
            NSLog(@"Request HTTP Headers : ");
            for(NSString *key in [request allHTTPHeaderFields]) {
                NSLog(@"%@ = %@", key, [[request allHTTPHeaderFields] valueForKey:key]);
            }
        }

        [self enqueueHTTPRequestOperation:httpOperation];
        
    } @catch (NSException* ex) {
        NSMutableDictionary *userInfo = [NSMutableDictionary dictionaryWithObject:@"Error to build request" forKey:NSLocalizedDescriptionKey];
        [userInfo setValue:ex.reason forKey:NSLocalizedFailureReasonErrorKey];
        [userInfo setValue:ex forKey:NSUnderlyingErrorKey];
        NSError *error = [NSError errorWithDomain:PicoErrorDomain code:WriterError userInfo:userInfo];
        if (failure) {
            failure(nil, error, nil);
        }
        return;
    }
}

- (NSMutableURLRequest *)requestWithMethod:(NSString *)method requestObject:(id<PicoBindable>)requestObject {
    NSAssert(requestObject != nil, @"Expect non-nil request object");
    NSAssert([[requestObject class] conformsToProtocol:@protocol(PicoBindable)], @"Expect request object conforms to PicoBindable protocol");
    
    NSMutableURLRequest *request = [super requestWithMethod:method path:[self.endpointURL absoluteString] parameters:nil];
    
    PicoSOAPWriter *soapWriter = [[PicoSOAPWriter alloc] initWithConfig:self.config];
    
    // marshall to soap message
    NSData *soapData = nil;
    if (self.soapVersion == SOAP11) {
        SOAP11Envelope *soap11Envelope = [[SOAP11Envelope alloc] init];
        SOAP11Body *soap11Body = [[SOAP11Body alloc] init];
        soap11Envelope.body = soap11Body;
        soap11Envelope.body.any = [NSMutableArray arrayWithObject:requestObject];
        soapData = [soapWriter toData:soap11Envelope];
        [soap11Body release];
        [soap11Envelope release];
    } else {
        SOAP12Envelope *soap12Envelope = [[SOAP12Envelope alloc] init];
        SOAP12Body *soap12Body = [[SOAP12Body alloc] init];
        soap12Envelope.body = soap12Body;
        soap12Envelope.body.any = [NSMutableArray arrayWithObject:requestObject];
        soapData = [soapWriter toData:soap12Envelope];
        [soap12Body release];
        [soap12Envelope release];
    }
    
    [soapWriter release];
    
    NSAssert(soapData != nil, @"Expect success soap marshalling");
    
    if (self.debug) {
        NSLog(@"Request message:");
        NSLog(@"%@", [NSString stringWithUTF8String:[soapData bytes]]);
    }
    
    request.HTTPBody = soapData;
    
    return request;
}

- (void)dealloc {
    self.endpointURL = nil;
    self.config = nil;
    [super dealloc];
}
@end
