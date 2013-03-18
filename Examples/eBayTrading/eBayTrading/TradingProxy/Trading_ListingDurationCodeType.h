// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>

/**
 @file
 
 This enumerated type contains the list of values that can be used by the seller to set
 the duration (number of days or Good 'Til Cancelled) of a listing. 
 <br><br>
 Listing durations available to the seller may vary based on the site, category, listing 
 type, and the seller's selling profile, so it is a best practice for the seller to call 
 <b>GetCategoryFeatures</b> with <b>ListingDurations</b> 
 included as a <b>FeatureID</b> value in the call request. The 
 <b>GetCategoryFeatures</b> response will include the complete list 
 of listing duration values that can be used for the various listing types.
 
 
 @ingroup EBayAPIInterface
*/

/**
 
 This value is used to set the duration of the listing to one day. A one-day listing 
 duration is typically only available to sellers with a Feedback score of 10 or 
 higher, so sellers with a Feedback score of less than 10 may be restricted from 
 using a one-day listing duration. The seller can call 
 <b>GetCategoryFeatures</b> with <b>ListingDurations</b> 
 included as a <b>FeatureID</b> value in the call request to see if the 
 one-day listing duration is available. 
 <br><br>
 A one-day listing duration is generally applicable to an auction listing or to a 
 Real Estate Classified Ad.
 
*/
extern NSString *const Trading_ListingDurationCodeType_DAYS_1;

/**
 
 This value is used to set the duration of the listing to three days. 
 <br><br>
 A three-day listing duration is applicable to most listing types.
 
*/
extern NSString *const Trading_ListingDurationCodeType_DAYS_3;

/**
 
 This value is used to set the duration of the listing to five days. 
 <br><br>
 A five-day listing duration is applicable to most listing types.
 
*/
extern NSString *const Trading_ListingDurationCodeType_DAYS_5;

/**
 
 This value is used to set the duration of the listing to seven days. 
 <br><br>
 A seven-day listing duration is applicable to most listing types.
 
*/
extern NSString *const Trading_ListingDurationCodeType_DAYS_7;

/**
 
 This value is used to set the duration of the listing to 10 days. 
 <br><br>
 A 10-day listing duration is applicable to most listing types.
 
*/
extern NSString *const Trading_ListingDurationCodeType_DAYS_10;

/**
 
 This value is used to set the duration of the listing to 14 days. 
 <br><br>
 A 14-day listing duration is typically only applicable to Classified Ad listings 
 in specific categories.
 
*/
extern NSString *const Trading_ListingDurationCodeType_DAYS_14;

/**
 
 This value is used to set the duration of the listing to 21 days. 
 <br><br>
 A 21-day listing duration is typically only applicable to eBay Motors Local 
 Market vehicle listings, a listing type that is only available to eBay Motors 
 Dealers.
 
*/
extern NSString *const Trading_ListingDurationCodeType_DAYS_21;

/**
 
 This value is used to set the duration of the listing to 30 days. 
 <br><br>
 A 30-day listing duration is typically available for fixed-price listing, Classified Ad 
 listings, and Real Estate auction listings.
 
*/
extern NSString *const Trading_ListingDurationCodeType_DAYS_30;

/**
 
 This value is used to set the duration of the listing to 60 days. 
 <br><br>
 A 60-day listing duration is typically only applicable to Classified Ad listings 
 in specific categories.
 
*/
extern NSString *const Trading_ListingDurationCodeType_DAYS_60;

/**
 
 This value is used to set the duration of the listing to 90 days. 
 <br><br>
 A 90-day listing duration is generally only applicable to a Real Estate Classified
 Ad.
 
*/
extern NSString *const Trading_ListingDurationCodeType_DAYS_90;

/**
 
 This value is used to set the duration of the listing to 120 days. 
 <br><br>
 An 120-day listing duration is typically only applicable to Classified Ad listings 
 in specific categories.
 
*/
extern NSString *const Trading_ListingDurationCodeType_DAYS_120;

/**
 
 This value is used to set the duration of the listing to "Good 'Til Cancelled". This
 option is available for fixed-price and Classified Ad listings. "Good 'Til
 Cancelled" fixed-price listings will be relisted automatically every 30 days until
 all inventory is sold out (e.g., <b>Item.Quantity</b>=0 in a 
 single-variation fixed-price listing, or all occurences of 
 <b>Item.Variations.Variation.Quantity</b>=0 in a multi-variation 
 fixed-price listing), or the seller ends the fixed-price listing.
 
*/
extern NSString *const Trading_ListingDurationCodeType_GTC;

/**
 
 This value is reserved for internal or future use.
 
*/
extern NSString *const Trading_ListingDurationCodeType_CUSTOM_CODE;
