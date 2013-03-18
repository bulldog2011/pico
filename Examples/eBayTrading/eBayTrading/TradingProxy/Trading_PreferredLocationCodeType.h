// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>

/**
 @file
 
 Specifies the criteria for filtering search results by site, where site is determined by the site ID in the request.
 
 
 @ingroup EBayAPIInterface
*/

/**
 
 (in) Items listed in the currency implied by the site specified in the
 request.
 
*/
extern NSString *const Trading_PreferredLocationCodeType_LISTED_IN_CURRENCY_IMPLIED;

/**
 
 (in) Items located in the country implied by the site specified in the
 request.
 
*/
extern NSString *const Trading_PreferredLocationCodeType_LOCATED_IN_COUNTRY_IMPLIED;

/**
 
 (in) Items available to the country implied by the site specified in the
 request. For the US site, this implies listings from ALL English-language
 countries that are available to the US.
 
*/
extern NSString *const Trading_PreferredLocationCodeType_AVAILABLE_IN_COUNTRY_IMPLIED;

/**
 
 (in) Items listed on the site specified in the request, regardless of listing
 currency.
 
*/
extern NSString *const Trading_PreferredLocationCodeType_SITE_IMPLIED;

/**
 
 (in) Items located in Belgium or listed on one of the two Belgian sites.
 
*/
extern NSString *const Trading_PreferredLocationCodeType_BELGIUM_LISTING;

/**
 
 (out) Reserved for internal or future use.
 
*/
extern NSString *const Trading_PreferredLocationCodeType_CUSTOM_CODE;
