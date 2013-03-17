//
//  PicoBindable.h
//  Pico
//
//  Created by bulldog on 13-2-24.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

@class PicoClassSchema;
@protocol PicoBindable <NSObject>

+(PicoClassSchema *)getClassMetaData;
+(NSMutableDictionary *)getPropertyMetaData;

@end
