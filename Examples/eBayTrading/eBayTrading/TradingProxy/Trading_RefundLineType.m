// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "Trading_RefundLineType.h"

@implementation Trading_RefundLineType

@synthesize type = _type;

// class meta-data method
// note: this method is only for internal use, DO NOT CHANGE!
+(PicoClassSchema *)getClassMetaData {
    return nil;
}

// property meta-data method
// note: this method is only for internal use, DO NOT CHANGE!
+(NSMutableDictionary *)getPropertyMetaData {
    NSMutableDictionary *map = [NSMutableDictionary dictionary];
    
    PicoPropertySchema *ps = nil;
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ATTRIBUTE xmlName:@"type" propertyName:@"type" type:PICO_TYPE_ENUM clazz:nil];
    [map setObject:ps forKey:@"type"];
    [ps release];
    
    return map;
}



-(void)dealloc {
    self.type = nil;
    [super dealloc];
}

@end
