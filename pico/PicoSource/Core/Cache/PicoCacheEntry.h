//
//  PicoCacheEntry.h
//  pico
//
//  Created by bulldog on 13-2-25.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

@interface PicoCacheEntry : NSObject {
@private
    id _key;
    id _object;
    
}

@property (nonatomic, retain, readwrite) id key;
@property (nonatomic, retain, readwrite) id object;


-(id) initWithObject:(id)obj forKey:(id)key;

@end
