//
//  PicoCache.h
//  pico
//
//  Created by bulldog on 13-2-25.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

@interface PicoCache : NSObject {
@private
    NSUInteger _countLimit;
    
}

@property (nonatomic, assign, readwrite) NSUInteger countLimit;

- (id) initWithCountLimit : (NSUInteger) limit;
- (id) objectForKey: (id)key;
- (void) setObject: (id)object forKey:(id)key;
- (NSArray *)allKeys;
- (NSArray *)allValues;
- (void)removeObjectForKey:(id)key;
- (void)removeAllObjects;
- (NSUInteger)count;

@end
