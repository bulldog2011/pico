// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "PicoClassSchema.h"
#import "PicoPropertySchema.h"
#import "PicoConstants.h"
#import "PicoBindable.h"


@class ErrorData;

/**
 
 Information regarding an error or warning that occurred when eBay processed
 the request. Not returned when the ack value is Success. Run-time errors are
 not reported here, but are instead reported as part of a SOAP fault.
 
 
 @ingroup FindingServicePortType
*/
@interface ErrorMessage : NSObject <PicoBindable> {

@private
    NSMutableArray *_error;

}


/**
 
 Details about a single error.
 
 
 entry type : class ErrorData
*/

@property (nonatomic, retain) NSMutableArray *error;


@end