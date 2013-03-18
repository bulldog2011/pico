// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "PicoClassSchema.h"
#import "PicoPropertySchema.h"
#import "PicoConstants.h"
#import "PicoBindable.h"


@class Trading_AmountType;

/**
 
 Type for expressing sales tax data.
 
 
 @ingroup EBayAPIInterface
*/
@interface Trading_SalesTaxType : NSObject <PicoBindable> {

@private
    NSNumber *_salesTaxPercent;
    NSString *_salesTaxState;
    NSNumber *_shippingIncludedInTax;
    Trading_AmountType *_salesTaxAmount;
    NSMutableArray *_any;

}


/**
 
 Percent of an item's price to be charged as the sales tax for the order.
 The value passed in is stored with a precision of 3 digits after the decimal
 point (##.###).
 <br><br>
 Applicable to Half.com (for GetOrders).
 
 
 type : NSNumber, wrapper for primitive float
*/
@property (nonatomic, retain) NSNumber *salesTaxPercent;

/**
 
 State or jurisdiction for which the sales tax is being collected.
 Only returned if the seller specified a value.
 <br><br>
 To see the valid values for your site, call <b>GeteBayDetails</b> with 
 <b>DetailName</b> set to <b>TaxJurisdiction</b>, and then 
 look for the TaxJurisdiction.JurisdictionID fields in the response.
 <br><br>
 Applicable to Half.com (for GetOrders).
 
 
 type : NSString, wrapper for primitive string
*/
@property (nonatomic, retain) NSString *salesTaxState;

/**
 
 (US only) Whether shipping costs were part of the base amount
 that was taxed. Flat or calculated shipping.
 <br><br>
 Applicable to Half.com (for GetOrders).
 
 
 type : NSNumber, wrapper for primitive bool
*/
@property (nonatomic, retain) NSNumber *shippingIncludedInTax;

/**
 
 The amount of sales tax, calculated for an order based on the
 SalesTaxPercent and pricing information. US (site 0) and Motors (site 100) sites
 only, excluding vehicle listings.
 <br><br>
 GetItemTransactions can return incorrect sales tax if the name of a state is not
 abbreviated (e.g. if the value is "Illinois" rather than "IL") in
 TransactionArray.Transaction.Buyer.BuyerInfo.ShippingAddress.StateOrProvince. If
 the name of a state is not abbreviated, sales tax should be obtained by using
 the OrderLineItemID to call GetOrderTransactions.
 <br><br>
 Applicable to Half.com (for GetOrders).
 
 
 type : class Trading_AmountType
*/
@property (nonatomic, retain) Trading_AmountType *salesTaxAmount;

/**
 (public property)
 
 entry type : PicoAnyElement, wrapper for primitive anyelement
*/

@property (nonatomic, retain) NSMutableArray *any;


@end
