// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "PicoClassSchema.h"
#import "PicoPropertySchema.h"
#import "PicoConstants.h"
#import "PicoBindable.h"
#import "Trading_AbstractRequestType.h"


@class Trading_SellingManagerProductSpecificsType;
@class Trading_SellingManagerFolderDetailsType;
@class Trading_SellingManagerProductDetailsType;

/**
 
 Revises a Selling Manager product.
 <br><br>
 This call is subject to change without notice; the
 deprecation process is inapplicable to this call.
 
 
 @ingroup EBayAPIInterface
*/
@interface Trading_ReviseSellingManagerProductRequestType : Trading_AbstractRequestType {

@private
    Trading_SellingManagerProductDetailsType *_sellingManagerProductDetails;
    Trading_SellingManagerFolderDetailsType *_sellingManagerFolderDetails;
    NSMutableArray *_deletedField;
    Trading_SellingManagerProductSpecificsType *_sellingManagerProductSpecifics;

}


/**
 
 The details of the product that is being revised.
 
 
 type : class Trading_SellingManagerProductDetailsType
*/
@property (nonatomic, retain) Trading_SellingManagerProductDetailsType *sellingManagerProductDetails;

/**
 
 The details of the folder for this product.
 
 
 type : class Trading_SellingManagerFolderDetailsType
*/
@property (nonatomic, retain) Trading_SellingManagerFolderDetailsType *sellingManagerFolderDetails;

/**
 
 Specifies the name of a field to remove from a Selling Manager product.
 The request can contain zero, one, or many instances of DeletedField (one for each field to be removed).
 DeletedField accepts the following path names, which remove the corresponding fields:<br><br>
 SellingManagerProductDetails.CustomLabel<br>
 SellingManagerProductDetails.QuantityAvailable<br>
 SellingManagerProductDetails.UnitCost<br>
 These values are case-sensitive. Use values that match the case of the schema element names.
 
 
 entry type : NSString, wrapper for primitive string
*/

@property (nonatomic, retain) NSMutableArray *deletedField;

/**
 
 Specifies an eBay category associated with the product,
 defines Item Specifics that are relevant to the product,
 and defines variations available for the product
 (which may be used to create mult-variation listings).
 
 
 type : class Trading_SellingManagerProductSpecificsType
*/
@property (nonatomic, retain) Trading_SellingManagerProductSpecificsType *sellingManagerProductSpecifics;


@end
