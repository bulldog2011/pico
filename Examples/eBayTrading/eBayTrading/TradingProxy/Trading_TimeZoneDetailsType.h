// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "PicoClassSchema.h"
#import "PicoPropertySchema.h"
#import "PicoConstants.h"
#import "PicoBindable.h"



/**
 
 Time zone details about a region or location to which the seller is willing to
 ship.
 
 
 @ingroup EBayAPIInterface
*/
@interface Trading_TimeZoneDetailsType : NSObject <PicoBindable> {

@private
    NSString *_timeZoneID;
    NSString *_standardLabel;
    NSString *_standardOffset;
    NSString *_daylightSavingsLabel;
    NSString *_daylightSavingsOffset;
    NSNumber *_daylightSavingsInEffect;
    NSString *_detailVersion;
    NSDate *_updateTime;
    NSMutableArray *_any;

}


/**
 
 A unique identifier for a given time zone. This ID does not change for a
 given time zone, even if the time zone supports both standard and daylight
 saving time variants. Valid values for TimeZoneID correspond to OLSON IDs.
 These IDs provide not only the information as to the offset from GMT (UTC),
 but also daylight saving time information. Thus, for example, America/Phoenix
 is distinct from America/Denver because they have different daylight saving
 time behavior. This value is not localized.
 
 
 type : NSString, wrapper for primitive string
*/
@property (nonatomic, retain) NSString *timeZoneID;

/**
 
 Display name of a time zone in its standard (non-daylight saving) time
 representation. This value is localized and returned in the language for the
 site specified in the request (i.e., the numeric site ID that you specify in
 the request URL for the SOAP API or the X-EBAY-API-SITEID header for the XML
 API).
 
 
 type : NSString, wrapper for primitive string
*/
@property (nonatomic, retain) NSString *standardLabel;

/**
 
 The offset in hours from GMT for a time zone when it is not adjusted for
 daylight saving time.
 
 
 type : NSString, wrapper for primitive string
*/
@property (nonatomic, retain) NSString *standardOffset;

/**
 
 Display name of a time zone in its daylight saving time representation.
 This element is emitted for time zones that support daylight saving time
 only. The value is localized and returned in the language for the site
 specified in the request.
 
 
 type : NSString, wrapper for primitive string
*/
@property (nonatomic, retain) NSString *daylightSavingsLabel;

/**
 
 The offset in hours from GMT for a time zone when it is on daylight saving
 time. This element is emitted for time zones that support daylight
 saving time only.
 
 
 type : NSString, wrapper for primitive string
*/
@property (nonatomic, retain) NSString *daylightSavingsOffset;

/**
 
 Indicates whether or not the time zone is currently on daylight saving time.
 A value of true indicates that the time zone is on daylights savings time.
 This element is emitted for time zones that support daylight saving time only.
 
 
 type : NSNumber, wrapper for primitive bool
*/
@property (nonatomic, retain) NSNumber *daylightSavingsInEffect;

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
 (public property)
 
 entry type : PicoAnyElement, wrapper for primitive anyelement
*/

@property (nonatomic, retain) NSMutableArray *any;


@end
