//
//  ChineseBulldog.m
//  picoTest
//
//  Created by bulldog on 13-2-25.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "ChineseBulldog.h"
#import "PicoClassSchema.h"
#import "PicoPropertySchema.h"
#import "PicoConstants.h"

@implementation ChineseBulldog

@synthesize native;

+(PicoClassSchema *)getClassMetaData {
	PicoClassSchema *cs = [[PicoClassSchema alloc] initWithXmlName:@"CNBulldog" nsUri:@"x.y.z"];
	[cs autorelease];
	return cs;
}

+(NSMutableDictionary *)getPropertyMetaData {
	NSMutableDictionary *map = [NSMutableDictionary dictionary];
	PicoPropertySchema *ps = nil;
	
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"Native" propertyName:@"native" type:PICO_TYPE_STRING clazz:nil];
	[map setObject:ps forKey:@"native"];
	[ps release];
	
	return map;
}

-(void)dealloc {
	self.native = nil;
	[super dealloc];
}

@end
