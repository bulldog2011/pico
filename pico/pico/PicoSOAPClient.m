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

+ (instancetype)clientWithEndpointURL:(NSURL *)URL {
    return [[self alloc] initWithEndpointURL:URL];
}

- (id)initWithEndpointURL:(NSURL *)URL {
    NSParameterAssert(URL);
    
    self = [super initWithBaseURL:URL];
    if (!self) {
        return nil;
    }
    
    self.soapVersion = SOAP11; // defaut to soap 11
    
    self.parameterEncoding = PicoSOAPParameterEncoding;
    
    [self registerHTTPOperationClass:[PicoRequestOperation class]];
    [self setDefaultHeader:@"Accept" value:@"application/soap+xml"];
    
    self.endpointURL = URL;
    
    return self;
}

- (void)invoke:(id<PicoBindable>)requestObject responseClass:(Class)responseClazz
       success:(void (^)(PicoRequestOperation *operation, id<PicoBindable> responseObject))success
       failure:(void (^)(PicoRequestOperation *operation, NSError *error, id<PicoBindable> soapFault))failure {
    
    NSMutableURLRequest *request = [self requestWithMethod:@"POST" requestObject:requestObject];
    AFHTTPRequestOperation *httpOperation = [self HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *operation, id responseObject) {
        PicoRequestOperation *picoOperation = (PicoRequestOperation *)operation;
        if (picoOperation.error) {
            if (failure) {
                failure(picoOperation, picoOperation.error, nil); // http or parsing error
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
            failure(picoOperation, picoOperation.error, picoOperation.responseObj);
        }
    }];
    
    PicoRequestOperation *picoOperation = (PicoRequestOperation *)httpOperation;
    picoOperation.soapVersion = self.soapVersion;
    picoOperation.responseClazz = responseClazz;
    picoOperation.debug = self.debug;
    
    [self enqueueHTTPRequestOperation:httpOperation];
}

- (NSMutableURLRequest *)requestWithMethod:(NSString *)method requestObject:(id<PicoBindable>)requestObject {
    NSAssert(requestObject != nil, @"Expect non-nil request object");
    NSAssert([[requestObject class] conformsToProtocol:@protocol(PicoBindable)], @"Expect request object conforms to PicoBindable protocol");
    
    NSMutableURLRequest *request = [super requestWithMethod:method path:[self.endpointURL absoluteString] parameters:nil];
    
    PicoSOAPWriter *soapWriter = [[PicoSOAPWriter alloc] init];
    
    // marshall to soap message
    NSData *soapData = nil;
    if (self.soapVersion == SOAP11) {
        SOAP11Envelope *soap11Envelope = [[SOAP11Envelope alloc] init];
        SOAP11Body *soap11Body = [[SOAP11Body alloc] init];
        soap11Envelope.body = soap11Body;
        soap11Envelope.body.any = [NSMutableArray arrayWithObject:requestObject];
        soapData = [soapWriter toData:requestObject];
        [soap11Body release];
        [soap11Envelope release];
    } else {
        SOAP12Envelope *soap12Envelope = [[SOAP12Envelope alloc] init];
        SOAP12Body *soap12Body = [[SOAP12Body alloc] init];
        soap12Envelope.body = soap12Body;
        soap12Envelope.body.any = [NSMutableArray arrayWithObject:requestObject];
        soapData = [soapWriter toData:requestObject];
        [soap12Body release];
        [soap12Envelope release];
    }
    
    [soapWriter release];
    
    NSAssert(soapData != nil, @"Expect success soap marshalling");
    
    if (self.debug) {
        NSLog(@"Request soap message:");
        NSLog(@"%@", [NSString stringWithUTF8String:[soapData bytes]]);
    }
    
    request.HTTPBody = soapData;
    
    return request;
}
@end
