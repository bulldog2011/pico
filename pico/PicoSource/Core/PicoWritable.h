//
//  PicoWritable.h
//  pico
//
//  Created by bulldog on 13-2-26.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

@protocol PicoWritable <NSObject>

// Convert object to binary data
-(NSData *)toData:(id)obj;

// Convert object to string
-(NSString *)toString:(id)obj;

@end
