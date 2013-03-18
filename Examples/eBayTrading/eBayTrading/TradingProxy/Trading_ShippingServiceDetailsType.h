// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "PicoClassSchema.h"
#import "PicoPropertySchema.h"
#import "PicoConstants.h"
#import "PicoBindable.h"


@class Trading_ShippingServicePackageDetailsType;
@class Trading_AnnouncementMessageType;

/**
 
 Details about a specific shipping service.
 
 
 @ingroup EBayAPIInterface
*/
@interface Trading_ShippingServiceDetailsType : NSObject <PicoBindable> {

@private
    NSString *_description;
    NSNumber *_expeditedService;
    NSNumber *_internationalService;
    NSString *_shippingService;
    NSNumber *_shippingServiceID;
    NSNumber *_shippingTimeMax;
    NSNumber *_shippingTimeMin;
    NSString *_shippingServiceCode;
    NSMutableArray *_serviceType;
    NSMutableArray *_shippingPackage;
    NSNumber *_dimensionsRequired;
    NSNumber *_validForSellingFlow;
    NSNumber *_surchargeApplicable;
    NSMutableArray *_shippingCarrier;
    NSNumber *_codService;
    NSMutableArray *_deprecationDetails;
    NSNumber *_mappedToShippingServiceID;
    NSString *_costGroupFlat;
    NSMutableArray *_shippingServicePackageDetails;
    NSNumber *_weightRequired;
    NSString *_detailVersion;
    NSDate *_updateTime;
    NSString *_shippingCategory;
    NSMutableArray *_any;

}


/**
 
 Display string that applications can use to present a list of shipping service
 options in a more user-friendly format (such as in a drop-down list).
 
 
 type : NSString, wrapper for primitive string
*/
@property (nonatomic, retain) NSString *description;

/**
 
 Indicates whether the shipping service is an expedited shipping service.
 See Enabling Get It Fast. Only returned for sites for which the Get It
 Fast feature is enabled and only if true.
 
 
 type : NSNumber, wrapper for primitive bool
*/
@property (nonatomic, retain) NSNumber *expeditedService;

/**
 
 Indicates whether the shipping service is an international shipping service.
 An international shipping service option is required if an item is being
 shipped from one country (origin) to another (destination).
 
 
 type : NSNumber, wrapper for primitive bool
*/
@property (nonatomic, retain) NSNumber *internationalService;

/**
 
 The name of shipping service option. The
 ShippingServiceDetails.ValidForSellingFlow flag must also be present. Otherwise,
 that particular shipping service option is no longer valid and cannot be offered
 to buyers through a listing.
 
 
 type : NSString, wrapper for primitive string
*/
@property (nonatomic, retain) NSString *shippingService;

/**
 
 Numeric identifier. A value greater than 50000 represents an
 international shipping service (confirmed by
 InternationalShippingService being true). Some applications use this ID
 to look up shipping services more efficiently.
 Also useful for applications that have migrated from the legacy XML API.
 
 
 type : NSNumber, wrapper for primitive int
*/
@property (nonatomic, retain) NSNumber *shippingServiceID;

/**
 
 The maximum guaranteed number of days the shipping carrier will
 take to ship an item (not including the time it takes the
 seller to deliver the item to the shipping carrier). Always
 returned when ExpeditedService is true or if defined for a particular service.
 See Enabling Get It Fast feature.
 
 
 type : NSNumber, wrapper for primitive int
*/
@property (nonatomic, retain) NSNumber *shippingTimeMax;

/**
 
 The minimum guaranteed number of days the shipping carrier will
 take to ship an item (not including the time it takes the
 seller to deliver the item to the shipping carrier). Always
 returned when ExpeditedService is true or if defined for a
 particular service.
 See Enabling Get It Fast feature.
 
 
 type : NSNumber, wrapper for primitive int
*/
@property (nonatomic, retain) NSNumber *shippingTimeMin;

/**
 
 For future use.
 
 
 type: string constant in Trading_ShippingServiceCodeType.h
*/
@property (nonatomic, retain) NSString *shippingServiceCode;

/**
 
 The types of shipping that this shipping service supports.
 
 
 entry type : string constant in Trading_ShippingTypeCodeType.h
*/

@property (nonatomic, retain) NSMutableArray *serviceType;

/**
 
 The kinds of packages supported by this shipping service.
 
 
 entry type : string constant in Trading_ShippingPackageCodeType.h
*/

@property (nonatomic, retain) NSMutableArray *shippingPackage;

/**
 
 This field is only returned if the shipping service option requires that package 
 dimensions are provided by the seller. If it is returned, it is always returned 
 as 'true'.
 
 
 type : NSNumber, wrapper for primitive bool
*/
@property (nonatomic, retain) NSNumber *dimensionsRequired;

/**
 
 If this field is returned as 'true', the shipping service option can be used in a
 Add/Revise/Relist API call. If this field is returned as 'false', the shipping
 service option is not currently supported and cannot be used in a
 Add/Revise/Relist API call.
 
 
 type : NSNumber, wrapper for primitive bool
*/
@property (nonatomic, retain) NSNumber *validForSellingFlow;

/**
 
 True if a surcharge applies for any region that this service ships to.
 
 
 type : NSNumber, wrapper for primitive bool
*/
@property (nonatomic, retain) NSNumber *surchargeApplicable;

/**
 
 The kinds of carrier supported by this shipping service.
 
 
 entry type : string constant in Trading_ShippingCarrierCodeType.h
*/

@property (nonatomic, retain) NSMutableArray *shippingCarrier;

/**
 
 Applies to the Italy site (site ID 101) only. Indicates whether the shipping service
 is a Cash On Delivery shipping service.
 Returned only if true.
 
 
 type : NSNumber, wrapper for primitive bool
*/
@property (nonatomic, retain) NSNumber *codService;

/**
 
 A mechanism by which details about deprecation of a shipping service is
 announced. See also MappedToShippingServiceID.
 If this container is empty, it means that there is no mapping for this
 shipping service and that the shipping service will be dropped from the
 listing without an accompanying warning message from the eBay API.
 
 
 entry type : class Trading_AnnouncementMessageType
*/

@property (nonatomic, retain) NSMutableArray *deprecationDetails;

/**
 
 The ID of another shipping service that will be used when a
 shipping service is deprecated. See also DeprecationDetails.
 
 
 type : NSNumber, wrapper for primitive int
*/
@property (nonatomic, retain) NSNumber *mappedToShippingServiceID;

/**
 
 If returned, this is the shipping service group to which the shipping service belongs.
 Valid values are found in CostGroupFlatCodeType.
 
 
 type : NSString, wrapper for primitive string
*/
@property (nonatomic, retain) NSString *costGroupFlat;

/**
 
 Shipping Package level details for the enclosing shipping service, this
 complex type replaces the existing ShippingPackage type.
 
 
 entry type : class Trading_ShippingServicePackageDetailsType
*/

@property (nonatomic, retain) NSMutableArray *shippingServicePackageDetails;

/**
 
 If true, a seller who selects this package type for the listing and then offers
 this shipping service must specify WeightMajor and WeightMinor in the item definition.
 If not returned, WeightRequired is false.
 
 
 type : NSNumber, wrapper for primitive bool
*/
@property (nonatomic, retain) NSNumber *weightRequired;

/**
 
 Returns the latest version number for this field. The version can be
 used to determine if and when to refresh cached client data.
 
 
 type : NSString, wrapper for primitive string
*/
@property (nonatomic, retain) NSString *detailVersion;

/**
 
 Gives the time in GMT that the feature flags for the details were last
 updated. This timestamp can be used to determine if and when to refresh
 cached client data.
 
 
 type : NSDate, wrapper for primitive date
*/
@property (nonatomic, retain) NSDate *updateTime;

/**
 
 Indicates the shipping category. Shipping categories include the following:
 ECONOMY, STANDARD, EXPEDITED, ONE_DAY, PICKUP, OTHER, and NONE. International
 shipping services are generally grouped into the NONE category. For more
 information on these shipping categories, see the
 <a href="http://pages.ebay.com/sellerinformation/shipping/chooseservice.html">Shipping Basics</a> page on the eBay Shipping Center site.
 
 
 type : NSString, wrapper for primitive string
*/
@property (nonatomic, retain) NSString *shippingCategory;

/**
 (public property)
 
 entry type : PicoAnyElement, wrapper for primitive anyelement
*/

@property (nonatomic, retain) NSMutableArray *any;


@end
