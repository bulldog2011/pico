//
//  PicoPropertySchema.m
//  Pico
//
//  Created by bulldog on 13-2-24.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoPropertySchema.h"

@implementation PicoPropertySchema

@synthesize propertyKind = _propertyKind;
@synthesize xmlName = _xmlName;
@synthesize propertyName = _propertyName;
@synthesize propertyType = _propertyType;
@synthesize clazz = _clazz;

-(id)initWithKind:(NSString *)pKind xmlName:(NSString *)xName propertyName:(NSString *)proName type:(NSString *)pType clazz:(Class)clz {
    
    self = [super init];
    if (self) {
        self.propertyKind = pKind;
        self.xmlName = xName;
        self.propertyName = proName;
        self.propertyType = pType;
        self.clazz = clz;
    }
    return self;
}

-(void)dealloc {
	self.propertyKind = nil;
	self.xmlName = nil;
	self.propertyName = nil;
	self.propertyType= nil;
	self.clazz = nil;
	[super dealloc];
}

@end
