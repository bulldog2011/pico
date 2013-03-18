// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "Trading_AddSellingManagerProductRequestType.h"
#import "Trading_SellingManagerProductSpecificsType.h"
#import "Trading_SellingManagerProductDetailsType.h"

@implementation Trading_AddSellingManagerProductRequestType

@synthesize sellingManagerProductDetails = _sellingManagerProductDetails;
@synthesize folderID = _folderID;
@synthesize sellingManagerProductSpecifics = _sellingManagerProductSpecifics;

// class meta-data method
// note: this method is only for internal use, DO NOT CHANGE!
+(PicoClassSchema *)getClassMetaData {
    PicoClassSchema *cs = [[PicoClassSchema alloc] initWithXmlName:@"AddSellingManagerProductRequest" nsUri:@"urn:ebay:apis:eBLBaseComponents"];
    [cs autorelease];
    return cs;
}

// property meta-data method
// note: this method is only for internal use, DO NOT CHANGE!
+(NSMutableDictionary *)getPropertyMetaData {
    NSMutableDictionary *map = [NSMutableDictionary dictionary];
    
    PicoPropertySchema *ps = nil;
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"SellingManagerProductDetails" propertyName:@"sellingManagerProductDetails" type:PICO_TYPE_OBJECT clazz:[Trading_SellingManagerProductDetailsType class]];
    [map setObject:ps forKey:@"sellingManagerProductDetails"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"FolderID" propertyName:@"folderID" type:PICO_TYPE_LONG clazz:nil];
    [map setObject:ps forKey:@"folderID"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"SellingManagerProductSpecifics" propertyName:@"sellingManagerProductSpecifics" type:PICO_TYPE_OBJECT clazz:[Trading_SellingManagerProductSpecificsType class]];
    [map setObject:ps forKey:@"sellingManagerProductSpecifics"];
    [ps release];
    
    return map;
}



-(void)dealloc {
    self.sellingManagerProductDetails = nil;
    self.folderID = nil;
    self.sellingManagerProductSpecifics = nil;
    [super dealloc];
}

@end
