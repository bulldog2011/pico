//
//  PicoXMLClient.m
//  Pico
//
//  Created by bulldog on 13-3-18.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoXMLClient.h"
#import "PicoXMLWriter.h"

enum {
    PicoXMLParameterEncoding = 11
};

@interface PicoXMLClient ()

@property (readwrite, nonatomic, retain) NSURL *endpointURL;

@end

@implementation PicoXMLClient


@synthesize endpointURL = _endpointURL;
@synthesize debug = _debug;
@synthesize config = _config;
@synthesize additionalParameters = _additionalParameters;

- (id)initWithEndpointURL:(NSURL *)URL {
    NSParameterAssert(URL);
    
    self = [super initWithBaseURL:URL];
    if (!self) {
        return nil;
    }
    
    _config = [[PicoConfig alloc] init]; // default config
    
    self.parameterEncoding = PicoXMLParameterEncoding;
    
    [self registerHTTPOperationClass:[PicoXMLRequestOperation class]];
    [self setDefaultHeader:@"Accept" value:@"text/xml"];
    [self setDefaultHeader:@"Content-Type" value:@"text/xml"];
    
    self.endpointURL = URL;
    
    self.timeoutInverval = 60;
    
    return self;
}

- (void)invoke:(id<PicoBindable>)requestObject responseClass:(Class)responseClazz
       success:(void (^)(PicoXMLRequestOperation *operation, id<PicoBindable> responseObject))success
       failure:(void (^)(PicoXMLRequestOperation *operation, NSError *error))failure {
    
    NSParameterAssert(self.config);
    
    @try {
        NSMutableURLRequest *request = [self requestWithMethod:@"POST" requestObject:requestObject];
        request.timeoutInterval = self.timeoutInverval;
        
        AFHTTPRequestOperation *httpOperation = [self HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *operation, id responseObject) {
            PicoXMLRequestOperation *picoOperation = (PicoXMLRequestOperation *)operation;
            if (picoOperation.responseObj) {
                if (success) {
                    success(picoOperation, picoOperation.responseObj);
                }
            } else {
                if (failure) {
                    NSMutableDictionary *userInfo = [NSMutableDictionary dictionaryWithObject:@"Empty response" forKey:NSLocalizedDescriptionKey];
                    NSError *error = [NSError errorWithDomain:PicoErrorDomain code:ReaderError userInfo:userInfo];
                    failure(picoOperation, error);
                }
            }
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) { // http error
            if (failure) {
                PicoXMLRequestOperation *picoOperation = (PicoXMLRequestOperation *)operation;
                failure(picoOperation, picoOperation.error);
            }
        }];
        
        PicoXMLRequestOperation *picoOperation = (PicoXMLRequestOperation *)httpOperation;
        picoOperation.responseClazz = responseClazz;
        picoOperation.debug = self.debug;
        picoOperation.config = self.config;
        
        if (self.debug) {
            NSLog(@"Request HTTP Headers : \n%@", [request allHTTPHeaderFields]);
        }
        
        [self enqueueHTTPRequestOperation:httpOperation];
        
    } @catch (NSException* ex) {
        NSMutableDictionary *userInfo = [NSMutableDictionary dictionaryWithObject:@"Error to build request" forKey:NSLocalizedDescriptionKey];
        [userInfo setValue:ex.reason forKey:NSLocalizedFailureReasonErrorKey];
        [userInfo setValue:ex forKey:NSUnderlyingErrorKey];
        NSError *error = [NSError errorWithDomain:PicoErrorDomain code:WriterError userInfo:userInfo];
        if (self.debug) {
            NSLog(@"Error to build request : \n%@", error);
        }
        if (failure) {
            failure(nil, error);
        }
        return;
    }
}

- (NSMutableURLRequest *)requestWithMethod:(NSString *)method requestObject:(id<PicoBindable>)requestObject {
    NSAssert(requestObject != nil, @"Expect non-nil request object");
    NSAssert([[requestObject class] conformsToProtocol:@protocol(PicoBindable)], @"Expect request object conforms to PicoBindable protocol");
    
    NSString *url = [self.endpointURL absoluteString];
    if (self.additionalParameters.count > 0) {
        url = [url stringByAppendingFormat:[url rangeOfString:@"?"].location == NSNotFound ? @"?%@" : @"&%@", AFQueryStringFromParametersWithEncoding(self.additionalParameters, self.stringEncoding)];
    }
    if (self.debug) {
        NSLog(@"Sending request to : %@", url);
    }
    NSMutableURLRequest *request = [super requestWithMethod:method path:url parameters:nil];
    
    PicoXMLWriter *xmlWriter = [[[PicoXMLWriter alloc] initWithConfig:self.config] autorelease];
    // marshall to xml message
    NSData *xmlData = [xmlWriter toData:requestObject];
    
    NSAssert(xmlData != nil, @"Expect success soap marshalling");
    
    if (self.debug) {
        NSLog(@"Request message:");
        NSString *message = [[NSString alloc] initWithData:xmlData encoding:CFStringConvertEncodingToNSStringEncoding(CFStringConvertIANACharSetNameToEncoding((CFStringRef)self.config.encoding))];
        NSLog(@"%@", message);
        [message release];
    }
    
    request.HTTPBody = xmlData;
    
    return request;
}


- (void)dealloc {
    self.endpointURL = nil;
    self.config = nil;
    self.additionalParameters = nil;
    [super dealloc];
}
@end
