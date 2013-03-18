// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "Trading_GetSellingManagerSoldListingsRequestType.h"
#import "Trading_SellingManagerSearchType.h"
#import "Trading_TimeRangeType.h"
#import "Trading_PaginationType.h"

@implementation Trading_GetSellingManagerSoldListingsRequestType

@synthesize search = _search;
@synthesize storeCategoryID = _storeCategoryID;
@synthesize filter = _filter;
@synthesize archived = _archived;
@synthesize sort = _sort;
@synthesize sortOrder = _sortOrder;
@synthesize pagination = _pagination;
@synthesize saleDateRange = _saleDateRange;

// class meta-data method
// note: this method is only for internal use, DO NOT CHANGE!
+(PicoClassSchema *)getClassMetaData {
    PicoClassSchema *cs = [[PicoClassSchema alloc] initWithXmlName:@"GetSellingManagerSoldListingsRequest" nsUri:@"urn:ebay:apis:eBLBaseComponents"];
    [cs autorelease];
    return cs;
}

// property meta-data method
// note: this method is only for internal use, DO NOT CHANGE!
+(NSMutableDictionary *)getPropertyMetaData {
    NSMutableDictionary *map = [NSMutableDictionary dictionary];
    
    PicoPropertySchema *ps = nil;
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"Search" propertyName:@"search" type:PICO_TYPE_OBJECT clazz:[Trading_SellingManagerSearchType class]];
    [map setObject:ps forKey:@"search"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"StoreCategoryID" propertyName:@"storeCategoryID" type:PICO_TYPE_LONG clazz:nil];
    [map setObject:ps forKey:@"storeCategoryID"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT_ARRAY xmlName:@"Filter" propertyName:@"filter" type:PICO_TYPE_ENUM clazz:nil];
    [map setObject:ps forKey:@"filter"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"Archived" propertyName:@"archived" type:PICO_TYPE_BOOL clazz:nil];
    [map setObject:ps forKey:@"archived"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"Sort" propertyName:@"sort" type:PICO_TYPE_ENUM clazz:nil];
    [map setObject:ps forKey:@"sort"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"SortOrder" propertyName:@"sortOrder" type:PICO_TYPE_ENUM clazz:nil];
    [map setObject:ps forKey:@"sortOrder"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"Pagination" propertyName:@"pagination" type:PICO_TYPE_OBJECT clazz:[Trading_PaginationType class]];
    [map setObject:ps forKey:@"pagination"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"SaleDateRange" propertyName:@"saleDateRange" type:PICO_TYPE_OBJECT clazz:[Trading_TimeRangeType class]];
    [map setObject:ps forKey:@"saleDateRange"];
    [ps release];
    
    return map;
}



-(void)dealloc {
    self.search = nil;
    self.storeCategoryID = nil;
    self.filter = nil;
    self.archived = nil;
    self.sort = nil;
    self.sortOrder = nil;
    self.pagination = nil;
    self.saleDateRange = nil;
    [super dealloc];
}

@end
