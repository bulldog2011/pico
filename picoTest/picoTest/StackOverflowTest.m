//
//  StackOverflowTest.m
//  picoTest
//
//  Created by bulldog on 13-2-28.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoTestBase.h"
#import "OrderedDictionary.h"

@interface StackOverflowTest : PicoTestBase

@end

@interface NewBenefit : NSObject <PicoBindable>
{
@private
	NSString *office;
	NSString *recordNumber;
	NSString *type;
}

@property (nonatomic, retain) NSString *office;
@property (nonatomic, retain) NSString *recordNumber;
@property (nonatomic, retain) NSString *type;

@end

@implementation NewBenefit

@synthesize office;
@synthesize recordNumber;
@synthesize type;

+(PicoClassSchema *)getClassMetaData {
	PicoClassSchema *cs = [[PicoClassSchema alloc] initWithXmlName: @"newBenefit" nsUri: nil];
	[cs autorelease];
	return cs;
}

+(NSMutableDictionary *)getPropertyMetaData {
	NSMutableDictionary *map = [OrderedDictionary dictionary];
	PicoPropertySchema *ps = nil;
	
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"office" propertyName:@"office" type:PICO_TYPE_STRING clazz:nil];
	[map setObject:ps forKey:@"office"];
	[ps release];
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"recordNumber" propertyName:@"recordNumber" type:PICO_TYPE_STRING clazz:nil];
	[map setObject:ps forKey:@"recordNumber"];
	[ps release];
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"type" propertyName:@"type" type:PICO_TYPE_STRING clazz:nil];
	[map setObject:ps forKey:@"type"];
	[ps release];
	
	return map;
}

-(void)dealloc {
	self.office = nil;
	self.recordNumber = nil;
	self.type = nil;
	[super dealloc];
}
@end

@interface BenefitMutation : NewBenefit <PicoBindable>
{
@private
	NSString *comment;
}

//+(EbayNs_ClassSchema *)getClassMetaData;
//+(NSMutableDictionary *)getPropertyMetaData;

@property (nonatomic, retain) NSString *comment;

@end

@implementation BenefitMutation

@synthesize comment;

+(PicoClassSchema *)getClassMetaData {
	PicoClassSchema *cs = [[PicoClassSchema alloc] initWithXmlName: @"benefitMutation" nsUri: nil];
	[cs autorelease];
	return cs;
}

+(NSMutableDictionary *)getPropertyMetaData {
	NSMutableDictionary *map = [OrderedDictionary dictionary];
	PicoPropertySchema *ps = nil;
	
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"comment" propertyName:@"comment" type:PICO_TYPE_STRING clazz:nil];
	[map setObject:ps forKey:@"comment"];
	[ps release];
	
	return map;
}

-(void)dealloc {
	self.comment = nil;
	[super dealloc];
}
@end

@interface Delivery : NSObject <PicoBindable>
{
@private
	NSArray *listNewBenefit;
	NSArray *listBenefitMutation;
}

@property (nonatomic, retain) NSArray *listNewBenefit;
@property (nonatomic, retain) NSArray *listBenefitMutation;

@end

@implementation Delivery

@synthesize listNewBenefit;
@synthesize listBenefitMutation;


+(PicoClassSchema *)getClassMetaData {
	PicoClassSchema *cs = [[PicoClassSchema alloc] initWithXmlName: @"delivery" nsUri: nil];
	[cs autorelease];
	return cs;
}

+(NSMutableDictionary *)getPropertyMetaData {
	NSMutableDictionary *map = [OrderedDictionary dictionary];
	PicoPropertySchema *ps = nil;
	
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT_ARRAY xmlName:@"newBenefit" propertyName:@"listNewBenefit" type:PICO_TYPE_OBJECT clazz:[NewBenefit class]];
	[map setObject:ps forKey:@"listNewBenefit"];
	[ps release];
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT_ARRAY xmlName:@"benefitMutation" propertyName:@"listBenefitMutation" type:PICO_TYPE_OBJECT clazz:[BenefitMutation class]];
	[map setObject:ps forKey:@"listBenefitMutation"];
	[ps release];
	
	return map;
}

-(void)dealloc {
	self.listNewBenefit = nil;
	self.listBenefitMutation = nil;
	[super dealloc];
}
@end

@implementation StackOverflowTest

static const int ITERATIONS = 1000; // must >= 4

static NSString * const NEW_BENEFIT =
    @"<newBenefit>\
        <office>AAAAA</office>\
        <recordNumber>1046</recordNumber>\
        <type>A</type>\
    </newBenefit>";

static NSString * const BENEFIT_MUTATION =
    @"<benefitMutation>\
        <office>AAAAA</office>\
        <recordNumber>1046</recordNumber>\
        <type>A</type>\
        <comment>comment</comment>\
    </benefitMutation>";

-(void)testStackOverflow {
	NSMutableString *builder = [NSMutableString string];
	[builder setString:@"<delivery>"];
	
	BOOL isNewBenefit = true;
	for(int i = 0; i < ITERATIONS; i++) {
		
		if(isNewBenefit) {
			[builder appendString:NEW_BENEFIT];
		} else {
			[builder appendString:BENEFIT_MUTATION];
		}
		isNewBenefit = !isNewBenefit;
	}
	[builder appendString:@"</delivery>"];
	
	NSData *xmlData = [builder dataUsingEncoding: NSUTF8StringEncoding];
	
	Delivery *delivery = [xmlReader fromData:xmlData withClass:[Delivery class]];
	
	GHAssertTrue([delivery.listNewBenefit count] + [delivery.listBenefitMutation count] == ITERATIONS, nil);
	NewBenefit *nb = [delivery.listNewBenefit objectAtIndex:0];
	GHAssertEqualStrings(nb.office, @"AAAAA", nil);
	GHAssertEqualStrings(nb.recordNumber, @"1046", nil);
	GHAssertEqualStrings(nb.type, @"A", nil);
	BenefitMutation *bm = [delivery.listBenefitMutation objectAtIndex:0];
	GHAssertEqualStrings(bm.office, @"AAAAA", nil);
	GHAssertEqualStrings(bm.recordNumber, @"1046", nil);
	GHAssertEqualStrings(bm.type, @"A", nil);
	GHAssertEqualStrings(bm.comment, @"comment", nil);
	
	nb = [delivery.listNewBenefit objectAtIndex:1];
	GHAssertEqualStrings(nb.office, @"AAAAA", nil);
	GHAssertEqualStrings(nb.recordNumber, @"1046", nil);
	GHAssertEqualStrings(nb.type, @"A", nil);
	bm = [delivery.listBenefitMutation objectAtIndex:1];
	GHAssertEqualStrings(bm.office, @"AAAAA", nil);
	GHAssertEqualStrings(bm.recordNumber, @"1046", nil);
	GHAssertEqualStrings(bm.type, @"A", nil);
	GHAssertEqualStrings(bm.comment, @"comment", nil);
}

@end
