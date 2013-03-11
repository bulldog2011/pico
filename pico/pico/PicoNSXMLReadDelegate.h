//
//  PicoNSXMLReadDelegate.h
//  pico
//
//  Created by bulldog on 13-2-26.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoNSXMLReadHelper.h"

/*
#ifndef __IPHONE_4_0
@protocol NSXMLParserDelegate
@end
#endif
*/
 
@interface PicoNSXMLReadDelegate : NSObject<NSXMLParserDelegate> {
@private
    PicoNSXMLReadHelper *_helper;
}
@property (nonatomic, retain) PicoNSXMLReadHelper *helper;

- (id) initWithHelper:(PicoNSXMLReadHelper *) helper;

@end
