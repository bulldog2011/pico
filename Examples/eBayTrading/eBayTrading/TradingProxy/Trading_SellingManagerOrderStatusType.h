// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "PicoClassSchema.h"
#import "PicoPropertySchema.h"
#import "PicoConstants.h"
#import "PicoBindable.h"



/**
 
 Status of a Selling manager order.
 
 
 @ingroup EBayAPIInterface
*/
@interface Trading_SellingManagerOrderStatusType : NSObject <PicoBindable> {

@private
    NSString *_checkoutStatus;
    NSString *_paidStatus;
    NSString *_shippedStatus;
    NSString *_eBayPaymentStatus;
    NSString *_payPalTransactionID;
    NSString *_paymentMethodUsed;
    NSString *_feedbackReceived;
    NSNumber *_feedbackSent;
    NSNumber *_totalEmailsSent;
    NSString *_paymentHoldStatus;
    NSString *_sellerInvoiceNumber;
    NSDate *_shippedTime;
    NSDate *_paidTime;
    NSDate *_lastEmailSentTime;
    NSDate *_sellerInvoiceTime;
    NSNumber *_integratedMerchantCreditCardEnabled;
    NSMutableArray *_any;

}


/**
 
 Indicates the current status of the checkout flow for the order. 
 
 
 type: string constant in Trading_CheckoutStatusCodeType.h
*/
@property (nonatomic, retain) NSString *checkoutStatus;

/**
 
 The paid status of the order.
 
 
 type: string constant in Trading_SellingManagerPaidStatusCodeType.h
*/
@property (nonatomic, retain) NSString *paidStatus;

/**
 
 The shipped status of the order.
 
 
 type: string constant in Trading_SellingManagerShippedStatusCodeType.h
*/
@property (nonatomic, retain) NSString *shippedStatus;

/**
 
 The success or failure of a buyer's online payment.
 
 
 type: string constant in Trading_PaymentStatusCodeType.h
*/
@property (nonatomic, retain) NSString *eBayPaymentStatus;

/**
 
 The PayPal transaction ID. This value is not returned to new DE and AT sellers
 who are subject to the new payment process.
 <br>
 <br>
 <span class="tablenote"><b>Note:</b>
 The introduction of the new eBay payment process for the entire German and
 Austrian eBay marketplace has been delayed until further notice.<br>
 
 
 type : NSString, wrapper for primitive string
*/
@property (nonatomic, retain) NSString *payPalTransactionID;

/**
 
 The payment method the buyer selected for paying the seller
 for the order. If checkout is incomplete,
 PaymentMethodUsed is set to whatever the buyer selected as his
 or her preference on the Review Your Purchase page.
 
 
 type: string constant in Trading_BuyerPaymentMethodCodeType.h
*/
@property (nonatomic, retain) NSString *paymentMethodUsed;

/**
 
 The type of feedback received (if feedback was received).
 
 
 type: string constant in Trading_CommentTypeCodeType.h
*/
@property (nonatomic, retain) NSString *feedbackReceived;

/**
 
 Whether the seller has left feedback.
 
 
 type : NSNumber, wrapper for primitive bool
*/
@property (nonatomic, retain) NSNumber *feedbackSent;

/**
 
 The total emails sent.
 
 
 type : NSNumber, wrapper for primitive int
*/
@property (nonatomic, retain) NSNumber *totalEmailsSent;

/**
 
 Contains the current status of a hold on a PayPal payment.
 The payment hold that is referred to as a "payment review" hold
 results from a possible issue with a buyer.
 The payment hold referred to as
 a "merchant hold" results from a possible issue with a seller.
 For more information, please see the link below.
 
 
 type: string constant in Trading_PaymentHoldStatusCodeType.h
*/
@property (nonatomic, retain) NSString *paymentHoldStatus;

/**
 
 The custom invoice number.
 
 
 type : NSString, wrapper for primitive string
*/
@property (nonatomic, retain) NSString *sellerInvoiceNumber;

/**
 
 The date on which the seller marks the item as shipped, either set by default as
 the date date the item was marked shipped or set explicitly by the seller using
 the Edit Sales Record page. Note that sellers have the ability to set this value
 up to 3 calendar days in the future.
 
 
 type : NSDate, wrapper for primitive date
*/
@property (nonatomic, retain) NSDate *shippedTime;

/**
 
 Date on which the order was paid.
 
 
 type : NSDate, wrapper for primitive date
*/
@property (nonatomic, retain) NSDate *paidTime;

/**
 
 The time that the last email was sent.
 
 
 type : NSDate, wrapper for primitive date
*/
@property (nonatomic, retain) NSDate *lastEmailSentTime;

/**
 
 The time the invoice was sent. This is a seller-entered value for VAT-enabled
 sites. It is returned only for business sellers in VAT-enabled sites.
 
 
 type : NSDate, wrapper for primitive date
*/
@property (nonatomic, retain) NSDate *sellerInvoiceTime;

/**
 
 Indicates whether the item can be paid for through a payment gateway (Payflow) account.
 If IntegratedMerchantCreditCardEnabled is true, then integrated merchant credit card (IMCC) is
 enabled for credit cards because the seller has a payment gateway account.
 Therefore, if IntegratedMerchantCreditCardEnabled is true, and AmEx, Discover, or
 VisaMC is returned for an item, then on checkout, an online credit-card payment
 is processed through a payment gateway account.
 A payment gateway account is used by sellers to accept online
 credit cards (Visa, MasterCard, American Express, and Discover).
 
 
 type : NSNumber, wrapper for primitive bool
*/
@property (nonatomic, retain) NSNumber *integratedMerchantCreditCardEnabled;

/**
 (public property)
 
 entry type : PicoAnyElement, wrapper for primitive anyelement
*/

@property (nonatomic, retain) NSMutableArray *any;


@end
