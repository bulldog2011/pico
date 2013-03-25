//
//  PicoNumberConverter.m
//  pico
//
//  Created by bulldog on 13-2-24.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoNumberConverter.h"
#import "PicoConfig.h"

@implementation PicoNumberConverter

-(NSString *)write:(NSNumber *)value withConfig:(PicoConfig *)config {
	NSString *result = [value stringValue];
	return result;
}

-(NSNumber *)read:(NSString *)value withConfig:(PicoConfig *)config {
	NSNumber *result = [config.numberFormatter numberFromString:value];
	return result;
}

@end
