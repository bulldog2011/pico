// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "Trading_AffiliateTrackingDetailsType.h"

@implementation Trading_AffiliateTrackingDetailsType

@synthesize trackingID = _trackingID;
@synthesize trackingPartnerCode = _trackingPartnerCode;
@synthesize applicationDeviceType = _applicationDeviceType;
@synthesize affiliateUserID = _affiliateUserID;
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
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"TrackingID" propertyName:@"trackingID" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"trackingID"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"TrackingPartnerCode" propertyName:@"trackingPartnerCode" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"trackingPartnerCode"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"ApplicationDeviceType" propertyName:@"applicationDeviceType" type:PICO_TYPE_ENUM clazz:nil];
    [map setObject:ps forKey:@"applicationDeviceType"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"AffiliateUserID" propertyName:@"affiliateUserID" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"affiliateUserID"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ANY_ELEMENT xmlName:@"any" propertyName:@"any" type:PICO_TYPE_ANYELEMENT clazz:nil];
    [map setObject:ps forKey:@"any"];
    [ps release];
    
    return map;
}



-(void)dealloc {
    self.trackingID = nil;
    self.trackingPartnerCode = nil;
    self.applicationDeviceType = nil;
    self.affiliateUserID = nil;
    self.any = nil;
    [super dealloc];
}

@end
