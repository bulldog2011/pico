// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "PicoClassSchema.h"
#import "PicoPropertySchema.h"
#import "PicoConstants.h"
#import "PicoBindable.h"
#import "Trading_AbstractResponseType.h"


@class Trading_SellingManagerAutoSecondChanceOfferType;
@class Trading_FeesType;
@class Trading_SellingManagerAutoRelistType;
@class Trading_SellingManagerAutoListType;

/**
 
 Contains the set of automation rules associated with the specified template.
 
 
 @ingroup EBayAPIInterface
*/
@interface Trading_DeleteSellingManagerTemplateAutomationRuleResponseType : Trading_AbstractResponseType {

@private
    Trading_SellingManagerAutoListType *_automatedListingRule;
    Trading_SellingManagerAutoRelistType *_automatedRelistingRule;
    Trading_SellingManagerAutoSecondChanceOfferType *_automatedSecondChanceOfferRule;
    Trading_FeesType *_fees;

}


/**
 
 Contains the remaining automated listing rules associated with this template.
 
 
 type : class Trading_SellingManagerAutoListType
*/
@property (nonatomic, retain) Trading_SellingManagerAutoListType *automatedListingRule;

/**
 
 Contains the remaining automated relisting rules associated with this template.
 
 
 type : class Trading_SellingManagerAutoRelistType
*/
@property (nonatomic, retain) Trading_SellingManagerAutoRelistType *automatedRelistingRule;

/**
 
 Contains the remaining automated second chance offer rule associated with this template.
 
 
 type : class Trading_SellingManagerAutoSecondChanceOfferType
*/
@property (nonatomic, retain) Trading_SellingManagerAutoSecondChanceOfferType *automatedSecondChanceOfferRule;

/**
 
 Contains fees that may be incurred when items are listed using the 
 automation rules (e.g., a scheduled listing fee). Use of an automation rule 
 does not in itself have a fee, but use can result in a fee.
 
 
 type : class Trading_FeesType
*/
@property (nonatomic, retain) Trading_FeesType *fees;


@end
