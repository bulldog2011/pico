//
//  TimeLeft.h
//  eBayDemoApp
//
//  Created by bulldog on 13-3-24.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

/**
    Time left on a bid
 
    This object parses the timeLeft string returned by eBay's APIs.
 */
@interface ISODuration : NSObject

@property (nonatomic, readonly) unsigned int days;
@property (nonatomic, readonly) unsigned int hours;
@property (nonatomic, readonly) unsigned int minutes;
@property (nonatomic, readonly) unsigned int seconds;

/// Returns a TimeLeft object initialized by parsing the given ISO-8601 duration
- (id)initWithISODurationString:(NSString *)duration;

/// Returns a string representation of the two highest units
- (NSString *)shortString;

/// Returns YES if time has ended
- (BOOL)hasEnded;

/// Returns YES if time left is a minute or less, but not yet ended
- (BOOL)isEndingSoon;

/// Normally black, returns red if time is ending soon
- (UIColor *)textColor;

@end
