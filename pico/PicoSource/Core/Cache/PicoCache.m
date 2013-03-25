//
//  PicoCache.m
//  pico
//
//  Created by bulldog on 13-2-25.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoCache.h"
#import "PicoCacheEntry.h"

@interface PicoCache () {
@private
    NSMutableDictionary *_entries;
    NSMutableArray *_entriesByTime;
}

@property (retain, nonatomic) NSMutableDictionary *entries;
@property (retain, nonatomic) NSMutableArray *entriesByTime;

- (void)evictObjectsExceedingCountLimit;

@end


@implementation PicoCache

@synthesize entries = _entries, entriesByTime = _entriesByTime;

@synthesize countLimit = _countLimit;

- (id)init {
    return [self initWithCountLimit:0];
}

- (id)initWithCountLimit:(NSUInteger)limit {
    self = [super init];
    if (self) {
        _entries = [[NSMutableDictionary alloc] init];
        _entriesByTime = [[NSMutableArray alloc] init];
        
        _countLimit = limit;
    }
    return self;
}

- (id)objectForKey:(id)key {
    if (!key) {
        return nil;
    }
    
    @synchronized(self) {
        // Look for the cache entry with the given key
        PicoCacheEntry *entry = [_entries objectForKey:key];
        if (!entry) {
            return nil;
        }
        
        // Refresh the entry by moving it to the end of the LRU list
        [_entriesByTime removeObjectIdenticalTo:entry];
        [_entriesByTime addObject: entry];
        
        return [entry object];
    }
}

- (void)setObject:(id)object forKey:(id)key {
    if (!object || !key) {
        return;
    }
    
    @synchronized(self) {
        PicoCacheEntry *entry = [_entries objectForKey:key];
        if (entry) {
            // Object exists in cache, refresh by removing it from the list
            [_entriesByTime removeObjectIdenticalTo:entry];
            [_entries removeObjectForKey:key];
        }
        
        // Create a cache entry to contain the given object
        entry = [[PicoCacheEntry alloc] initWithObject:object forKey:key];
        
        // Add the entry to the cache and put it at the end of the LRU list
        [_entries setObject:entry forKey:key];
        [_entriesByTime addObject:entry];
        
        [entry release];
        
        // Enforce the count limit
        [self evictObjectsExceedingCountLimit];
    }
    
}

- (NSArray *)allKeys {
    return [_entries allKeys];
}

- (NSArray *)allValues {
    NSMutableArray *values = [NSMutableArray arrayWithCapacity:[_entries count]];
    for (PicoCacheEntry *entry in [_entries allValues]) {
        [values addObject:[entry object]];
    }
    return values;
}

- (void)removeObjectForKey:(id)key {
    PicoCacheEntry *entry = [_entries objectForKey:key];
    if (entry) {
        [_entries removeObjectForKey:key];
        [_entriesByTime removeObjectIdenticalTo:entry];
    }
}

- (void)removeAllObjects {
    [_entries removeAllObjects];
    [_entriesByTime removeAllObjects];
}

- (NSUInteger)count {
    return [_entries count];
}

- (void)evictObjectsExceedingCountLimit {
    if (_countLimit == 0) {
        return;
    }
    
    NSUInteger count = [_entriesByTime count];
    if (count == 0) {
        return;
    }
    
    // Remove oldest entries that exceed the count limit
    for(NSUInteger i = count; i > _countLimit; i--) {
        PicoCacheEntry *entry = [_entriesByTime objectAtIndex:0];
        [_entries removeObjectForKey:[entry key]];
        [_entriesByTime removeObjectAtIndex:0];
    }
}

-(void) dealloc {
    self.entries = nil;
    self.entriesByTime = nil;
    [super dealloc];
}

@end
