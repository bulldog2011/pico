//
//  PicoDateConverter.m
//  pico
//
//  Created by bulldog on 13-2-24.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoDateConverter.h"
#import "PicoConfig.h"

@implementation PicoDateConverter

static NSDateFormatter *writeFormatter = nil;
static NSString *wLock = @"wLock";
static NSDateFormatter *readFormatter = nil;
static NSString *rLock = @"rLock";

-(NSString *)write:(NSDate *)date {
	
	NSString *dateString = nil;
	
	@synchronized(wLock) {
        
		if (writeFormatter == nil) {
			writeFormatter = [[NSDateFormatter alloc] init];
			[writeFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"];
			[writeFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
			
			[writeFormatter setLocale:[PicoConfig getLocale]];
		}
        
		dateString = [writeFormatter stringFromDate: date];
		
	}
	
	return dateString;
}

-(NSDate *)read: (NSString *) value {
	
	NSDate *date = nil;
	
	@synchronized(rLock) {
		
		if(readFormatter == nil) {
			readFormatter = [[NSDateFormatter alloc] init];
			[readFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"];
			[readFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
			
			[readFormatter setLocale:[PicoConfig getLocale]];
		}
        
	    date = [readFormatter dateFromString:value];
		
	}
	
	return date;
}



@end
