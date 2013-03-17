//
//  PicoFormat.m
//  pico
//
//  Created by bulldog on 13-2-26.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoConfig.h"

NSString *const DEFAULT_XML_ENCODING = @"utf-8";

@implementation PicoConfig

static NSLocale *_locale = nil;

@synthesize indent = _indent, encoding = _encoding;

+ (void)initialize {
    if (!_locale) {
        _locale = [NSLocale currentLocale];
    }
}

- (id) init {
    return [self initWithIndent:YES];
}

- (id) initWithIndent:(BOOL)indent {
    return [self initWithIndentAndEncdoing:indent encoding:DEFAULT_XML_ENCODING];
}

- (id) initWithIndentAndEncdoing:(BOOL)indent encoding:(NSString *)encoding {
    self = [super init];
    if (self) {
        self.indent = indent;
        self.encoding = encoding;
    }
    
    return self;
}

+ (NSLocale *)getLocale {
    return _locale;
}
+ (void)setLocale:(NSLocale *)locale {
    _locale = locale;
}

-(void) dealloc {
    self.encoding = nil;
    [super dealloc];
}

@end
