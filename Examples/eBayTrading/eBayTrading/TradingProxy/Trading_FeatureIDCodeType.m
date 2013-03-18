// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import "Trading_FeatureIDCodeType.h"

/**
 @file
 
 Specifies the feature IDs for which you want information. If you do not specify a
 value, all feature IDs are returned.
 
*/

/**
 
 Returns information about the durations of listings you can use in a
 given category.
 <br><br>
 <bold>Note:</bold> Durations for Local Market listings are not
 supported by GetCategoryFeatures. Refer to the Local Market Listing
 documentation in the
 Web Services Guide for valid listing durations.
 
*/
NSString *const Trading_FeatureIDCodeType_LISTING_DURATIONS = @"ListingDurations";

/**
 
 Returns information about whether a category supports Best Offers.
 
*/
NSString *const Trading_FeatureIDCodeType_BEST_OFFER_ENABLED = @"BestOfferEnabled";

NSString *const Trading_FeatureIDCodeType_DUTCH_BIN_ENABLED = @"DutchBINEnabled";

/**
 
 Returns information about whether a seller is required to
 specify at least one domestic shipping
 service and associated cost in order to list the item.
 
*/
NSString *const Trading_FeatureIDCodeType_SHIPPING_TERMS_REQUIRED = @"ShippingTermsRequired";

/**
 
 Returns information about whether a bidder must consent to the bid
 by confirming that he or she read and agrees to the terms in eBay's privacy policy.
 
*/
NSString *const Trading_FeatureIDCodeType_USER_CONSENT_REQUIRED = @"UserConsentRequired";

/**
 
 Indicates whether or not it is possible to enhance a listing by putting
 it into a rotation for display on a special area of the eBay home page.
 Support for this feature varies by site. Item or feedback restrictions may apply.
 
*/
NSString *const Trading_FeatureIDCodeType_HOME_PAGE_FEATURED_ENABLED = @"HomePageFeaturedEnabled";

/**
 
 Indicates whether a category supports Classified Ad listings.
 
*/
NSString *const Trading_FeatureIDCodeType_AD_FORMAT_ENABLED = @"AdFormatEnabled";

NSString *const Trading_FeatureIDCodeType_DIGITAL_DELIVERY_ENABLED = @"DigitalDeliveryEnabled";

/**
 
 Returns information about whether a category supports counter-offers for Best Offers.
 
*/
NSString *const Trading_FeatureIDCodeType_BEST_OFFER_COUNTER_ENABLED = @"BestOfferCounterEnabled";

/**
 
 Returns information about whether a category supports auto-decline for Best Offers.
 
*/
NSString *const Trading_FeatureIDCodeType_BEST_OFFER_AUTO_DECLINE_ENABLED = @"BestOfferAutoDeclineEnabled";

/**
 
 Returns information about ProPackBundle (a feature pack). Applies only to US
 and Canadian eBay motor vehicle sellers. Contains the Bold, Border, Featured
 and Highlight features.
 
*/
NSString *const Trading_FeatureIDCodeType_PRO_PACK = @"ProPack";

/**
 
 Not applicable to any site.
 Formerly, Australia site (site ID 15, abbreviation AU) only, and
 returned information about the BasicUpgradePack bundle (a feature pack),
 which combined the features Gallery and Subtitle for a discounted price.
 
*/
NSString *const Trading_FeatureIDCodeType_BASIC_UPGRADE_PACK = @"BasicUpgradePack";

/**
 
 Returns information about the ValuePack bundle (a feature pack), which
 combines the features Gallery, Subtitle, and Listing Designer for a discounted
 price. Support for this feature varies by site and category.
 
*/
NSString *const Trading_FeatureIDCodeType_VALUE_PACK = @"ValuePack";

/**
 
 Returns information about the ProPackPlus bundle (a feature pack), which
 combines the features BoldTitle, Border, Highlight, Featured, and Gallery for
 a discounted price. Support for this feature varies by site and category.
 
*/
NSString *const Trading_FeatureIDCodeType_PRO_PACK_PLUS = @"ProPackPlus";

/**
 
 Returns information about whether a category supports Local Market listings
 for sellers subscribed to Local Market for Specialty Vehicles.
 
*/
NSString *const Trading_FeatureIDCodeType_LOCAL_MARKET_SPECIALITY_SUBSCRIPTION = @"LocalMarketSpecialitySubscription";

/**
 
 Returns information about whether a category supports Local Market listings
 for sellers subscribed to Local Market for Vehicles.
 
*/
NSString *const Trading_FeatureIDCodeType_LOCAL_MARKET_REGULAR_SUBSCRIPTION = @"LocalMarketRegularSubscription";

/**
 
 Returns information about whether a category supports Local Market listings
 for sellers with a premium Local Market subscription.
 
*/
NSString *const Trading_FeatureIDCodeType_LOCAL_MARKET_PREMIUM_SUBSCRIPTION = @"LocalMarketPremiumSubscription";

/**
 
 Returns information about whether a category supports Local Market listings
 for sellers without a Local Market subscription.
 
*/
NSString *const Trading_FeatureIDCodeType_LOCAL_MARKET_NON_SUBSCRIPTION = @"LocalMarketNonSubscription";

NSString *const Trading_FeatureIDCodeType_EXPRESS_ENABLED = @"ExpressEnabled";

NSString *const Trading_FeatureIDCodeType_EXPRESS_PICTURES_REQUIRED = @"ExpressPicturesRequired";

NSString *const Trading_FeatureIDCodeType_EXPRESS_CONDITION_REQUIRED = @"ExpressConditionRequired";

/**
 
 Returns information about whether a category allows seller-level
 contact information for Classified Ad listings.
 
*/
NSString *const Trading_FeatureIDCodeType_SELLER_CONTACT_DETAILS_ENABLED = @"SellerContactDetailsEnabled";

/**
 
 Reserved for internal or future use.
 
*/
NSString *const Trading_FeatureIDCodeType_CUSTOM_CODE = @"CustomCode";

/**
 
 Returns information about whether a category supports Minimum Reserve Price.
 
*/
NSString *const Trading_FeatureIDCodeType_MINIMUM_RESERVE_PRICE = @"MinimumReservePrice";

/**
 
 Returns information about whether a category supports the Transaction
 Confirmation Request feature.
 
*/
NSString *const Trading_FeatureIDCodeType_TRANSACTION_CONFIRMATION_REQUEST_ENABLED = @"TransactionConfirmationRequestEnabled";

/**
 
 Indicates whether the category supports Store Inventory Format.
 
*/
NSString *const Trading_FeatureIDCodeType_STORE_INVENTORY_ENABLED = @"StoreInventoryEnabled";

/**
 
 Returns information about the supported local listing distances for different
 levels of Local Market subscription.
 
*/
NSString *const Trading_FeatureIDCodeType_LOCAL_LISTING_DISTANCES = @"LocalListingDistances";

/**
 
 Returns information about whether a category supports the addition of Skype
 buttons to sale listings.
 
*/
NSString *const Trading_FeatureIDCodeType_SKYPE_ME_TRANSACTIONAL_ENABLED = @"SkypeMeTransactionalEnabled";

/**
 
 Returns information about whether a category supports the addition of Skype
 buttons to ad listings.
 
*/
NSString *const Trading_FeatureIDCodeType_SKYPE_ME_NON_TRANSACTIONAL_ENABLED = @"SkypeMeNonTransactionalEnabled";

/**
 
 Returns information about whether the payment method is displayed
 to the user for Classified Ad listings in a category.
 Even if payment method is displayed, checkout may or may not be enabled.
 
*/
NSString *const Trading_FeatureIDCodeType_CLASSIFIED_AD_PAYMENT_METHOD_ENABLED = @"ClassifiedAdPaymentMethodEnabled";

/**
 
 Returns information about whether shipping options are available for
 Classified Ad listings in this category.
 
*/
NSString *const Trading_FeatureIDCodeType_CLASSIFIED_AD_SHIPPING_METHOD_ENABLED = @"ClassifiedAdShippingMethodEnabled";

/**
 
 Returns information about whether Best Offer is enabled for Classified
 Ad listings.
 
*/
NSString *const Trading_FeatureIDCodeType_CLASSIFIED_AD_BEST_OFFER_ENABLED = @"ClassifiedAdBestOfferEnabled";

/**
 
 Returns information about whether counter offers are allowed on
 Classified Ad listings for a category.
 Returned only if this category overrides the site default.
 
*/
NSString *const Trading_FeatureIDCodeType_CLASSIFIED_AD_COUNTER_OFFER_ENABLED = @"ClassifiedAdCounterOfferEnabled";

/**
 
 Returns information about whether automatic decline for best
 offers are allowed for Classified Ad listings in a category.
 Returned only if this category overrides the site default.
 
*/
NSString *const Trading_FeatureIDCodeType_CLASSIFIED_AD_AUTO_DECLINE_ENABLED = @"ClassifiedAdAutoDeclineEnabled";

/**
 
 Returns information about whether a category supports including an email
 address in the seller's contact information.
 
*/
NSString *const Trading_FeatureIDCodeType_CLASSIFIED_AD_CONTACT_BY_EMAIL_ENABLED = @"ClassifiedAdContactByEmailEnabled";

/**
 
 Returns information about whether a category supports including a telephone
 number in the seller's contact information.
 
*/
NSString *const Trading_FeatureIDCodeType_CLASSIFIED_AD_CONTACT_BY_PHONE_ENABLED = @"ClassifiedAdContactByPhoneEnabled";

/**
 
 Returns information about whether a category requires
 a safe payment method. If a seller has a 'SafePaymentExempt'
 status (see GetUser), they are exempt from the requirement to offer at least
 one safe payment method when listing an item.
 
*/
NSString *const Trading_FeatureIDCodeType_SAFE_PAYMENT_REQUIRED = @"SafePaymentRequired";

/**
 
 Returns information about the number of Best Offers
 allowed for a non-Ad-Format-Listings buyer.
 
*/
NSString *const Trading_FeatureIDCodeType_MAXIMUM_BEST_OFFERS_ALLOWED = @"MaximumBestOffersAllowed";

/**
 
 Returns information about the number of Best Offers
 allowed for a Classified-Ad-Format-Listings buyer.
 
*/
NSString *const Trading_FeatureIDCodeType_CLASSIFIED_AD_MAXIMUM_BEST_OFFERS_ALLOWED = @"ClassifiedAdMaximumBestOffersAllowed";

/**
 
 Returns information about whether a category supports including an email
 address in the seller's contact information for classified-ad listings.
 
*/
NSString *const Trading_FeatureIDCodeType_CLASSIFIED_AD_CONTACT_BY_EMAIL_AVAILABLE = @"ClassifiedAdContactByEmailAvailable";

/**
 
 The pay-per-lead feature is no longer available, so this value is deprecated.
 
*/
NSString *const Trading_FeatureIDCodeType_CLASSIFIED_AD_PAY_PER_LEAD_ENABLED = @"ClassifiedAdPayPerLeadEnabled";

/**
 
 Returns information about whether categories support
 custom Item Specifics, and whether categories have been converted
 from the older ID-based attribute format to custom Item Specifics.
 (That is, this retrieves both ItemSpecificsEnabled and AttributeConversionEnabled settings.)
 
*/
NSString *const Trading_FeatureIDCodeType_ITEM_SPECIFICS_ENABLED = @"ItemSpecificsEnabled";

/**
 
 Returns information about whether PaisaPayEscrow payment method is enabled.
 
*/
NSString *const Trading_FeatureIDCodeType_PAISA_PAY_FULL_ESCROW_ENABLED = @"PaisaPayFullEscrowEnabled";

/**
 
 Returns information about whether a category supports the use of an ISBN to identify a product.
 
*/
NSString *const Trading_FeatureIDCodeType_ISBN_IDENTIFIER_ENABLED = @"ISBNIdentifierEnabled";

/**
 
 Returns information about whether a category supports the use of a UPC to identify a product.
 
*/
NSString *const Trading_FeatureIDCodeType_UPC_IDENTIFIER_ENABLED = @"UPCIdentifierEnabled";

/**
 
 Returns information about whether a category supports the use of an EAN identifier to identify a product.
 
*/
NSString *const Trading_FeatureIDCodeType_EAN_IDENTIFIER_ENABLED = @"EANIdentifierEnabled";

/**
 
 Returns information about whether a category supports the use of a BrandMPN identifier to identify a product.
 
*/
NSString *const Trading_FeatureIDCodeType_BRAND_MPN_IDENTIFIER_ENABLED = @"BrandMPNIdentifierEnabled";

/**
 
 Returns information about whether auto-accept for Best
 Offers is allowed for Classified Ad listings in this category.
 
*/
NSString *const Trading_FeatureIDCodeType_CLASSIFIED_AD_AUTO_ACCEPT_ENABLED = @"ClassifiedAdAutoAcceptEnabled";

/**
 
 Returns information about whether auto-accept for Best
 Offers is allowed for listings in a category.
 
*/
NSString *const Trading_FeatureIDCodeType_BEST_OFFER_AUTO_ACCEPT_ENABLED = @"BestOfferAutoAcceptEnabled";

/**
 
 Returns information about whether a category allows listings to
 be displayed in another site's default search results.
 
*/
NSString *const Trading_FeatureIDCodeType_CROSS_BORDER_TRADE_ENABLED = @"CrossBorderTradeEnabled";

/**
 
 On the Australia site, returns information about whether a category allows
 PayPal buyer protection.
 
*/
NSString *const Trading_FeatureIDCodeType_PAY_PAL_BUYER_PROTECTION_ENABLED = @"PayPalBuyerProtectionEnabled";

/**
 
 On the Australia site, returns information about whether a category allows
 PayPal buyer protection.
 
*/
NSString *const Trading_FeatureIDCodeType_BUYER_GUARANTEE_ENABLED = @"BuyerGuaranteeEnabled";

/**
 
 On the India site, returns information about the escrow workflow version
 applicable to the given category, if the category supports PaisaPayFullEscrow.
 
*/
NSString *const Trading_FeatureIDCodeType_IN_ESCROW_WORKFLOW_TIMELINE = @"INEscrowWorkflowTimeline";

/**
 
 Returns information about whether a category allows
 combined fixed price treatment of the following two listing types: Store
 Inventory Format and Basic Fixed Price.
 
*/
NSString *const Trading_FeatureIDCodeType_COMBINED_FIXED_PRICE_TREATMENT = @"CombinedFixedPriceTreatment";

/**
 
 Returns information about whether a category allows
 durations for "Gallery Featured".
 
*/
NSString *const Trading_FeatureIDCodeType_GALLERY_FEATURED_DURATIONS = @"GalleryFeaturedDurations";

/**
 
 Returns information about whether listings in a category
 require PayPal as a payment method.
 
*/
NSString *const Trading_FeatureIDCodeType_PAY_PAL_REQUIRED = @"PayPalRequired";

/**
 
 Indicates whether the category supports ad-format. Added for eBay Motors Pro users.
 
*/
NSString *const Trading_FeatureIDCodeType_E_BAY_MOTORS_PRO_AD_FORMAT_ENABLED = @"eBayMotorsProAdFormatEnabled";

/**
 
 Returns information about whether the telephone can be a contact method
 for the category. Added for eBay Motorss Pro users.
 
*/
NSString *const Trading_FeatureIDCodeType_E_BAY_MOTORS_PRO_CONTACT_BY_PHONE_ENABLED = @"eBayMotorsProContactByPhoneEnabled";

/**
 
 Returns information about whether a category supports including an address
 in the seller's contact information. Added for eBay Motors Pro users.
 
*/
NSString *const Trading_FeatureIDCodeType_E_BAY_MOTORS_PRO_CONTACT_BY_ADDRESS_ENABLED = @"eBayMotorsProContactByAddressEnabled";

/**
 
 Returns information about whether a category supports including a company
 name in the seller's contact information. Added for eBay Motors Pro users.
 
*/
NSString *const Trading_FeatureIDCodeType_E_BAY_MOTORS_PRO_COMPANY_NAME_ENABLED = @"eBayMotorsProCompanyNameEnabled";

/**
 
 Returns information about whether a category supports including an email
 address in the seller's contact information. Added for eBay Motors Pro users.
 
*/
NSString *const Trading_FeatureIDCodeType_E_BAY_MOTORS_PRO_CONTACT_BY_EMAIL_ENABLED = @"eBayMotorsProContactByEmailEnabled";

/**
 
 Returns information about whether a category supports Best Offers.
 Added for eBay Motors Pro users.
 
*/
NSString *const Trading_FeatureIDCodeType_E_BAY_MOTORS_PRO_BEST_OFFER_ENABLED = @"eBayMotorsProBestOfferEnabled";

/**
 
 Returns information about whether a category supports auto accept.
 Added for eBay Motors Pro users.
 
*/
NSString *const Trading_FeatureIDCodeType_E_BAY_MOTORS_PRO_AUTO_ACCEPT_ENABLED = @"eBayMotorsProAutoAcceptEnabled";

/**
 
 Returns information about whether a category supports auto decline.
 Added for eBay Motors Pro users.
 
*/
NSString *const Trading_FeatureIDCodeType_E_BAY_MOTORS_PRO_AUTO_DECLINE_ENABLED = @"eBayMotorsProAutoDeclineEnabled";

/**
 
 Returns information about whether a category supports payment method checkout.
 Added for eBay Motors Pro users.
 
*/
NSString *const Trading_FeatureIDCodeType_E_BAY_MOTORS_PRO_PAYMENT_METHOD_CHECK_OUT_ENABLED = @"eBayMotorsProPaymentMethodCheckOutEnabled";

/**
 
 Returns information about whether shipping options are available in the category.
 Added for eBay Motors Pro users.
 
*/
NSString *const Trading_FeatureIDCodeType_E_BAY_MOTORS_PRO_SHIPPING_METHOD_ENABLED = @"eBayMotorsProShippingMethodEnabled";

/**
 
 Returns information about whether counter offers are allowed for a category.
 Added for eBay Motors Pro users.
 
*/
NSString *const Trading_FeatureIDCodeType_E_BAY_MOTORS_PRO_COUNTER_OFFER_ENABLED = @"eBayMotorsProCounterOfferEnabled";

/**
 
 Returns information about whether a category allows seller-level
 contact information for Classified Ad listings. Added for eBay Motors Pro users.
 
*/
NSString *const Trading_FeatureIDCodeType_E_BAY_MOTORS_PRO_SELLER_CONTACT_DETAILS_ENABLED = @"eBayMotorsProSellerContactDetailsEnabled";

/**
 
 Indicates whether a category supports ad-format. Added for Local Market users.
 
*/
NSString *const Trading_FeatureIDCodeType_LOCAL_MARKET_AD_FORMAT_ENABLED = @"LocalMarketAdFormatEnabled";

/**
 
 Returns information about whether a category supports including a telephone
 number in the seller's contact information. Added for Local Market users.
 
*/
NSString *const Trading_FeatureIDCodeType_LOCAL_MARKET_CONTACT_BY_PHONE_ENABLED = @"LocalMarketContactByPhoneEnabled";

/**
 
 Returns information about whether a category supports including an address
 in the seller's contact information. Added for Local Market users.
 
*/
NSString *const Trading_FeatureIDCodeType_LOCAL_MARKET_CONTACT_BY_ADDRESS_ENABLED = @"LocalMarketContactByAddressEnabled";

/**
 
 Returns information about whether a category supports including a company
 name in the seller's contact information. Added for Local Market users.
 
*/
NSString *const Trading_FeatureIDCodeType_LOCAL_MARKET_COMPANY_NAME_ENABLED = @"LocalMarketCompanyNameEnabled";

/**
 
 Returns information about whether a category supports including an email
 address in the seller's contact information. Added for Local Market users.
 
*/
NSString *const Trading_FeatureIDCodeType_LOCAL_MARKET_CONTACT_BY_EMAIL_ENABLED = @"LocalMarketContactByEmailEnabled";

/**
 
 Returns information about whether a category supports Best Offers for
 Classified Ad listings. Added for Local Market users.
 
*/
NSString *const Trading_FeatureIDCodeType_LOCAL_MARKET_BEST_OFFER_ENABLED = @"LocalMarketBestOfferEnabled";

/**
 
 Returns information about whether a category supports auto accept.
 Added for Local Market users.
 
*/
NSString *const Trading_FeatureIDCodeType_LOCAL_MARKET_AUTO_ACCEPT_ENABLED = @"LocalMarketAutoAcceptEnabled";

/**
 
 Returns information about whether a category supports auto decline.
 Added for Local Market users.
 
*/
NSString *const Trading_FeatureIDCodeType_LOCAL_MARKET_AUTO_DECLINE_ENABLED = @"LocalMarketAutoDeclineEnabled";

/**
 
 Returns information about whether a category supports payment method checkout.
 Added for Local Market users.
 
*/
NSString *const Trading_FeatureIDCodeType_LOCAL_MARKET_PAYMENT_METHOD_CHECK_OUT_ENABLED = @"LocalMarketPaymentMethodCheckOutEnabled";

/**
 
 Returns information about whether shipping options are available for
  listings in a category. Added for Local Market users.
 
*/
NSString *const Trading_FeatureIDCodeType_LOCAL_MARKET_SHIPPING_METHOD_ENABLED = @"LocalMarketShippingMethodEnabled";

/**
 
 Returns information about whether counter offers are allowed for a category .
 Added for Local Market users.
 
*/
NSString *const Trading_FeatureIDCodeType_LOCAL_MARKET_COUNTER_OFFER_ENABLED = @"LocalMarketCounterOfferEnabled";

/**
 
 Returns information about whether a category allows seller-level
 contact information. Added for Local Market users.
 
*/
NSString *const Trading_FeatureIDCodeType_LOCAL_MARKET_SELLER_CONTACT_DETAILS_ENABLED = @"LocalMarketSellerContactDetailsEnabled";

/**
 
 Returns information about whether the contact by address is enabled.
 Added for For Sale By Owner.
 
*/
NSString *const Trading_FeatureIDCodeType_CLASSIFIED_AD_CONTACT_BY_ADDRESS_ENABLED = @"ClassifiedAdContactByAddressEnabled";

/**
 
 Returns information about whether a category supports including a company
 name in the seller's contact information. Added for For Sale By Owmer.
 
*/
NSString *const Trading_FeatureIDCodeType_CLASSIFIED_AD_COMPANY_NAME_ENABLED = @"ClassifiedAdCompanyNameEnabled";

/**
 
 Returns information about whether a category supports Local Market listings
 for sellers subscribed to Local Market for Specialty Vehicles. Added for
 subscription.
 
*/
NSString *const Trading_FeatureIDCodeType_SPECIALITY_SUBSCRIPTION = @"SpecialitySubscription";

/**
 
 Returns information about whether a category supports Local Market listings
 for sellers subscribed to Local Market for Vehicles. Added for subscription.
 
*/
NSString *const Trading_FeatureIDCodeType_REGULAR_SUBSCRIPTION = @"RegularSubscription";

/**
 
 Returns information about whether a category supports Local Market listings
 for sellers with a premium Local Market subscription. Added for subscription.
 
*/
NSString *const Trading_FeatureIDCodeType_PREMIUM_SUBSCRIPTION = @"PremiumSubscription";

/**
 
 Returns information about whether a category supports Local Market listings
 for sellers without a Local Market subscription. Added for subscription.
 
*/
NSString *const Trading_FeatureIDCodeType_NON_SUBSCRIPTION = @"NonSubscription";

/**
 
 Returns information about whether Intangible flag is set or not
 
*/
NSString *const Trading_FeatureIDCodeType_INTANGIBLE_ENABLED = @"IntangibleEnabled";

/**
 
 Defines if PayPal is required for Store Owners on fixed price listings (FixedPriceItem and StoresFixedPrice).
 
*/
NSString *const Trading_FeatureIDCodeType_PAY_PAL_REQUIRED_FOR_STORE_OWNER = @"PayPalRequiredForStoreOwner";

/**
 
 Defines if quantity can be revised while a listing is in semi or fully restricted mode.
 
*/
NSString *const Trading_FeatureIDCodeType_REVISE_QUANTITY_ALLOWED = @"ReviseQuantityAllowed";

/**
 
 Defines if price can be revised while a listing is in semi or fully restricted mode.
 
*/
NSString *const Trading_FeatureIDCodeType_REVISE_PRICE_ALLOWED = @"RevisePriceAllowed";

/**
 
 Defines if extended store owner listing durations are enabled on fixed price listings (FixedPriceItem and StoreFormatItems).
 
*/
NSString *const Trading_FeatureIDCodeType_STORE_OWNER_EXTENDED_LISTING_DURATIONS_ENABLED = @"StoreOwnerExtendedListingDurationsEnabled";

/**
 
 Provides additional listing durations that are supported by store owners.
 
*/
NSString *const Trading_FeatureIDCodeType_STORE_OWNER_EXTENDED_LISTING_DURATIONS = @"StoreOwnerExtendedListingDurations";

/**
 
 Defines if listings in a category support a return policy.
 
*/
NSString *const Trading_FeatureIDCodeType_RETURN_POLICY_ENABLED = @"ReturnPolicyEnabled";

/**
 
 Defines if listings require a handling time (dispatch time).
 The handling time is the maximum number of business days the seller
 commits to for preparing an item to be shipped after receiving a
 cleared payment. The seller's handling time does not include the
 shipping time (the carrier's transit time).
 
*/
NSString *const Trading_FeatureIDCodeType_HANDLING_TIME_ENABLED = @"HandlingTimeEnabled";

/**
 
 Returns information about applicable payment methods.
 
*/
NSString *const Trading_FeatureIDCodeType_PAYMENT_METHODS = @"PaymentMethods";

/**
 
 Returns elements related to the maximum cost the seller can charge for
 the first domestic flat rate shipping service for a category (or a
 combination of category and shipping service group).
 
*/
NSString *const Trading_FeatureIDCodeType_MAX_FLAT_SHIPPING_COST = @"MaxFlatShippingCost";

/**
 
 Specifies the default site setting for whether a maximum flat rate shipping cost
 is imposed on sellers who list in categories on this site yet are shipping an
 item into the country of this site from another country.
 
*/
NSString *const Trading_FeatureIDCodeType_MAX_FLAT_SHIPPING_COST_CBT_EXEMPT = @"MaxFlatShippingCostCBTExempt";

/**
 
 Returns the applicable max cap per shipping cost for shipping service group1.
 
*/
NSString *const Trading_FeatureIDCodeType_GROUP_1_MAX_FLAT_SHIPPING_COST = @"Group1MaxFlatShippingCost";

/**
 
 Returns the applicable max cap per shipping cost for shipping service group2.
 
*/
NSString *const Trading_FeatureIDCodeType_GROUP_2_MAX_FLAT_SHIPPING_COST = @"Group2MaxFlatShippingCost";

/**
 
 Returns the applicable max cap per shipping cost for shipping service group3.
 
*/
NSString *const Trading_FeatureIDCodeType_GROUP_3_MAX_FLAT_SHIPPING_COST = @"Group3MaxFlatShippingCost";

/**
 
 Returns settings that indicate which categories support
 multi-variation listings. Variations are items within
 the same listing that are logically the same product,
 but that vary in their manufacturing details or packaging.
 
*/
NSString *const Trading_FeatureIDCodeType_VARIATIONS_ENABLED = @"VariationsEnabled";

/**
 
 Not operational. Pass ItemSpecificsEnabled to
 retrieve AttributeConversionEnabled settings.
 
*/
NSString *const Trading_FeatureIDCodeType_ATTRIBUTE_CONVERSION_ENABLED = @"AttributeConversionEnabled";

/**
 
 Returns information about whether
 free, automatic upgrades to Gallery Plus
 occur a category.
 
*/
NSString *const Trading_FeatureIDCodeType_FREE_GALLERY_PLUS_ENABLED = @"FreeGalleryPlusEnabled";

/**
 
 Returns information about whether
 free, automatic upgrades to Picture Pack
 occur a category.
 
*/
NSString *const Trading_FeatureIDCodeType_FREE_PICTURE_PACK_ENABLED = @"FreePicturePackEnabled";

/**
 
 Returns whether parts compatibility is enabled for the given category and, if
 so, the mode of compatibility (by application or by specification).
 
*/
NSString *const Trading_FeatureIDCodeType_COMPATIBILITY_ENABLED = @"CompatibilityEnabled";

/**
 
 Returns the minimum number of compatible applications that must
 be specified when listing in the given category. This is relevant for
 specifying parts compatibility by application only.
 
*/
NSString *const Trading_FeatureIDCodeType_MIN_COMPATIBLE_APPLICATIONS = @"MinCompatibleApplications";

/**
 
 Returns the maximum number of compatible applications that can
 be specified when listing in the given category. This is relevant for
 specifying parts compatibility by application manually
 (<b class="con">Item.ItemCompatibilityList</b>) only.
 
*/
NSString *const Trading_FeatureIDCodeType_MAX_COMPATIBLE_APPLICATIONS = @"MaxCompatibleApplications";

/**
 
 Returns information about which categories support
 (or require) Item.ConditionID to specify
 an item's condition in listings.
 
*/
NSString *const Trading_FeatureIDCodeType_CONDITION_ENABLED = @"ConditionEnabled";

/**
 
 Returns information about the list of conditions
 that categories support (for categories that support
 Item.ConditionID in listings).
 
*/
NSString *const Trading_FeatureIDCodeType_CONDITION_VALUES = @"ConditionValues";

/**
 
 Returns information about which categories are designated as
 value categories. (If you list in a value category, you cannot
 specify a secondary category for your listing.)
 
*/
NSString *const Trading_FeatureIDCodeType_VALUE_CATEGORY = @"ValueCategory";

/**
 
 Returns information about which categories support
 (or require) product creation to list an item.
 
*/
NSString *const Trading_FeatureIDCodeType_PRODUCT_CREATION_ENABLED = @"ProductCreationEnabled";

/**
 
 Returns information about the maximum number of parts compatibilities at the
 lowest level of granularity that can be associated with a listing.
 
*/
NSString *const Trading_FeatureIDCodeType_MAX_GRANULAR_FITMENT_COUNT = @"MaxGranularFitmentCount";

/**
 
 Returns information to indicate which vehicle type, Cars and Trucks or
 Motorcycles, is supported by parts compatibility.
 
*/
NSString *const Trading_FeatureIDCodeType_COMPATIBLE_VEHICLE_TYPE = @"CompatibleVehicleType";

/**
 
 This value is passed into the <b>FeatureID</b> field of the
 <b>GetCategoryFeatures</b> request to see if the category supports
 the new eBay payment process. This feature is only applicable to DE or AT listings.
 
*/
NSString *const Trading_FeatureIDCodeType_PAYMENT_OPTIONS_GROUP = @"PaymentOptionsGroup";

/**
 
 This value is passed into the <b>FeatureID</b> field of the
 <b>GetCategoryFeatures</b> request to see if Business Policies shipping
 profiles are supported by the specified category.
 The <b>ShippingProfileCategoryGroup</b> field is not returned for
 categories that do not support Business Policies payment profiles.
 <br><br>
 <span class="tablenote"><strong>Note:</strong>
 Business Policies are not yet available for use on the eBay platform.
 </span>
 
*/
NSString *const Trading_FeatureIDCodeType_SHIPPING_PROFILE_CATEGORY_GROUP = @"ShippingProfileCategoryGroup";

/**
 
 This value is passed into the <b>FeatureID</b> field of the
 <b>GetCategoryFeatures</b> request to see if Business Policies payment
 profiles are supported by the specified category.
 The <b>PaymentProfileCategoryGroup</b> field is not returned for
 categories that do not support Business Policies payment profiles.
 <br><br>
 <span class="tablenote"><strong>Note:</strong>
 Business Policies are not yet available for use on the eBay platform.
 </span>
 
*/
NSString *const Trading_FeatureIDCodeType_PAYMENT_PROFILE_CATEGORY_GROUP = @"PaymentProfileCategoryGroup";

/**
 
 This value is passed into the <b>FeatureID</b> field of the <b>GetCategoryFeatures</b> request to see if Business Policies return policy profiles are supported by the specified category. The <b>PaymentProfileCategoryGroup</b> field is not returned for categories that do not support Business Policies return policy profiles.
 <br><br>
 <span class="tablenote"><strong>Note:</strong>
 Business Policies are not yet available for use on the eBay platform.
 </span>
 
*/
NSString *const Trading_FeatureIDCodeType_RETURN_POLICY_PROFILE_CATEGORY_GROUP = @"ReturnPolicyProfileCategoryGroup";

/**
 
 Returns information about whether a category supports
 Vehicle Identification Numbers (VIN) for
 US, CA, and CAFR eBay Motors listings.
 
*/
NSString *const Trading_FeatureIDCodeType_VIN_SUPPORTED = @"VINSupported";

/**
 
 Returns information about whether a category supports
 Vehicle Registration Marks (VRM) for UK eBay Motors listings.
 
*/
NSString *const Trading_FeatureIDCodeType_VRM_SUPPORTED = @"VRMSupported";

/**
 
 Returns information about whether a category supports
 custom titles for US or CA eBay Motors listings.
 
*/
NSString *const Trading_FeatureIDCodeType_SELLER_PROVIDED_TITLE_SUPPORTED = @"SellerProvidedTitleSupported";

/**
 
 Returns information about whether a category supports
 vehicle deposits for US eBay Motors listings.
 
*/
NSString *const Trading_FeatureIDCodeType_DEPOSIT_SUPPORTED = @"DepositSupported";

/**
 
 Pass this value in the <b>FeatureID</b> field of the <b>GetCategoryFeatures</b> request to determine if the the specified category is eligible for the Global Shipping Program. The <strong>GlobalShippingEnabled</strong> field is returned if items in the category can be shipped using the Global Shipping Program.
 
*/
NSString *const Trading_FeatureIDCodeType_GLOBAL_SHIPPING_ENABLED = @"GlobalShippingEnabled";
