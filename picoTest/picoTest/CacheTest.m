//
//  CacheTest.m
//  picoTest
//
//  Created by bulldog on 13-2-25.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import <GHUnitIOS/GHUNit.h>
#import "PicoCache.h"

@interface CacheTest : GHTestCase

@end

@implementation CacheTest

- (void) testAddAddRemove {
    PicoCache *cache = [[PicoCache alloc] init];
    [cache setObject:@"value1" forKey:@"key1"];
    GHAssertNotNil([cache objectForKey:@"key1"], @"Failed to add entry to cache");
    GHAssertEquals([cache count], 1U, @"Cache count should be 1");
    
    [cache removeObjectForKey:@"key1"];
    GHAssertNil([cache objectForKey:@"key1"], @"Failed to remove entry from cache");
    GHAssertEquals([cache count], 0U, @"Cache count should be 0");
    
    [cache setObject:@"value2" forKey:@"key2"];
    [cache setObject:@"value3" forKey:@"key3"];
    GHAssertEquals([cache count], 2U, @"Cache count should be 2");
    
    [cache removeAllObjects];
    GHAssertNil([cache objectForKey:@"key2"], @"Failed to remove entry from cache");
    GHAssertEquals([cache count], 0U, @"Cache count should be 0");
    
    [cache release];
}

- (void)testUpdate
{
    PicoCache *cache = [[PicoCache alloc] init];
    [cache setObject:@"value1" forKey:@"key1"];
    
    NSString *value = [cache objectForKey:@"key1"];
    GHAssertEquals(value, @"value1", @"Incorrect initial value in cache");
    
    [cache setObject:@"value2" forKey:@"key1"];
    value = [cache objectForKey:@"key1"];
    GHAssertEquals(value, @"value2", @"Incorrect updated value in cache");
    GHAssertEquals([cache count], 1U, @"Incorrect cache count");
}

- (void)testCountLimit
{
    NSUInteger countLimit = 2;
    
    PicoCache *cache = [[PicoCache alloc] initWithCountLimit:countLimit];
    [cache setObject:@"value1" forKey:@"key1"];
    [cache setObject:@"value2" forKey:@"key2"];
    
    // check count before eviction
    GHAssertEquals([cache count], countLimit, @"Cache count should be 2");
    
    // add object exceeding count limit
    [cache setObject:@"value3" forKey:@"key3"];
    GHAssertEquals([cache count], countLimit, @"Cache count should be 2");
    
    [cache setObject:@"value4" forKey:@"key4"];
    [cache setObject:@"value5" forKey:@"key5"];
    [cache setObject:@"value6" forKey:@"key6"];
    GHAssertEquals([cache count], countLimit, @"Cache count should be 2");
}

- (void)testLRUAlgorithm
{
    NSUInteger countLimit = 3;
    PicoCache *cache = [[PicoCache alloc] initWithCountLimit:countLimit];
    [cache setObject:@"value1" forKey:@"key1"];
    [cache setObject:@"value2" forKey:@"key2"];
    [cache setObject:@"value3" forKey:@"key3"];
    
    // check count before eviction
    GHAssertEquals([cache count], countLimit, @"Incorrect cache count");
    
    // add object exceeding count limit
    [cache setObject:@"value4" forKey:@"key4"];
    GHAssertEquals([cache count], countLimit, @"Incorrect cache count");
    GHAssertNil([cache objectForKey:@"key1"], @"First entry should have been evicted");
    GHAssertNotNil([cache objectForKey:@"key4"], @"Fourth entry should exist in cache");
    
    // refresh oldest entry
    [cache objectForKey:@"key2"];
    
    // add another object
    [cache setObject:@"value5" forKey:@"key5"];
    GHAssertEquals([cache count], countLimit, @"Incorrect cache count");
    
    // third entry should be evicted since it is the oldest
    GHAssertNil([cache objectForKey:@"key3"], @"Third entry should have been evicted");
    GHAssertNotNil([cache objectForKey:@"key2"], @"Second entry should exist in cache");
    GHAssertNotNil([cache objectForKey:@"key4"], @"Fourth entry should exist in cache");
    GHAssertNotNil([cache objectForKey:@"key5"], @"Fifth entry should exist in cache");
}

@end
