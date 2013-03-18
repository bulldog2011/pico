// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "PicoClassSchema.h"
#import "PicoPropertySchema.h"
#import "PicoConstants.h"
#import "PicoBindable.h"
#import "Trading_AbstractResponseType.h"


@class Trading_CategoryArrayType;

/**
 
 Contains the category data for the eBay site specified as input. The category
 data is contained in a CategoryArrayType object, within which are zero, one, or
 multiple CategoryType objects. Each CategoryType object contains the detail data
 for one category. Other fields tell how many categories are returned in a call,
 when the category hierarchy was last updated, and the version of the category
 hierarchy (all three of which can differ from one eBay site to the next).
 
 
 @ingroup EBayAPIInterface
*/
@interface Trading_GetCategoriesResponseType : Trading_AbstractResponseType {

@private
    Trading_CategoryArrayType *_categoryArray;
    NSNumber *_categoryCount;
    NSDate *_updateTime;
    NSString *_categoryVersion;
    NSNumber *_reservePriceAllowed;
    NSNumber *_minimumReservePrice;
    NSNumber *_reduceReserveAllowed;

}


/**
 
 List of the returned categories. The category array contains one CategoryType
 object for each returned category. Returns empty if no detail level is specified.
 
 
 type : class Trading_CategoryArrayType
*/
@property (nonatomic, retain) Trading_CategoryArrayType *categoryArray;

/**
 
 Indicates the number of categories returned (i.e., the number of CategoryType
 objects in CategoryArray).
 
 
 type : NSNumber, wrapper for primitive int
*/
@property (nonatomic, retain) NSNumber *categoryCount;

/**
 
 Indicates the last date and time that eBay modified the category hierarchy for the
 specified eBay site.
 
 
 type : NSDate, wrapper for primitive date
*/
@property (nonatomic, retain) NSDate *updateTime;

/**
 
 Indicates the version of the category hierarchy on the
 specified eBay site.
 
 
 type : NSString, wrapper for primitive string
*/
@property (nonatomic, retain) NSString *categoryVersion;

/**
 
 If true, ReservePriceAllowed indicates that all categories on the
 site allow the seller to specify a reserve price for an item.
 If false, this field is not returned in the response and all categories on the site do not normally allow sellers to specify reserve prices.
 The Category.ORPA (override reserve price allowed) field can override (or toggle)
 the reserve price allowed setting for a given category.
 For example, if ReservePriceAllowed is false and Category.ORPA is true,
 the category overrides the site setting and supports reserve prices.
 If ReservePriceAllowed is true and Category.ORPA is true, the category
 overrides the site setting and does does not support reserve prices.
 
 
 type : NSNumber, wrapper for primitive bool
*/
@property (nonatomic, retain) NSNumber *reservePriceAllowed;

/**
 
     Indicates the lowest possible reserve price allowed for any item
     listed in any category on the site. You can use the fields returned by GetCategoryFeatures to determine if a different Minimum Reserve Price is defined for the category you want to use.
 
 
 type : NSNumber, wrapper for primitive double
*/
@property (nonatomic, retain) NSNumber *minimumReservePrice;

/**
 
 If true, ReduceReserveAllowed indicates that all categories on the
 site allow the seller to reduce an item's reserve price.
 If false, this field is not returned in the response and all categories on the site do not normally allow sellers to reduce an
 item's reserve price.
 The Category.ORRA (override reduce reserve price) field can override (or toggle)
 the reserve price reduction setting for a given category.
 For example, if ReduceReserveAllowed is false and Category.ORRA is true,
 the category overrides the site setting and supports reducing reserve prices.
 If ReduceReserveAllowed is true and Category.ORRA is true, the category
 overrides the site setting and does does not support reducing reserve prices.
 
 
 type : NSNumber, wrapper for primitive bool
*/
@property (nonatomic, retain) NSNumber *reduceReserveAllowed;


@end
