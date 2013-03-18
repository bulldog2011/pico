// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "PicoClassSchema.h"
#import "PicoPropertySchema.h"
#import "PicoConstants.h"
#import "PicoBindable.h"
#import "Trading_AbstractRequestType.h"



/**
 
 Retrieves information about promotional sales set up by an eBay store owner
 (the authenticated caller).
 
 
 @ingroup EBayAPIInterface
*/
@interface Trading_GetPromotionalSaleDetailsRequestType : Trading_AbstractRequestType {

@private
    NSNumber *_promotionalSaleID;
    NSMutableArray *_promotionalSaleStatus;

}


/**
 
 The ID of the promotional sale about which you want information. If you do
 not specify this field, then all promotional sales for the seller making
 the call are returned or only those promotional sales matching the
 specified promotional sale status filter, PromotionalSaleStatus.
 <br><br>
 If PromotionalSaleID and PromotionalSaleStatus are both specified, the
 single promotional sale specified by ID is returned only if its status
 matches the specified status filter.
 
 
 type : NSNumber, wrapper for primitive long
*/
@property (nonatomic, retain) NSNumber *promotionalSaleID;

/**
 
 Specifies the promotional sales to return, based upon their status. For
 example, specify "Scheduled" to retrieve only promotional sales with a
 Status of Scheduled. If you want to retrieve promotional sales for more
 than one status, you can repeat the field with an additional status value,
 such as Active.
 <br><br>
 If this field is used together with PromotionalSaleID, the single
 promotional sale specified by ID is returned only if its status
 matches the specified status filter.
 <br><br>
 If neither field is used, all of the seller's promotional sales are
 returned, regardless of status.
 
 
 entry type : string constant in Trading_PromotionalSaleStatusCodeType.h
*/

@property (nonatomic, retain) NSMutableArray *promotionalSaleStatus;


@end
