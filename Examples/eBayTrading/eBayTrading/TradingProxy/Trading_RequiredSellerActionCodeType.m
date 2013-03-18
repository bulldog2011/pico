// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import "Trading_RequiredSellerActionCodeType.h"

/**
 @file
 
 Enumerated type that indicates the next possible action that a DE/AT seller can take to
 expedite the seller payout for an order subject to the new eBay payment process. 
 
*/

/**
 
 This value indicates that there is an open eBay Buyer Protection case involving
 the DE/AT seller and the item. The seller must address and get the case resolved before
 the funds can be scheduled for release to the seller's account. 
 See the <a href="http://developer.ebay.com/DevZone/resolution-case-management/Concepts/ResoCaseAPIGuide.html">Resolution Case Management API User Guide</a> 
 for information about retrieving and managing eBay Buyer Protection cases.
 
*/
NSString *const Trading_RequiredSellerActionCodeType_RESOLVEE_BP_CASE = @"ResolveeBPCase";

/**
 
 This value indicates that the DE/AT seller must mark the order line item as shipped.
 The seller can use the CompleteSale call to perform this action.
 
*/
NSString *const Trading_RequiredSellerActionCodeType_MARK_AS_SHIPPED = @"MarkAsShipped";

/**
 
 This value indicates that the DE/AT seller should contact eBay Customer Support to discover 
 the next required action.
 
*/
NSString *const Trading_RequiredSellerActionCodeType_CONTACTE_BAY_CS = @"ContacteBayCS";

/**
 
 This value indicates that the DE/AT seller must resolve PayPal Buyer Protection case.
 
*/
NSString *const Trading_RequiredSellerActionCodeType_RESOLVE_PPP_ICASE = @"ResolvePPPIcase";

/**
 
 This value indicates that the DE/AT seller must set up a valid payout account in order 
 to receive seller payouts.
 
*/
NSString *const Trading_RequiredSellerActionCodeType_SETUP_PAYOUT_METHOD = @"SetupPayoutMethod";

/**
 
 This value indicates that the DE/AT seller must update to a valid payout account in order 
 to receive seller payouts.
 
*/
NSString *const Trading_RequiredSellerActionCodeType_UPDATE_PAYOUT_METHOD = @"UpdatePayoutMethod";

/**
 
 This value indicates that there is no action required from the DE/AT seller 
 to expedite seller payouts.
 
*/
NSString *const Trading_RequiredSellerActionCodeType_NONE = @"None";

/**
 
 Reserved for internal or future use.
 
*/
NSString *const Trading_RequiredSellerActionCodeType_CUSTOM_CODE = @"CustomCode";
