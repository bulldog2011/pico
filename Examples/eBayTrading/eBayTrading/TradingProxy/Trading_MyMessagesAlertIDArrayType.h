// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "PicoClassSchema.h"
#import "PicoPropertySchema.h"
#import "PicoConstants.h"
#import "PicoBindable.h"



/**
 
 This type is deprecated because <b>MyMessagesAlert*</b> are deprecated.
 
 
 
 @ingroup EBayAPIInterface
*/
@interface Trading_MyMessagesAlertIDArrayType : NSObject <PicoBindable> {

@private
    NSMutableArray *_alertID;

}


/**
 
 
 This field will be deprecated in an upcoming release. This field formerly
 was an ID that uniquely identified an alert for a given user.
 
 
 entry type : NSString, wrapper for primitive string
*/

@property (nonatomic, retain) NSMutableArray *alertID;


@end
