// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "Trading_DeleteSellingManagerTemplateResponseType.h"

@implementation Trading_DeleteSellingManagerTemplateResponseType

@synthesize deletedSaleTemplateID = _deletedSaleTemplateID;
@synthesize deletedSaleTemplateName = _deletedSaleTemplateName;

// class meta-data method
// note: this method is only for internal use, DO NOT CHANGE!
+(PicoClassSchema *)getClassMetaData {
    PicoClassSchema *cs = [[PicoClassSchema alloc] initWithXmlName:@"DeleteSellingManagerTemplateResponse" nsUri:@"urn:ebay:apis:eBLBaseComponents"];
    [cs autorelease];
    return cs;
}

// property meta-data method
// note: this method is only for internal use, DO NOT CHANGE!
+(NSMutableDictionary *)getPropertyMetaData {
    NSMutableDictionary *map = [NSMutableDictionary dictionary];
    
    PicoPropertySchema *ps = nil;
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"DeletedSaleTemplateID" propertyName:@"deletedSaleTemplateID" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"deletedSaleTemplateID"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"DeletedSaleTemplateName" propertyName:@"deletedSaleTemplateName" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"deletedSaleTemplateName"];
    [ps release];
    
    return map;
}



-(void)dealloc {
    self.deletedSaleTemplateID = nil;
    self.deletedSaleTemplateName = nil;
    [super dealloc];
}

@end
