//
//  PicoFormat.m
//  pico
//
//  Created by bulldog on 13-2-26.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoConfig.h"

NSString *const DEFAULT_XML_ENCODING = @"UTF-8";

@implementation PicoConfig

@synthesize indent = _indent, encoding = _encoding, locale = _locale, timeZone = _tiemZone;
@synthesize numberFormatter = _numberFormatter, dateFormatter = _dateFormatter;

- (id) init {
    self = [super init];
    if (self) {
        self.indent = YES;
        self.encoding = DEFAULT_XML_ENCODING;
        self.locale = [NSLocale currentLocale];
        _numberFormatter = [[NSNumberFormatter alloc] init];
        _numberFormatter.locale = self.locale;
        
        self.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
        
        _dateFormatter = [[NSDateFormatter alloc] init];
        [_dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"];
        [_dateFormatter setTimeZone:_tiemZone];
    }
    
    return self;
}

-(void) dealloc {
    self.encoding = nil;
    self.locale = nil;
    self.numberFormatter = nil;
    self.timeZone = nil;
    self.dateFormatter = nil;
    [super dealloc];
}

@end
