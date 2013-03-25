//
//  PicoTestBase.h
//  picoTest
//
//  Created by bulldog on 13-2-27.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import <GHUnitIOS/GHUNit.h>
#import "PicoReadable.h"
#import "PicoWritable.h"
#import "PicoClassSchema.h"
#import "PicoPropertySchema.h"
#import "PicoConstants.h"
#import "PicoBindable.h"

@interface PicoTestBase : GHTestCase {
    id<PicoReadable> xmlReader;
	id<PicoWritable> xmlWriter;
}

@end
