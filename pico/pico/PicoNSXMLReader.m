//
//  PicoNSXMLReader.m
//  pico
//
//  Created by bulldog on 13-2-26.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoNSXMLReader.h"
#import "PicoNSXMLReadHelper.h"
#import "PicoNSXMLReadDelegate.h"
#import "PicoConfig.h"

@implementation PicoNSXMLReader

@synthesize config = _config;

- (id) init {
    PicoConfig *config = [[[PicoConfig alloc] init] autorelease];
    return [self initWithConfig:config];
}

- (id)initWithConfig:(PicoConfig *)config {
    self = [super init];
    if (self) {
        self.config = config;
    }
    
    return self;
}

-(id)fromData:(NSData *)data withClass:(Class)clazz {
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
	[parser setShouldProcessNamespaces:YES];
    
    PicoNSXMLReadHelper *helper = [[PicoNSXMLReadHelper alloc] init];
    id root = [clazz new];
    [root autorelease];
    [helper push:root];
    
    PicoNSXMLReadDelegate *delegate = [[PicoNSXMLReadDelegate alloc] initWithHelper:helper];
    
    [parser setDelegate:delegate];
    [parser parse];
    
    id result = nil;
    if ([helper size] == 1) {
        result = [helper pop];
    }
    [helper release];
    [delegate release];
    
    return result;
}


-(id)fromString:(NSString *)string withClass:(Class)clazz {
    NSData *data = [string dataUsingEncoding: CFStringConvertEncodingToNSStringEncoding(CFStringConvertIANACharSetNameToEncoding((CFStringRef)self.config.encoding)) allowLossyConversion:NO];
    
    return [self fromData:data withClass:clazz];
}


-(void) dealloc {
    self.config = nil;
    [super dealloc];
}

@end
