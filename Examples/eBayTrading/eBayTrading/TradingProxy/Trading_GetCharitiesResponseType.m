// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "Trading_GetCharitiesResponseType.h"
#import "Trading_CharityInfoType.h"

@implementation Trading_GetCharitiesResponseType

@synthesize charity = _charity;

// class meta-data method
// note: this method is only for internal use, DO NOT CHANGE!
+(PicoClassSchema *)getClassMetaData {
    PicoClassSchema *cs = [[PicoClassSchema alloc] initWithXmlName:@"GetCharitiesResponse" nsUri:@"urn:ebay:apis:eBLBaseComponents"];
    [cs autorelease];
    return cs;
}

// property meta-data method
// note: this method is only for internal use, DO NOT CHANGE!
+(NSMutableDictionary *)getPropertyMetaData {
    NSMutableDictionary *map = [NSMutableDictionary dictionary];
    
    PicoPropertySchema *ps = nil;
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT_ARRAY xmlName:@"Charity" propertyName:@"charity" type:PICO_TYPE_OBJECT clazz:[Trading_CharityInfoType class]];
    [map setObject:ps forKey:@"charity"];
    [ps release];
    
    return map;
}



-(void)dealloc {
    self.charity = nil;
    [super dealloc];
}

@end
