// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "PicoClassSchema.h"
#import "PicoPropertySchema.h"
#import "PicoConstants.h"
#import "PicoBindable.h"
#import "Trading_AbstractRequestType.h"


@class Trading_StoreCustomCategoryArrayType;

/**
 
 Changes the category structure of an eBay store.
 
 
 @ingroup EBayAPIInterface
*/
@interface Trading_SetStoreCategoriesRequestType : Trading_AbstractRequestType {

@private
    NSString *_action;
    NSNumber *_itemDestinationCategoryID;
    NSNumber *_destinationParentCategoryID;
    Trading_StoreCustomCategoryArrayType *_storeCategories;

}


/**
 
 Specifies the type of action (Add, Move, Delete, or Rename) to carry out
 for the specified categories.
 
 
 type: string constant in Trading_StoreCategoryUpdateActionCodeType.h
*/
@property (nonatomic, retain) NSString *action;

/**
 
 Items can only be contained within child categories. A parent category
 cannot contain items. If adding, moving, or deleting categories displaces
 items, you must specify a destination child category under which the
 displaced items will be moved. The destination category must have no
 child categories.
 
 
 type : NSNumber, wrapper for primitive long
*/
@property (nonatomic, retain) NSNumber *itemDestinationCategoryID;

/**
 
 When adding or moving store categories, specifies the category under
 which the listed categories will be located. To add or move categories to
 the top level, set the value to -999.
 
 
 type : NSNumber, wrapper for primitive long
*/
@property (nonatomic, retain) NSNumber *destinationParentCategoryID;

/**
 
 Specifies the store categories on which to act.
 
 
 type : class Trading_StoreCustomCategoryArrayType
*/
@property (nonatomic, retain) Trading_StoreCustomCategoryArrayType *storeCategories;


@end
