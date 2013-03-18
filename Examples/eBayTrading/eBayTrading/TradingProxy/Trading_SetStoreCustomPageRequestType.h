// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "PicoClassSchema.h"
#import "PicoPropertySchema.h"
#import "PicoConstants.h"
#import "PicoBindable.h"
#import "Trading_AbstractRequestType.h"


@class Trading_StoreCustomPageType;

/**
 
       Creates or updates a custom page on a user's eBay Store.
     
 
 @ingroup EBayAPIInterface
*/
@interface Trading_SetStoreCustomPageRequestType : Trading_AbstractRequestType {

@private
    Trading_StoreCustomPageType *_customPage;

}


/**
 
      The custom page being submitted.
   
 
 type : class Trading_StoreCustomPageType
*/
@property (nonatomic, retain) Trading_StoreCustomPageType *customPage;


@end
