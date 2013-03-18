// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "Trading_SetSellingManagerTemplateAutomationRuleRequestType.h"
#import "Trading_SellingManagerAutoSecondChanceOfferType.h"
#import "Trading_SellingManagerAutoRelistType.h"
#import "Trading_SellingManagerAutoListType.h"

@implementation Trading_SetSellingManagerTemplateAutomationRuleRequestType

@synthesize saleTemplateID = _saleTemplateID;
@synthesize automatedListingRule = _automatedListingRule;
@synthesize automatedRelistingRule = _automatedRelistingRule;
@synthesize automatedSecondChanceOfferRule = _automatedSecondChanceOfferRule;

// class meta-data method
// note: this method is only for internal use, DO NOT CHANGE!
+(PicoClassSchema *)getClassMetaData {
    PicoClassSchema *cs = [[PicoClassSchema alloc] initWithXmlName:@"SetSellingManagerTemplateAutomationRuleRequest" nsUri:@"urn:ebay:apis:eBLBaseComponents"];
    [cs autorelease];
    return cs;
}

// property meta-data method
// note: this method is only for internal use, DO NOT CHANGE!
+(NSMutableDictionary *)getPropertyMetaData {
    NSMutableDictionary *map = [NSMutableDictionary dictionary];
    
    PicoPropertySchema *ps = nil;
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"SaleTemplateID" propertyName:@"saleTemplateID" type:PICO_TYPE_LONG clazz:nil];
    [map setObject:ps forKey:@"saleTemplateID"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"AutomatedListingRule" propertyName:@"automatedListingRule" type:PICO_TYPE_OBJECT clazz:[Trading_SellingManagerAutoListType class]];
    [map setObject:ps forKey:@"automatedListingRule"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"AutomatedRelistingRule" propertyName:@"automatedRelistingRule" type:PICO_TYPE_OBJECT clazz:[Trading_SellingManagerAutoRelistType class]];
    [map setObject:ps forKey:@"automatedRelistingRule"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"AutomatedSecondChanceOfferRule" propertyName:@"automatedSecondChanceOfferRule" type:PICO_TYPE_OBJECT clazz:[Trading_SellingManagerAutoSecondChanceOfferType class]];
    [map setObject:ps forKey:@"automatedSecondChanceOfferRule"];
    [ps release];
    
    return map;
}



-(void)dealloc {
    self.saleTemplateID = nil;
    self.automatedListingRule = nil;
    self.automatedRelistingRule = nil;
    self.automatedSecondChanceOfferRule = nil;
    [super dealloc];
}

@end
