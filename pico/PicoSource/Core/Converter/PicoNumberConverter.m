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

-(NSString *)write:(NSNumber *)value {
	NSString *result = [value stringValue];
	return result;
}

static NSNumberFormatter *formatter = nil;
static NSString *fLock = @"Lock";

-(NSNumber *)read:(NSString *)value {
	
	NSNumber *result = nil;
	@synchronized(fLock) {
        
		if (formatter == nil) {
			formatter = [[NSNumberFormatter alloc] init];
            formatter.locale = [PicoConfig getLocale];
		}
        
		result = [formatter numberFromString:value];
	}
	
	return result;
}

@end
