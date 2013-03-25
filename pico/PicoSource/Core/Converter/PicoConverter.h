//
//  PicoConverter.h
//  pico
//
//  Created by bulldog on 13-2-24.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoConvertable.h"

@interface PicoConverter : NSObject

+(id)read: (NSString *)value withType: (NSString *)type config:(PicoConfig *)config;
+(NSString *)write: (id)value withType: (NSString *)type config:(PicoConfig *)config;
+(BOOL)isPrimitive: (NSString *)type;
+(id <PicoConvertable>)lookup: (NSString *)type;

@end
