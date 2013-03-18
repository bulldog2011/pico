// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "PicoClassSchema.h"
#import "PicoPropertySchema.h"
#import "PicoConstants.h"
#import "PicoBindable.h"



/**
 
 Type defining the <b>ReportedItem</b> container which is returned in the 
 <b>GetVeROReportStatus</b> response. The <b>ReportedItem</b> 
 container consists of the <b>ItemID</b> of the item that has infringed 
 upon the seller's copyright, trademark, or intellectual property rights, as well as the
 submission status of the VeRO Report.
 
 
 @ingroup EBayAPIInterface
*/
@interface Trading_VeROReportedItemType : NSObject <PicoBindable> {

@private
    NSString *_itemID;
    NSString *_itemStatus;
    NSString *_itemReasonForFailure;
    NSMutableArray *_any;

}


/**
 
 The unique identifier (<b>ItemID</b>) of the item reported for
 copyright, trademark, or intellectual property right infringment.
 <br><br>
 This field is always returned with the <b>ReportedItem</b> container.
 
 
 type : NSString, wrapper for primitive string
*/
@property (nonatomic, retain) NSString *itemID;

/**
 
 This value indicates the current submission status of the VeRO Report.
 <br><br>
 This field is always returned with the <b>ReportedItem</b> container.
 
 
 type: string constant in Trading_VeROItemStatusCodeType.h
*/
@property (nonatomic, retain) NSString *itemStatus;

/**
 
 This text explanation is submitted by eBay when the submission of an VeRO Report 
 has failed or was blocked.
 <br><br>
 This field is only returned with the <b>ReportedItem</b> container if 
 the <b>ItemStatus</b> value is <b>SubmissionFailed</b> or 
 <b>ClarificationRequired</b>.
 
 
 type : NSString, wrapper for primitive string
*/
@property (nonatomic, retain) NSString *itemReasonForFailure;

/**
 (public property)
 
 entry type : PicoAnyElement, wrapper for primitive anyelement
*/

@property (nonatomic, retain) NSMutableArray *any;


@end
