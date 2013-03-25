//
//  PicoClassSchema.m
//  Pico
//
//  Created by bulldog on 13-2-24.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoClassSchema.h"

@implementation PicoClassSchema

@synthesize xmlName = _xmlName;
@synthesize nsURI = _nsURI;

-(id)initWithXmlName:(NSString *)name nsUri:(NSString *)uri {
    self = [super init];
    if (self) {
        self.xmlName = name;
        self.nsURI = uri;
    }
    return self;
}

-(void) dealloc {
    self.xmlName = nil;
    self.nsURI = nil;
    [super dealloc];
}

@end
