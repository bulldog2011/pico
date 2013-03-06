//
//  PicoReadable.h
//  pico
//
//  Created by bulldog on 13-2-26.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

@protocol PicoReadable <NSObject>

// Convert binary data to object of specific class
-(id)fromData:(NSData *)data withClass:(Class)clazz;

// Convert string to object of specific class
-(id)fromString:(NSString *)string withClass:(Class)clazz;

@end
