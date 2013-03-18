// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "PicoClassSchema.h"
#import "PicoPropertySchema.h"
#import "PicoConstants.h"
#import "PicoBindable.h"
#import "Trading_AbstractResponseType.h"


@class Trading_StorePreferencesType;

/**
 
 Contains the Store preferences retrieved for a user.
 
 
 @ingroup EBayAPIInterface
*/
@interface Trading_GetStorePreferencesResponseType : Trading_AbstractResponseType {

@private
    Trading_StorePreferencesType *_storePreferences;

}


/**
 
 The user's Store preferences.
 
 
 type : class Trading_StorePreferencesType
*/
@property (nonatomic, retain) Trading_StorePreferencesType *storePreferences;


@end
