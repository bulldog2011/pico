//
//  PicoXMLReader.h
//  Pico
//
//  Created by bulldog on 13-3-11.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoReadable.h"
#import "PicoConfig.h"

@class PicoConfig;
@class GDataXMLElement;
@interface PicoXMLReader : NSObject <PicoReadable> {
@private
    PicoConfig *_config;
    
}

@property (nonatomic, retain) PicoConfig *config;

- (id) initWithConfig:(PicoConfig *)config;

@end
