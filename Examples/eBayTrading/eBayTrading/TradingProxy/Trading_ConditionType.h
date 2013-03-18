// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "PicoClassSchema.h"
#import "PicoPropertySchema.h"
#import "PicoConstants.h"
#import "PicoBindable.h"



/**
 
 Fields in this type provide IDs and values for item conditions 
 (in GetCategoryFeatures).
 
 
 @ingroup EBayAPIInterface
*/
@interface Trading_ConditionType : NSObject <PicoBindable> {

@private
    NSNumber *_id;
    NSString *_displayName;
    NSMutableArray *_any;

}


/**
 
 The numeric ID of a condition (e.g., 1000). Use the ID in 
 AddItem and related calls.
 
 
 type : NSNumber, wrapper for primitive int
*/
@property (nonatomic, retain) NSNumber *id;

/**
 
 The human-readable label for the condition (e.g., "New"). 
 This value is typically localized for each site. 
 The display name can vary by category. 
 For example, condition ID 1000 could be called
 "New: with Tags" in one category and "Brand New" in another.
 
 
 type : NSString, wrapper for primitive string
*/
@property (nonatomic, retain) NSString *displayName;

/**
 (public property)
 
 entry type : PicoAnyElement, wrapper for primitive anyelement
*/

@property (nonatomic, retain) NSMutableArray *any;


@end
