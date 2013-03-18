// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "PicoClassSchema.h"
#import "PicoPropertySchema.h"
#import "PicoConstants.h"
#import "PicoBindable.h"



/**
 
   This type is deprecated as Cross Promotions are no longer supported in the APIs.
 
 
 
 @ingroup EBayAPIInterface
*/
@interface Trading_PromotionRuleType : NSObject <PicoBindable> {

@private
    NSNumber *_promotedStoreCategoryID;
    NSString *_promotedeBayCategoryID;
    NSString *_promotedKeywords;
    NSString *_referringItemID;
    NSNumber *_referringStoreCategoryID;
    NSString *_referringeBayCategoryID;
    NSString *_referringKeywords;
    NSString *_promotionScheme;
    NSString *_promotionMethod;
    NSMutableArray *_any;

}


/**
 
 
 The ID of the Store category being promoted. Use with a promotion scheme of
 ItemToStoreCat, StoreToStoreCat, ItemToDefaultRule, or
 DefaultRule. Only for Store owners.
 
 
 type : NSNumber, wrapper for primitive long
*/
@property (nonatomic, retain) NSNumber *promotedStoreCategoryID;

/**
 
 
 The ID of the eBay category being promoted. Use with a promotion scheme of
 ItemToDefaultRule or DefaultRule.
 
 
 type : NSString, wrapper for primitive string
*/
@property (nonatomic, retain) NSString *promotedeBayCategoryID;

/**
 
 
 The keywords that identify promoted items. Use with a promotion scheme of
 ItemToDefaultRule or DefaultRule. Only for Store owners.
 
 
 type : NSString, wrapper for primitive string
*/
@property (nonatomic, retain) NSString *promotedKeywords;

/**
 
 
 The unique ID of the item the buyer is viewing or purchasing.
 Use with a promotion scheme of ItemToItem or ItemToStoreCat.
 Always use ReferringItemID or ReferringStoreCategoryID, but
 not both.
 
 
 type : NSString, wrapper for primitive string
*/
@property (nonatomic, retain) NSString *referringItemID;

/**
 
 
 The ID of the store category the user is browsing. Use with a
 promotion scheme of 
 StoreToStoreCat, ItemToDefaultRule or DefaultRule.
 Always use ReferringStoreCategoryID or ReferringItemID, but
 not both.
 
 
 type : NSNumber, wrapper for primitive long
*/
@property (nonatomic, retain) NSNumber *referringStoreCategoryID;

/**
 
 
 The ID of the eBay category being referred. Use with a promotion scheme
 or ItemToDefaultRule or DefaultRule.
 
 
 type : NSString, wrapper for primitive string
*/
@property (nonatomic, retain) NSString *referringeBayCategoryID;

/**
 
 
 The keywords that identify referring items. Use with a promotion scheme of
 ItemToDefaultRule or DefaultRule. Only for Store owners.
 
 
 type : NSString, wrapper for primitive string
*/
@property (nonatomic, retain) NSString *referringKeywords;

/**
  
 
 The type of cross-promotion scheme you are defining.
 
 
 type: string constant in Trading_PromotionSchemeCodeType.h
*/
@property (nonatomic, retain) NSString *promotionScheme;

/**
  
 
 The type of cross promotion, CrossSell or UpSell.
 
 
 type: string constant in Trading_PromotionMethodCodeType.h
*/
@property (nonatomic, retain) NSString *promotionMethod;

/**
 (public property)
 
 entry type : PicoAnyElement, wrapper for primitive anyelement
*/

@property (nonatomic, retain) NSMutableArray *any;


@end
