// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "Trading_RevokeTokenRequestType.h"

@implementation Trading_RevokeTokenRequestType

@synthesize unsubscribeNotification = _unsubscribeNotification;

// class meta-data method
// note: this method is only for internal use, DO NOT CHANGE!
+(PicoClassSchema *)getClassMetaData {
    PicoClassSchema *cs = [[PicoClassSchema alloc] initWithXmlName:@"RevokeTokenRequest" nsUri:@"urn:ebay:apis:eBLBaseComponents"];
    [cs autorelease];
    return cs;
}

// property meta-data method
// note: this method is only for internal use, DO NOT CHANGE!
+(NSMutableDictionary *)getPropertyMetaData {
    NSMutableDictionary *map = [NSMutableDictionary dictionary];
    
    PicoPropertySchema *ps = nil;
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"UnsubscribeNotification" propertyName:@"unsubscribeNotification" type:PICO_TYPE_BOOL clazz:nil];
    [map setObject:ps forKey:@"unsubscribeNotification"];
    [ps release];
    
    return map;
}



-(void)dealloc {
    self.unsubscribeNotification = nil;
    [super dealloc];
}

@end
