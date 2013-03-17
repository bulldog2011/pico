//
//  PicoConvertable.h
//  pico
//
//  Created by bulldog on 13-2-24.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

@protocol PicoConvertable <NSObject>

-(id)read : (NSString *)value;
-(NSString *)write: (id)value;

@end
