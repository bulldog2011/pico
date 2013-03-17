//
//  PicoDateConverter.m
//  pico
//
//  Created by bulldog on 13-2-24.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoDateConverter.h"

@implementation PicoDateConverter

-(NSString *)write:(NSDate *)date withConfig:(PicoConfig *)config {
	
	NSString *dateString = [config.dateFormatter stringFromDate: date];
	
	return dateString;
}

-(NSDate *)read: (NSString *) value withConfig:(PicoConfig *)config{
	
	NSDate *date = [config.dateFormatter dateFromString:value];
	
	return date;
}



@end
