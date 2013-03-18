// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "Trading_SellerPaymentType.h"
#import "Trading_ExternalProductIDType.h"
#import "Trading_AmountType.h"

@implementation Trading_SellerPaymentType

@synthesize itemID = _itemID;
@synthesize transactionID = _transactionID;
@synthesize orderID = _orderID;
@synthesize sellerInventoryID = _sellerInventoryID;
@synthesize privateNotes = _privateNotes;
@synthesize externalProductID = _externalProductID;
@synthesize title = _title;
@synthesize paymentType = _paymentType;
@synthesize transactionPrice = _transactionPrice;
@synthesize shippingReimbursement = _shippingReimbursement;
@synthesize commission = _commission;
@synthesize amountPaid = _amountPaid;
@synthesize paidTime = _paidTime;
@synthesize orderLineItemID = _orderLineItemID;
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
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"ItemID" propertyName:@"itemID" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"itemID"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"TransactionID" propertyName:@"transactionID" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"transactionID"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"OrderID" propertyName:@"orderID" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"orderID"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"SellerInventoryID" propertyName:@"sellerInventoryID" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"sellerInventoryID"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"PrivateNotes" propertyName:@"privateNotes" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"privateNotes"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"ExternalProductID" propertyName:@"externalProductID" type:PICO_TYPE_OBJECT clazz:[Trading_ExternalProductIDType class]];
    [map setObject:ps forKey:@"externalProductID"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"Title" propertyName:@"title" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"title"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"PaymentType" propertyName:@"paymentType" type:PICO_TYPE_ENUM clazz:nil];
    [map setObject:ps forKey:@"paymentType"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"TransactionPrice" propertyName:@"transactionPrice" type:PICO_TYPE_OBJECT clazz:[Trading_AmountType class]];
    [map setObject:ps forKey:@"transactionPrice"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"ShippingReimbursement" propertyName:@"shippingReimbursement" type:PICO_TYPE_OBJECT clazz:[Trading_AmountType class]];
    [map setObject:ps forKey:@"shippingReimbursement"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"Commission" propertyName:@"commission" type:PICO_TYPE_OBJECT clazz:[Trading_AmountType class]];
    [map setObject:ps forKey:@"commission"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"AmountPaid" propertyName:@"amountPaid" type:PICO_TYPE_OBJECT clazz:[Trading_AmountType class]];
    [map setObject:ps forKey:@"amountPaid"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"PaidTime" propertyName:@"paidTime" type:PICO_TYPE_DATE clazz:nil];
    [map setObject:ps forKey:@"paidTime"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"OrderLineItemID" propertyName:@"orderLineItemID" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"orderLineItemID"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ANY_ELEMENT xmlName:@"any" propertyName:@"any" type:PICO_TYPE_ANYELEMENT clazz:nil];
    [map setObject:ps forKey:@"any"];
    [ps release];
    
    return map;
}



-(void)dealloc {
    self.itemID = nil;
    self.transactionID = nil;
    self.orderID = nil;
    self.sellerInventoryID = nil;
    self.privateNotes = nil;
    self.externalProductID = nil;
    self.title = nil;
    self.paymentType = nil;
    self.transactionPrice = nil;
    self.shippingReimbursement = nil;
    self.commission = nil;
    self.amountPaid = nil;
    self.paidTime = nil;
    self.orderLineItemID = nil;
    self.any = nil;
    [super dealloc];
}

@end
