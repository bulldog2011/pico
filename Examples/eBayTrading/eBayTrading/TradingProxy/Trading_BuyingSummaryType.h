// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "PicoClassSchema.h"
#import "PicoPropertySchema.h"
#import "PicoConstants.h"
#import "PicoBindable.h"


@class Trading_AmountType;

/**
 
 Type defining the <b>BuyingSummary</b> container returned in 
 <b>GetMyeBayBuying<b>. The <b>BuyingSummary</b> container 
 consists of data that summarizes the buyer's recent buying activity, including the 
 number of items bid on, the number of items buyer is winning, and the number of items 
 the buyer has won. The <b>BuyingSummary</b> container is only returned if
 the <b>BuyingSummary.Include</b> field is included in the GetMyeBayBuying request and set to 
 'true'. 
 
 
 @ingroup EBayAPIInterface
*/
@interface Trading_BuyingSummaryType : NSObject <PicoBindable> {

@private
    NSNumber *_biddingCount;
    NSNumber *_winningCount;
    Trading_AmountType *_totalWinningCost;
    NSNumber *_wonCount;
    Trading_AmountType *_totalWonCost;
    NSNumber *_wonDurationInDays;
    NSNumber *_bestOfferCount;

}


/**
 
      The number of auction items the user has bid on.
 
 
 type : NSNumber, wrapper for primitive int
*/
@property (nonatomic, retain) NSNumber *biddingCount;

/**
 
  The number of auction items the user has bid on and is winning, but auctions have not yet ended.
 
 
 type : NSNumber, wrapper for primitive int
*/
@property (nonatomic, retain) NSNumber *winningCount;

/**
 
      The total cost of items the user is presently winning.
 
 
 type : class Trading_AmountType
*/
@property (nonatomic, retain) Trading_AmountType *totalWinningCost;

/**
 
 The number of items the user has bid on and won.
 
 
 type : NSNumber, wrapper for primitive int
*/
@property (nonatomic, retain) NSNumber *wonCount;

/**
 
  The total cost of items the user has bid on and won.
 
 
 type : class Trading_AmountType
*/
@property (nonatomic, retain) Trading_AmountType *totalWonCost;

/**
 
 The time period for which won items are displayed. Default is 31 days.
 
 
 type : NSNumber, wrapper for primitive int
*/
@property (nonatomic, retain) NSNumber *wonDurationInDays;

/**
 
     The number of items the user has made Best Offers on.
     
 
 type : NSNumber, wrapper for primitive int
*/
@property (nonatomic, retain) NSNumber *bestOfferCount;


@end
