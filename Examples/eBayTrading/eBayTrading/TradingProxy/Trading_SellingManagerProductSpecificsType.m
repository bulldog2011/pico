// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "Trading_SellingManagerProductSpecificsType.h"
#import "Trading_NameValueListArrayType.h"
#import "Trading_VariationsType.h"

@implementation Trading_SellingManagerProductSpecificsType

@synthesize primaryCategoryID = _primaryCategoryID;
@synthesize variations = _variations;
@synthesize itemSpecifics = _itemSpecifics;
@synthesize any = _any;

// class meta-data method
// note: this method is only for internal use, DO NOT CHANGE!
+(PicoClassSchema *)getClassMetaData {
    return nil;
}

// property meta-data method
// note: this method is only for internal use, DO NOT CHANGE!
+(NSMutableDictionary *)getPropertyMetaData {
    NSMutableDictionary *map = [NSMutableDictionary dictionary];
    
    PicoPropertySchema *ps = nil;
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"PrimaryCategoryID" propertyName:@"primaryCategoryID" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"primaryCategoryID"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"Variations" propertyName:@"variations" type:PICO_TYPE_OBJECT clazz:[Trading_VariationsType class]];
    [map setObject:ps forKey:@"variations"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"ItemSpecifics" propertyName:@"itemSpecifics" type:PICO_TYPE_OBJECT clazz:[Trading_NameValueListArrayType class]];
    [map setObject:ps forKey:@"itemSpecifics"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ANY_ELEMENT xmlName:@"any" propertyName:@"any" type:PICO_TYPE_ANYELEMENT clazz:nil];
    [map setObject:ps forKey:@"any"];
    [ps release];
    
    return map;
}



-(void)dealloc {
    self.primaryCategoryID = nil;
    self.variations = nil;
    self.itemSpecifics = nil;
    self.any = nil;
    [super dealloc];
}

@end
