// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "Trading_ExtendSiteHostedPicturesResponseType.h"

@implementation Trading_ExtendSiteHostedPicturesResponseType

@synthesize pictureURL = _pictureURL;

// class meta-data method
// note: this method is only for internal use, DO NOT CHANGE!
+(PicoClassSchema *)getClassMetaData {
    PicoClassSchema *cs = [[PicoClassSchema alloc] initWithXmlName:@"ExtendSiteHostedPicturesResponse" nsUri:@"urn:ebay:apis:eBLBaseComponents"];
    [cs autorelease];
    return cs;
}

// property meta-data method
// note: this method is only for internal use, DO NOT CHANGE!
+(NSMutableDictionary *)getPropertyMetaData {
    NSMutableDictionary *map = [NSMutableDictionary dictionary];
    
    PicoPropertySchema *ps = nil;
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT_ARRAY xmlName:@"PictureURL" propertyName:@"pictureURL" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"pictureURL"];
    [ps release];
    
    return map;
}



-(void)dealloc {
    self.pictureURL = nil;
    [super dealloc];
}

@end
