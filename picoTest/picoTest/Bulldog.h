//
//  Bulldog.h
//  picoTest
//
//  Created by bulldog on 13-2-25.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoBindable.h"

@interface Bulldog : NSObject <PicoBindable> {

@private
    NSString *name;
    NSNumber *age;
    NSString *color;
    NSString *desc;
    NSMutableArray *children;
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSNumber *age;
@property (nonatomic, retain) NSString *color;
@property (nonatomic, retain) NSString *desc;
@property (nonatomic, retain) NSMutableArray *children;

@end
