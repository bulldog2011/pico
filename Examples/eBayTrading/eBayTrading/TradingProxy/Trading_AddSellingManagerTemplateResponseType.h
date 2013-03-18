// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "PicoClassSchema.h"
#import "PicoPropertySchema.h"
#import "PicoConstants.h"
#import "PicoBindable.h"
#import "Trading_AbstractResponseType.h"


@class Trading_FeesType;
@class Trading_SellingManagerProductDetailsType;

/**
 
 Contains values indicating template information for a newly-exported item.
 
 
 @ingroup EBayAPIInterface
*/
@interface Trading_AddSellingManagerTemplateResponseType : Trading_AbstractResponseType {

@private
    NSNumber *_categoryID;
    NSNumber *_category2ID;
    NSNumber *_saleTemplateID;
    NSNumber *_saleTemplateGroupID;
    NSString *_saleTemplateName;
    Trading_SellingManagerProductDetailsType *_sellingManagerProductDetails;
    Trading_FeesType *_fees;

}


/**
 
 ID of the primary category in which the item would be listed.
 
 
 type : NSNumber, wrapper for primitive long
*/
@property (nonatomic, retain) NSNumber *categoryID;

/**
 
 ID of the secondary category (if any) in which the item would be listed.
 
 
 type : NSNumber, wrapper for primitive long
*/
@property (nonatomic, retain) NSNumber *category2ID;

/**
 
 The ID of the Selling Manager template. Store this value, for use in 
 other Selling Manager calls.
 
 
 type : NSNumber, wrapper for primitive long
*/
@property (nonatomic, retain) NSNumber *saleTemplateID;

/**
 
 Ignore this value. For the output value that indicates the 
 ID of the product associated with the template, 
 use SellingManagerProductDetails.ProductID.
 
 
 type : NSNumber, wrapper for primitive long
*/
@property (nonatomic, retain) NSNumber *saleTemplateGroupID;

/**
 
 The name of the template, as it will appear in Selling Manager Pro. 
 This name is the input value you provided in the SaleTemplateName field. 
 If you didn't specify a value for
 SaleTemplateName, then Item.Title is used as the name.
 
 
 type : NSString, wrapper for primitive string
*/
@property (nonatomic, retain) NSString *saleTemplateName;

/**
 
 The details of the product with which the template is associated.
 
 
 type : class Trading_SellingManagerProductDetailsType
*/
@property (nonatomic, retain) Trading_SellingManagerProductDetailsType *sellingManagerProductDetails;

/**
 
 Child elements contain the estimated listing fees for the new listing template.
 Note that the fee will only be charged when an item is created from the template.
 The fees do not include the Final Value Fee (FVF), which cannot be determined
 until an item is sold.
 
 
 type : class Trading_FeesType
*/
@property (nonatomic, retain) Trading_FeesType *fees;


@end
