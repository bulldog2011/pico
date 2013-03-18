// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "PicoClassSchema.h"
#import "PicoPropertySchema.h"
#import "PicoConstants.h"
#import "PicoBindable.h"
#import "Trading_AbstractResponseType.h"


@class Trading_SellingManagerAlertType;

/**
 
 Type defining the call-specific response fields for the <b>GetSellingManagerAlerts</b> 
 call.
 
 
 @ingroup EBayAPIInterface
*/
@interface Trading_GetSellingManagerAlertsResponseType : Trading_AbstractResponseType {

@private
    NSMutableArray *_alert;

}


/**
 
 Container consisting of details related to a Selling Manager alert. Alert types 
 include listing automation, inventory, PaisaPay (India only), item sold, and 
 a general alert.
 
 
 entry type : class Trading_SellingManagerAlertType
*/

@property (nonatomic, retain) NSMutableArray *alert;


@end
