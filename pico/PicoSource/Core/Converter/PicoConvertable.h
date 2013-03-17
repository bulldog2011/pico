//
//  PicoConvertable.h
//  pico
//
//  Created by bulldog on 13-2-24.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoConfig.h"

@protocol PicoConvertable <NSObject>

-(id)read : (NSString *)value withConfig:(PicoConfig *)config;
-(NSString *)write: (id)value withConfig:(PicoConfig *)config;

@end
