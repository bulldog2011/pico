// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "Trading_PictureDetailsType.h"

@implementation Trading_PictureDetailsType

@synthesize galleryType = _galleryType;
@synthesize galleryURL = _galleryURL;
@synthesize photoDisplay = _photoDisplay;
@synthesize pictureURL = _pictureURL;
@synthesize pictureSource = _pictureSource;
@synthesize galleryDuration = _galleryDuration;
@synthesize galleryStatus = _galleryStatus;
@synthesize galleryErrorInfo = _galleryErrorInfo;
@synthesize externalPictureURL = _externalPictureURL;
@synthesize any = _any;

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
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"GalleryType" propertyName:@"galleryType" type:PICO_TYPE_ENUM clazz:nil];
    [map setObject:ps forKey:@"galleryType"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"GalleryURL" propertyName:@"galleryURL" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"galleryURL"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"PhotoDisplay" propertyName:@"photoDisplay" type:PICO_TYPE_ENUM clazz:nil];
    [map setObject:ps forKey:@"photoDisplay"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT_ARRAY xmlName:@"PictureURL" propertyName:@"pictureURL" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"pictureURL"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"PictureSource" propertyName:@"pictureSource" type:PICO_TYPE_ENUM clazz:nil];
    [map setObject:ps forKey:@"pictureSource"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"GalleryDuration" propertyName:@"galleryDuration" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"galleryDuration"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"GalleryStatus" propertyName:@"galleryStatus" type:PICO_TYPE_ENUM clazz:nil];
    [map setObject:ps forKey:@"galleryStatus"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"GalleryErrorInfo" propertyName:@"galleryErrorInfo" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"galleryErrorInfo"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT_ARRAY xmlName:@"ExternalPictureURL" propertyName:@"externalPictureURL" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"externalPictureURL"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ANY_ELEMENT xmlName:@"any" propertyName:@"any" type:PICO_TYPE_ANYELEMENT clazz:nil];
    [map setObject:ps forKey:@"any"];
    [ps release];
    
    return map;
}



-(void)dealloc {
    self.galleryType = nil;
    self.galleryURL = nil;
    self.photoDisplay = nil;
    self.pictureURL = nil;
    self.pictureSource = nil;
    self.galleryDuration = nil;
    self.galleryStatus = nil;
    self.galleryErrorInfo = nil;
    self.externalPictureURL = nil;
    self.any = nil;
    [super dealloc];
}

@end
