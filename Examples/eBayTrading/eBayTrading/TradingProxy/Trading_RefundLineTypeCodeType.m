// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import "Trading_RefundLineTypeCodeType.h"

/**
 @file
 
  A code indicating whether the refund for the DE/AT order was applied toward the 
  purchase price, the original shipping price, or for an additional amount.
 
*/

/**
 
  The refund was applied to the purchase price.<br/><br/>
 
*/
NSString *const Trading_RefundLineTypeCodeType_PURCHASE_PRICE = @"PurchasePrice";

/**
 
  The refund was applied to the shipping cost.<br/><br/>
 
*/
NSString *const Trading_RefundLineTypeCodeType_SHIPPING_PRICE = @"ShippingPrice";

/**
 
  An additional refund (not accounted for in the original order costs) was issued.<br/><br/>
 
*/
NSString *const Trading_RefundLineTypeCodeType_ADDITIONAL = @"Additional";

/**
 
 (out) Reserved for internal or future use.
 
*/
NSString *const Trading_RefundLineTypeCodeType_CUSTOM_CODE = @"CustomCode";
