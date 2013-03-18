// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "PicoClassSchema.h"
#import "PicoPropertySchema.h"
#import "PicoConstants.h"
#import "PicoBindable.h"


@class Trading_AttributeSetType;

/**
 
 No longer applicable to any eBay categories.
 
 
 @ingroup EBayAPIInterface
*/
@interface Trading_AttributeSetArrayType : NSObject <PicoBindable> {

@private
    NSMutableArray *_attributeSet;

}


/**
 
 Contains a list of attributes that describe category-specific aspects or
 features of an item in a standardized way.<br><br> For the
 AddItem family of calls and GetItem, an AttributeSetArray can contain a
 maximum of 2 full attribute sets (one for each category in which the item is
 listed) if the primary and secondary categories are mapped to different
 characteristic sets. If they are mapped to the same characteristic set, the
 AttributeSetArray can contain one full attribute set.<br>
 <br>
 An AttributeSetArray can also contain any number of additional site-wide
 attribute sets. In item-listing requests, AttributeSet is required if the
 category is mapped to a characteristic set with required attributes. On the US
 site, attributes are usually required for Tickets, eBay Motors vehicles, and
 Real Estate listings. See GetCategory2CS and GetAttributesCS. See the
 Developer's Guide for information about attribute meta-data and validation
 rules that are applicable when listing items.<br>
 <br>
 In GetItem, the Half.com item condition may be returned once in an
 AttributeSet node with Half.com IDs and values, and once in a separate
 AttributeSet node with a site-wide eBay item condition. The Half.com IDs are
 not necessarily returned in GetAttributesCS, so you can use the eBay.com data
 instead. Half.com listings may also return an AttributeSet node with other
 eBay attributes.
 
 
 entry type : class Trading_AttributeSetType
*/

@property (nonatomic, retain) NSMutableArray *attributeSet;


@end
