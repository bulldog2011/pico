// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "PicoClassSchema.h"
#import "PicoPropertySchema.h"
#import "PicoConstants.h"
#import "PicoBindable.h"
#import "Trading_AbstractResponseType.h"


@class Trading_StoreCustomPageArrayType;

/**
 
 Contains the custom page or pages for the user's Store.
 
 
 @ingroup EBayAPIInterface
*/
@interface Trading_GetStoreCustomPageResponseType : Trading_AbstractResponseType {

@private
    Trading_StoreCustomPageArrayType *_customPageArray;

}


/**
 
 The custom page or custom pages.
 
 
 type : class Trading_StoreCustomPageArrayType
*/
@property (nonatomic, retain) Trading_StoreCustomPageArrayType *customPageArray;


@end
