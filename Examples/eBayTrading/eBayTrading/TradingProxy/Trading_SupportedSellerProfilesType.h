// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "PicoClassSchema.h"
#import "PicoPropertySchema.h"
#import "PicoConstants.h"
#import "PicoBindable.h"


@class Trading_SupportedSellerProfileType;

/**
 
   Type defining the <b>SupportedSellerProfiles</b> container for all payment,
 return, and shipping policy profiles that a seller has defined for a site.
 <br><br>
 <span class="tablenote"><strong>Note:</strong>
 Beginning with Version 763, the new Business Policies Management API and related Trading
 API containers/fields become available for testing in the Sandbox environment. In May
 2012, Business Policies becomes fully functional and sellers can apply Business Policies 
 profiles to live eBay listings.
 </span>
 
 
 @ingroup EBayAPIInterface
*/
@interface Trading_SupportedSellerProfilesType : NSObject <PicoBindable> {

@private
    NSMutableArray *_supportedSellerProfile;

}


/**
 
 Container consisting of information related to specific Business Policies payment, return,
 and shipping policy profiles. The profile type is found in the
 <b>ProfileType</b> field.
 <br><br>
 <span class="tablenote"><strong>Note:</strong>
 Beginning with Version 763, the new Business Policies Management API and related Trading
 API containers/fields become available for testing in the Sandbox environment. In May
 2012, Business Policies becomes fully functional and sellers can apply Business Policies 
 profiles to live eBay listings.
 </span>
 
 
 entry type : class Trading_SupportedSellerProfileType
*/

@property (nonatomic, retain) NSMutableArray *supportedSellerProfile;


@end
