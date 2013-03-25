//
//  PicoTest.m
//  picoTest
//
//  Created by bulldog on 13-2-24.
//  Copyright (c) 2013 bulldog. All rights reserved.
//

#import <GHUnitIOS/GHUNit.h>
#import "PicoClassSchema.h"
#import "PicoPropertySchema.h"
#import "PicoConstants.h"

@interface PicoTest : GHTestCase

@end

@implementation PicoTest

- (void)testClassSchema {
    GHTestLog(@"Begin to test EbayNs_ClassSchema");
	
	PicoClassSchema *classSchema = [[PicoClassSchema alloc] init];
	
	classSchema.xmlName = @"test xml name";
	[classSchema setNsURI:@"test ns uri"];
	
	
	GHAssertEqualStrings(classSchema.xmlName, @"test xml name", @"xml name does not equal");
	GHAssertEqualStrings(classSchema.nsURI, @"test ns uri", @"ns uri does not equal");
	
	[classSchema release];
}

- (void)testPropertySchema {
    GHTestLog(@"Begin to test EbayNs_PropertySchema");
	
	PicoPropertySchema *propertySchema = [[PicoPropertySchema alloc] init];
	
	propertySchema.propertyKind = PICO_KIND_ELEMENT;
	propertySchema.xmlName = @"test xml name";
	propertySchema.propertyName = @"test property name";
	propertySchema.propertyType = PICO_TYPE_OBJECT;
	propertySchema.clazz = [PicoTest class];
	
	GHAssertEqualStrings(propertySchema.propertyKind, PICO_KIND_ELEMENT, nil);
	GHAssertEqualStrings(propertySchema.xmlName, @"test xml name", nil);
	GHAssertEqualStrings(propertySchema.propertyName, @"test property name", nil);
	GHAssertEqualStrings(propertySchema.propertyType, PICO_TYPE_OBJECT, nil);
	GHAssertEquals(propertySchema.clazz, [PicoTest class], nil);
	
	[propertySchema release];
	
}

@end
