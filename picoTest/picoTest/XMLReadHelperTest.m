//
//  XmlReadHelperTest.m
//  picoTest
//
//  Created by bulldog on 13-2-27.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import <GHUnitIOS/GHUNit.h>
#import "PicoNSXMLReadHelper.h"


@interface XMLReadHelperTest : GHTestCase

@end

@implementation XMLReadHelperTest

- (void) testDepth {
	PicoNSXMLReadHelper* helper = [[PicoNSXMLReadHelper alloc] init];
	GHAssertTrue(helper.depth == 0, nil);
	helper.depth++;
	GHAssertTrue(helper.depth == 1, nil);
	helper.depth--;
	GHAssertTrue(helper.depth == 0, nil);
	[helper release];
}

- (void) testIsRoot {
	PicoNSXMLReadHelper* helper = [[PicoNSXMLReadHelper alloc] init];
	GHAssertFalse([helper isRoot], nil);
	
	helper.depth++;
	GHAssertFalse([helper isRoot], nil);
	
	[helper push:@"element1"];
	helper.depth++;
	GHAssertFalse([helper isRoot], nil);
	
	helper.depth--;
	GHAssertTrue([helper isRoot], nil);
	
	[helper push:@"element2"];
	[helper release];
}

- (void) testPop {
	PicoNSXMLReadHelper* helper = [[PicoNSXMLReadHelper alloc] init];
	[helper push:@"element1"];
	[helper push:@"element2"];
	
	GHAssertTrue(helper.size == 2, nil);
	[helper pop];
	GHAssertTrue(helper.size == 1, nil);
	[helper pop];
	GHAssertTrue(helper.size == 0, nil);
	
    @try {
        [helper pop];
        GHAssertFalse(true, @"flow should not get here");
    } @catch (NSException *nse) {
        //should exception
		GHAssertTrue(nse != nil, nil);
    }

	
	[helper release];
}

- (void) testPeek {
	PicoNSXMLReadHelper* helper = [[PicoNSXMLReadHelper alloc] init];
	@try {
		[helper peek];
		GHFail(@"should not goto here");
	}
	@catch (NSException * e) {
		//should throw exception
		GHAssertTrue(e != nil, nil);
	}
	
	[helper push:@"element1"];
	GHAssertEqualStrings(@"element1", [helper peek], nil);
	
	[helper push:@"element2"];
	GHAssertEqualStrings(@"element2", [helper peek], nil);
	
	[helper release];
}

- (void) testPush {
	PicoNSXMLReadHelper* helper = [[PicoNSXMLReadHelper alloc] init];
	
	[helper push:@"element1"];
	GHAssertEqualStrings(@"element1", [helper peek], nil);
	GHAssertTrue(1 == [helper size], nil);
	
	[helper push:@"element2"];
	GHAssertEqualStrings(@"element2", [helper peek], nil);
	GHAssertTrue(2 == [helper size], nil);
	
	[helper release];
}

- (void) testSize {
	PicoNSXMLReadHelper* helper = [[PicoNSXMLReadHelper alloc] init];
	
	GHAssertTrue(0 == [helper size], nil);
	
	[helper push:@"element1"];
	GHAssertTrue(1 == [helper size], nil);
	
	[helper push:@"element2"];
	GHAssertTrue(2 == [helper size], nil);
	
	[helper pop];
	GHAssertTrue(1 == [helper size], nil);
	
	[helper pop];
	GHAssertTrue(0 == [helper size], nil);
	
	[helper release];
}

@end
