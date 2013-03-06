//
//  UnicodeTest.m
//  picoTest
//
//  Created by bulldog on 13-2-28.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoTestBase.h"

@interface Unicode : NSObject <PicoBindable>
{
@private
	NSString *origin;
	NSString *text;
	NSString *name;
}

@property (nonatomic, retain) NSString *origin;
@property (nonatomic, retain) NSString *text;
@property (nonatomic, retain) NSString *name;

@end

@implementation Unicode

@synthesize origin;
@synthesize text;
@synthesize name;

+(PicoClassSchema *)getClassMetaData {
	PicoClassSchema *cs = [[PicoClassSchema alloc] initWithXmlName: @"unicode" nsUri: nil];
	[cs autorelease];
	return cs;
}

+(NSMutableDictionary *)getPropertyMetaData {
	NSMutableDictionary *map = [NSMutableDictionary dictionary];
	PicoPropertySchema *ps = nil;
	
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ATTRIBUTE xmlName:@"origin" propertyName:@"origin" type:PICO_TYPE_STRING clazz:nil];
	[map setObject:ps forKey:@"origin"];
	[ps release];
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"text" propertyName:@"text" type:PICO_TYPE_STRING clazz:nil];
	[map setObject:ps forKey:@"text"];
	[ps release];
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ATTRIBUTE xmlName:@"name" propertyName:@"name" type:PICO_TYPE_STRING clazz:nil];
	[map setObject:ps forKey:@"name"];
	[ps release];
	
	return map;
}

-(void)dealloc {
	self.origin = nil;
	self.text = nil;
	self.name = nil;
	[super dealloc];
}
@end

@interface UnicodeExample : NSObject <PicoBindable>
{
@private
	NSArray *list;
}

@property (nonatomic, retain) NSArray *list;

@end

@implementation UnicodeExample

@synthesize list;

+(PicoClassSchema *)getClassMetaData {
	PicoClassSchema *cs = [[PicoClassSchema alloc] initWithXmlName: @"example" nsUri: nil];
	[cs autorelease];
	return cs;
}

+(NSMutableDictionary *)getPropertyMetaData {
	NSMutableDictionary *map = [NSMutableDictionary dictionary];
	PicoPropertySchema *ps = nil;
	
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT_ARRAY xmlName:@"unicode" propertyName:@"list" type:PICO_TYPE_OBJECT clazz:[Unicode class]];
	[map setObject:ps forKey:@"list"];
	[ps release];
	
	return map;
}

-(Unicode *)getWithName:(NSString *)name {
	for(Unicode *unicode in list) {
		if ([name isEqualToString: unicode.name]) {
			return unicode;

        }
    }
    return nil;
}

-(void)dealloc {
	self.list = nil;
	[super dealloc];
}
@end


@interface UnicodeTest : PicoTestBase

@end

@implementation UnicodeTest


static const NSString *SOURCE =
@"<?xml version='1.0' encoding='UTF-8'?>\
<example>\
    <unicode origin=\"China\" name=\"Tony Zhou\">\
        <text>托尼周</text>\
    </unicode>\
</example>";
            
-(BOOL)isUnicode:(UnicodeExample *)example {
    if(![[example getWithName:@"Tony Zhou"].text isEqualToString:@"托尼周"]) return NO;
    return YES;
}

-(void)assertUnicode:(UnicodeExample *)example {
    GHAssertTrue([self isUnicode:example], @"Data was not unicode");
}

-(void)testUnicode {
    NSData *xmlData = [SOURCE dataUsingEncoding: NSUTF8StringEncoding];
    
    UnicodeExample *ue = [xmlReader fromData:xmlData withClass:[UnicodeExample class]];
    
    [self assertUnicode:ue];
    
    xmlData = [xmlWriter toData:ue];
    
    NSString *xmlString = [[[NSString alloc] initWithData:xmlData encoding:NSUTF8StringEncoding] autorelease];
    
    GHTestLog(@"write result : %@", xmlString);
    
    ue = [xmlReader fromData:xmlData withClass:[UnicodeExample class]];
    
    [self assertUnicode:ue];
    
}

@end
