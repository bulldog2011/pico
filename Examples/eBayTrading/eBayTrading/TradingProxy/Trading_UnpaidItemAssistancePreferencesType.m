// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "Trading_UnpaidItemAssistancePreferencesType.h"

@implementation Trading_UnpaidItemAssistancePreferencesType

@synthesize delayBeforeOpeningDispute = _delayBeforeOpeningDispute;
@synthesize optInStatus = _optInStatus;
@synthesize autoRelist = _autoRelist;
@synthesize removeAllExcludedUsers = _removeAllExcludedUsers;
@synthesize excludedUser = _excludedUser;
@synthesize autoOptDonationRefund = _autoOptDonationRefund;
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
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"DelayBeforeOpeningDispute" propertyName:@"delayBeforeOpeningDispute" type:PICO_TYPE_INT clazz:nil];
    [map setObject:ps forKey:@"delayBeforeOpeningDispute"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"OptInStatus" propertyName:@"optInStatus" type:PICO_TYPE_BOOL clazz:nil];
    [map setObject:ps forKey:@"optInStatus"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"AutoRelist" propertyName:@"autoRelist" type:PICO_TYPE_BOOL clazz:nil];
    [map setObject:ps forKey:@"autoRelist"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"RemoveAllExcludedUsers" propertyName:@"removeAllExcludedUsers" type:PICO_TYPE_BOOL clazz:nil];
    [map setObject:ps forKey:@"removeAllExcludedUsers"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT_ARRAY xmlName:@"ExcludedUser" propertyName:@"excludedUser" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"excludedUser"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"AutoOptDonationRefund" propertyName:@"autoOptDonationRefund" type:PICO_TYPE_BOOL clazz:nil];
    [map setObject:ps forKey:@"autoOptDonationRefund"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ANY_ELEMENT xmlName:@"any" propertyName:@"any" type:PICO_TYPE_ANYELEMENT clazz:nil];
    [map setObject:ps forKey:@"any"];
    [ps release];
    
    return map;
}



-(void)dealloc {
    self.delayBeforeOpeningDispute = nil;
    self.optInStatus = nil;
    self.autoRelist = nil;
    self.removeAllExcludedUsers = nil;
    self.excludedUser = nil;
    self.autoOptDonationRefund = nil;
    self.any = nil;
    [super dealloc];
}

@end
