// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>

/**
 @file
 
 Alerts can be either informational or a warning that identifies a problem.
 
 
 @ingroup EBayAPIInterface
*/

/**
 
 The alert message is informational in nature.
 <br><br>
 Some examples: you might get a PowerSeller status message if your PowerSeller
 level has been increased, a policy-compliance message if you have no recent
 policy violations, a buyer-satisfaction message if you are providing excellent
 customer service, or a seller-account message if there is a new notice available
 about your payment status.
 
*/
extern NSString *const Trading_SellerDashboardAlertSeverityCodeType_INFORMATIONAL;

/**
 
 The alert message is a warning that identifies a problem.
 <br><br>
 For example, you might get a PowerSeller status warning if you missed the 
 PowerSeller sales requirements in the past month. Or you might get a
 policy-compliance warning if you recently listed an item with excessive
 shipping costs, or a seller-account warning if a collections message 
 asks you to pay now to make sure no restrictions are placed on your account.
 
*/
extern NSString *const Trading_SellerDashboardAlertSeverityCodeType_WARNING;

/**
 
 The alert message is a strong warning that indicates a serious problem.
 <br><br>
 For example, you might get a PowerSeller status strong warning if you have lost
 your PowerSeller status because of policy violations, or you might get a
 policy-compliance strong warning if your account has been restricted.
 
*/
extern NSString *const Trading_SellerDashboardAlertSeverityCodeType_STRONG_WARNING;

/**
 
 Reserved for internal (or future) use.
 
*/
extern NSString *const Trading_SellerDashboardAlertSeverityCodeType_CUSTOM_CODE;
