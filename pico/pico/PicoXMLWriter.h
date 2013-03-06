//
//  PicoXMLWriter.h
//  pico
//
//  Created by bulldog on 13-2-26.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoWritable.h"

@class PicoConfig;
@interface PicoXMLWriter : NSObject <PicoWritable> {
@private
    PicoConfig *_config;
    int _autoPrefixCount;
}

@property (nonatomic, retain) PicoConfig *config;

- (id) initWithConfig:(PicoConfig *)config;

@end
