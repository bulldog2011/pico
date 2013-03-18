// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "PicoClassSchema.h"
#import "PicoPropertySchema.h"
#import "PicoConstants.h"
#import "PicoBindable.h"


@class Trading_NameValueListArrayType;
@class Trading_VariationsType;

/**
 Describes a Selling Manager Template
 
 
 @ingroup EBayAPIInterface
*/
@interface Trading_SellingManagerProductSpecificsType : NSObject <PicoBindable> {

@private
    NSString *_primaryCategoryID;
    Trading_VariationsType *_variations;
    Trading_NameValueListArrayType *_itemSpecifics;
    NSMutableArray *_any;

}


/**
 
 Category ID for a product with variations.
 Only applicable (and required on input)
 when Variations and/or ItemSpecifics is specified in the request
 or returned in a response.
 
 
 type : NSString, wrapper for primitive string
*/
@property (nonatomic, retain) NSString *primaryCategoryID;

/**
 
 Variations are multiple similar (but not identical) versions of the 
 same product. For example, two shirt variations could have the same 
 brand and sleeve style, but could vary by color and size 
 (like "Blue, Large" and "Black, Medium"). 
 On eBay, a single fixed-price (or Store Inventory Format) listing 
 can include multiple variations.
 Each variation can have its own quantity and price.
 To determine which categories support variations, use GetCategoryFeatures.
 
 
 type : class Trading_VariationsType
*/
@property (nonatomic, retain) Trading_VariationsType *variations;

/**
 
 A list of custom Item Specifics for the product. 
 Custom Item Specifics give sellers a structured way to describe 
 details of their items in a name-value format. 
 For example, a book could have
 Item Specifics like Author=J.K. Rowling and Format=Hardcover.
 To determine which categories support
 custom Item Specifics, use GetCategoryFeatures.
 
 
 type : class Trading_NameValueListArrayType
*/
@property (nonatomic, retain) Trading_NameValueListArrayType *itemSpecifics;

/**
 (public property)
 
 entry type : PicoAnyElement, wrapper for primitive anyelement
*/

@property (nonatomic, retain) NSMutableArray *any;


@end
