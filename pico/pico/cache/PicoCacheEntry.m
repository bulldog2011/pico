//
//  PicoCacheEntry.m
//  pico
//
//  Created by bulldog on 13-2-25.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoCacheEntry.h"

@implementation PicoCacheEntry

@synthesize key = _key, object = _object;

- (id) init {
    return [self initWithObject:nil forKey:nil];
}

- (id) initWithObject:(id)obj forKey:(id)key {
    self = [super init];
    if (self) {
        self.key = key;
        self.object = obj;
    }
    
    return self;
}

-(void) dealloc {
    self.key = nil;
    self.object = nil;
    [super dealloc];
}

@end
