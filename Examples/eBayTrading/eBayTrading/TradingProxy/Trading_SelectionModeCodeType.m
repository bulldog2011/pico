// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import "Trading_SelectionModeCodeType.h"

/**
 @file
 
 This is automatic or manual depending on selection.
 
*/

/**
 
 Automatic criteria. Reserved for future use.
 
*/
NSString *const Trading_SelectionModeCodeType_AUTOMATIC = @"Automatic";

/**
 
 Manual criteria. Reserved for future use.
 
*/
NSString *const Trading_SelectionModeCodeType_MANUAL = @"Manual";

/**
 
 In listing requests, do not specify the name or value because
 they will be filled in by eBay.
 In GetItemRecommendations, this indicates that the Item Specific
 will be pre-filled from a catalog, based on a product ID
 that you passed in the request. They should be presented as
 read-only to the seller. If you specify a prefilled value in
 your listing request when you list with a catalog product, 
 eBay drops the value and uses the value from the catalog instead.
 
*/
NSString *const Trading_SelectionModeCodeType_PREFILLED = @"Prefilled";

/**
 
 In listing requests, only specify a value that eBay has 
 recommended. That is, select from the list of recommended values;
 don't specify your own custom details. If you specify a different value, the listing request may return errors. Rarely used.
 
*/
NSString *const Trading_SelectionModeCodeType_SELECTION_ONLY = @"SelectionOnly";

/**
 
 In listing requests, specify any name or value, or select from the 
 list of recommended values, if present. This is used in most cases.
 
*/
NSString *const Trading_SelectionModeCodeType_FREE_TEXT = @"FreeText";

/**
 
 Reserved for future use.
 
*/
NSString *const Trading_SelectionModeCodeType_CUSTOM_CODE = @"CustomCode";
