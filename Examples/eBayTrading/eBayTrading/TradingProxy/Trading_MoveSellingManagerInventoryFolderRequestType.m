// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "Trading_MoveSellingManagerInventoryFolderRequestType.h"

@implementation Trading_MoveSellingManagerInventoryFolderRequestType

@synthesize folderID = _folderID;
@synthesize newParentFolderID = _newParentFolderID;

// class meta-data method
// note: this method is only for internal use, DO NOT CHANGE!
+(PicoClassSchema *)getClassMetaData {
    PicoClassSchema *cs = [[PicoClassSchema alloc] initWithXmlName:@"MoveSellingManagerInventoryFolderRequest" nsUri:@"urn:ebay:apis:eBLBaseComponents"];
    [cs autorelease];
    return cs;
}

// property meta-data method
// note: this method is only for internal use, DO NOT CHANGE!
+(NSMutableDictionary *)getPropertyMetaData {
    NSMutableDictionary *map = [NSMutableDictionary dictionary];
    
    PicoPropertySchema *ps = nil;
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"FolderID" propertyName:@"folderID" type:PICO_TYPE_LONG clazz:nil];
    [map setObject:ps forKey:@"folderID"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"NewParentFolderID" propertyName:@"newParentFolderID" type:PICO_TYPE_LONG clazz:nil];
    [map setObject:ps forKey:@"newParentFolderID"];
    [ps release];
    
    return map;
}



-(void)dealloc {
    self.folderID = nil;
    self.newParentFolderID = nil;
    [super dealloc];
}

@end
