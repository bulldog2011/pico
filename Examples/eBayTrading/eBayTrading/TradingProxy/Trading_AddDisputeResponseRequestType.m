// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "Trading_AddDisputeResponseRequestType.h"

@implementation Trading_AddDisputeResponseRequestType

@synthesize disputeID = _disputeID;
@synthesize messageText = _messageText;
@synthesize disputeActivity = _disputeActivity;
@synthesize shippingCarrierUsed = _shippingCarrierUsed;
@synthesize shipmentTrackNumber = _shipmentTrackNumber;
@synthesize shippingTime = _shippingTime;

// class meta-data method
// note: this method is only for internal use, DO NOT CHANGE!
+(PicoClassSchema *)getClassMetaData {
    PicoClassSchema *cs = [[PicoClassSchema alloc] initWithXmlName:@"AddDisputeResponseRequest" nsUri:@"urn:ebay:apis:eBLBaseComponents"];
    [cs autorelease];
    return cs;
}

// property meta-data method
// note: this method is only for internal use, DO NOT CHANGE!
+(NSMutableDictionary *)getPropertyMetaData {
    NSMutableDictionary *map = [NSMutableDictionary dictionary];
    
    PicoPropertySchema *ps = nil;
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"DisputeID" propertyName:@"disputeID" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"disputeID"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"MessageText" propertyName:@"messageText" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"messageText"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"DisputeActivity" propertyName:@"disputeActivity" type:PICO_TYPE_ENUM clazz:nil];
    [map setObject:ps forKey:@"disputeActivity"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"ShippingCarrierUsed" propertyName:@"shippingCarrierUsed" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"shippingCarrierUsed"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"ShipmentTrackNumber" propertyName:@"shipmentTrackNumber" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"shipmentTrackNumber"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"ShippingTime" propertyName:@"shippingTime" type:PICO_TYPE_DATE clazz:nil];
    [map setObject:ps forKey:@"shippingTime"];
    [ps release];
    
    return map;
}



-(void)dealloc {
    self.disputeID = nil;
    self.messageText = nil;
    self.disputeActivity = nil;
    self.shippingCarrierUsed = nil;
    self.shipmentTrackNumber = nil;
    self.shippingTime = nil;
    [super dealloc];
}

@end
