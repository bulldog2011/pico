// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "PicoClassSchema.h"
#import "PicoPropertySchema.h"
#import "PicoConstants.h"
#import "PicoBindable.h"


@class Trading_BidderDetailType;

/**
  
 A collection of Bidder Detail.
 
 
 @ingroup EBayAPIInterface
*/
@interface Trading_BidderDetailArrayType : NSObject <PicoBindable> {

@private
    NSMutableArray *_bidderDetail;

}


/**
  
 Details about a Live Auctions bidder.
 Returned if at least one bidder has requested approval.
 
 
 entry type : class Trading_BidderDetailType
*/

@property (nonatomic, retain) NSMutableArray *bidderDetail;


@end
