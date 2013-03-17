//
//  PicoFormat.h
//  pico
//
//  Created by bulldog on 13-2-26.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

extern NSString *const DEFAULT_XML_ENCODING;

@interface PicoConfig : NSObject {
@private
    NSString *_encoding;
    BOOL _indent;
}

@property (nonatomic, retain) NSString *encoding;
@property (nonatomic, assign) BOOL indent;

- (id) initWithIndent:(BOOL)indent;
- (id) initWithIndentAndEncdoing:(BOOL)indent encoding:(NSString *)encoding;

+ (NSLocale *)getLocale;
+ (void)setLocale:(NSLocale *)locale;

@end
