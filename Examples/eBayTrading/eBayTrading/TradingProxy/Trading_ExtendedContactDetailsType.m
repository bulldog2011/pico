// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "Trading_ExtendedContactDetailsType.h"
#import "Trading_ContactHoursDetailsType.h"

@implementation Trading_ExtendedContactDetailsType

@synthesize contactHoursDetails = _contactHoursDetails;
@synthesize classifiedAdContactByEmailEnabled = _classifiedAdContactByEmailEnabled;
@synthesize payPerLeadPhoneNumber = _payPerLeadPhoneNumber;
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
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"ContactHoursDetails" propertyName:@"contactHoursDetails" type:PICO_TYPE_OBJECT clazz:[Trading_ContactHoursDetailsType class]];
    [map setObject:ps forKey:@"contactHoursDetails"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"ClassifiedAdContactByEmailEnabled" propertyName:@"classifiedAdContactByEmailEnabled" type:PICO_TYPE_BOOL clazz:nil];
    [map setObject:ps forKey:@"classifiedAdContactByEmailEnabled"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"PayPerLeadPhoneNumber" propertyName:@"payPerLeadPhoneNumber" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"payPerLeadPhoneNumber"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ANY_ELEMENT xmlName:@"any" propertyName:@"any" type:PICO_TYPE_ANYELEMENT clazz:nil];
    [map setObject:ps forKey:@"any"];
    [ps release];
    
    return map;
}



-(void)dealloc {
    self.contactHoursDetails = nil;
    self.classifiedAdContactByEmailEnabled = nil;
    self.payPerLeadPhoneNumber = nil;
    self.any = nil;
    [super dealloc];
}

@end
