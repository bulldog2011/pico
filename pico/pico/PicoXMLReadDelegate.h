//
//  PicoXMLReadDelegate.h
//  pico
//
//  Created by bulldog on 13-2-26.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoXMLReadHelper.h"

/*
#ifndef __IPHONE_4_0
@protocol NSXMLParserDelegate
@end
#endif
*/
 
@interface PicoXMLReadDelegate : NSObject<NSXMLParserDelegate> {
@private
    PicoXMLReadHelper *_helper;
}
@property (nonatomic, retain) PicoXMLReadHelper *helper;

- (id) initWithHelper:(PicoXMLReadHelper *) helper;

@end
