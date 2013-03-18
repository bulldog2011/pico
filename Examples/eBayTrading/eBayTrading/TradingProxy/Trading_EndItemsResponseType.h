// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "PicoClassSchema.h"
#import "PicoPropertySchema.h"
#import "PicoConstants.h"
#import "PicoBindable.h"
#import "Trading_AbstractResponseType.h"


@class Trading_EndItemResponseContainerType;

/**
 
 Contains a response of the resulting status of ending each item.
 
 
 @ingroup EBayAPIInterface
*/
@interface Trading_EndItemsResponseType : Trading_AbstractResponseType {

@private
    NSMutableArray *_endItemResponseContainer;

}


/**
 
 Returns a response for an individually ended item. Mutiple containers will be listed if multiple items are ended.
 
 
 entry type : class Trading_EndItemResponseContainerType
*/

@property (nonatomic, retain) NSMutableArray *endItemResponseContainer;


@end
