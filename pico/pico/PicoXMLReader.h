//
//  PicoXMLReader.h
//  pico
//
//  Created by bulldog on 13-2-26.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoReadable.h"


@class PicoConfig;
@interface PicoXMLReader : NSObject <PicoReadable> {
@private
    PicoConfig *_config;
    
}


@property (nonatomic, retain) PicoConfig *config;

- (id) initWithConfig:(PicoConfig *)config;

@end
