//
//  PicoTestBase.m
//  picoTest
//
//  Created by bulldog on 13-2-27.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoTestBase.h"
#import "PicoXMLReader.h"
#import "PicoXMLWriter.h"


@implementation PicoTestBase

- (void) setUp {
    // Run at start of each test
	xmlReader = [[PicoXMLReader alloc] init];
	xmlWriter = [[PicoXMLWriter alloc] init];
}

- (void) tearDown {
    // Run at end of each test
	xmlReader = nil;
	xmlWriter = nil;
}

@end
