//
//  PicoConverter.m
//  pico
//
//  Created by bulldog on 13-2-24.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoConverter.h"
#import "PicoConstants.h"
#import "PicoNumberConverter.h"
#import "PicoBoolConverter.h"
#import "PicoStringConverter.h"
#import "PicoConvertable.h"
#import "PicoDateConverter.h"

@implementation PicoConverter

static NSMutableDictionary *cache = nil;

+ (void) initialize {
	cache = [[NSMutableDictionary alloc] init];
	
	id <PicoConvertable> converter = nil;
	
	// pre-initialize converters
	converter = [[PicoStringConverter alloc] init];
	[cache setObject: converter forKey: PICO_TYPE_STRING];
	[converter release];
	
	converter = [[PicoNumberConverter alloc] init];
	[cache setObject: converter forKey: PICO_TYPE_INT];
	[converter release];
	
	converter = [[PicoNumberConverter alloc] init];
	[cache setObject: converter forKey: PICO_TYPE_DOUBLE];
	[converter release];
	
	converter = [[PicoNumberConverter alloc] init];
	[cache setObject: converter forKey: PICO_TYPE_SHORT];
	[converter release];
	
	converter = [[PicoNumberConverter alloc] init];
	[cache setObject: converter forKey: PICO_TYPE_LONG];
	[converter release];
	
	converter = [[PicoNumberConverter alloc] init];
	[cache setObject: converter forKey: PICO_TYPE_FLOAT];
	[converter release];
	
	converter = [[PicoBoolConverter alloc] init];
	[cache setObject: converter forKey: PICO_TYPE_BOOL];
	[converter release];
	
	converter = [[PicoStringConverter alloc] init];
	[cache setObject: converter forKey: PICO_TYPE_ENUM];
	[converter release];
	
	converter = [[PicoDateConverter alloc] init];
	[cache setObject: converter forKey: PICO_TYPE_DATE];
	[converter release];
    
	converter = [[PicoStringConverter alloc] init];
	[cache setObject: converter forKey: PICO_TYPE_DURATION];
	[converter release];
	
	converter = [[PicoStringConverter alloc] init];
	[cache setObject: converter forKey: PICO_TYPE_CHAR];
	[converter release];
    
    converter = [[PicoStringConverter alloc] init];
	[cache setObject: converter forKey: PICO_TYPE_QNAME];
	[converter release];
	
	converter = [[PicoNumberConverter alloc] init];
	[cache setObject: converter forKey: PICO_TYPE_BYTE];
	[converter release];
    
}

+(id)read: (NSString *)value withType: (NSString *)type config:(PicoConfig *)config {
	id <PicoConvertable> converter = [PicoConverter lookup:type];
	if (converter == nil) {
		@throw [NSException exceptionWithName:@"ConverterException" reason:[NSString stringWithFormat:@"no converter found for type : %@", type] userInfo:nil];
	}
	return [converter read:value withConfig:config];
}

+(NSString *)write: (id)value withType: (NSString *)type config:(PicoConfig *)config {
	id <PicoConvertable> converter = [PicoConverter lookup:type];
	if (converter == nil) {
		@throw [NSException exceptionWithName:@"ConverterException" reason:[NSString stringWithFormat:@"no converter found for type : %@", type] userInfo:nil];
	}
	return [converter write:value withConfig:config];
}

+(BOOL) isPrimitive:(NSString *)type {
	return [PicoConverter lookup:type] != nil;
}

+(id <PicoConvertable>)lookup: (NSString *)type {
	
	id <PicoConvertable> converter = [cache objectForKey:type];
	return converter;
    
}

@end
