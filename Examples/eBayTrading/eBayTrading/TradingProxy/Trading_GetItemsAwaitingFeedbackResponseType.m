// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "Trading_GetItemsAwaitingFeedbackResponseType.h"
#import "Trading_PaginatedTransactionArrayType.h"

@implementation Trading_GetItemsAwaitingFeedbackResponseType

@synthesize itemsAwaitingFeedback = _itemsAwaitingFeedback;

// class meta-data method
// note: this method is only for internal use, DO NOT CHANGE!
+(PicoClassSchema *)getClassMetaData {
    PicoClassSchema *cs = [[PicoClassSchema alloc] initWithXmlName:@"GetItemsAwaitingFeedbackResponse" nsUri:@"urn:ebay:apis:eBLBaseComponents"];
    [cs autorelease];
    return cs;
}

// property meta-data method
// note: this method is only for internal use, DO NOT CHANGE!
+(NSMutableDictionary *)getPropertyMetaData {
    NSMutableDictionary *map = [NSMutableDictionary dictionary];
    
    PicoPropertySchema *ps = nil;
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"ItemsAwaitingFeedback" propertyName:@"itemsAwaitingFeedback" type:PICO_TYPE_OBJECT clazz:[Trading_PaginatedTransactionArrayType class]];
    [map setObject:ps forKey:@"itemsAwaitingFeedback"];
    [ps release];
    
    return map;
}



-(void)dealloc {
    self.itemsAwaitingFeedback = nil;
    [super dealloc];
}

@end
