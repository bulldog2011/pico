//
//  TimeLeft.m
//  eBayDemoApp
//
//  Created by bulldog on 13-3-24.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

#import "Duration.h"


@implementation ISODuration

@synthesize days;
@synthesize hours;
@synthesize minutes;
@synthesize seconds;


- (id)initWithISODurationString:(NSString *)duration;
{
    self = [super init];
    if (self != nil)
    {
        // Split duration into days/time components
        NSRange marker = [duration rangeOfString:@"T"];
        NSRange daysRange = NSMakeRange(1, marker.location - 1);    // Skip past leading "P"
        NSRange timeRange = NSMakeRange(marker.location + 1, [duration length] - (marker.location + 1));
        NSString *daysComponents = [duration substringWithRange:daysRange];
        NSString *timeComponents = [duration substringWithRange:timeRange];
        
        // Parse days components
        
        marker = [daysComponents rangeOfString:@"D"];
        if (marker.length > 0)
        {
            daysRange = NSMakeRange(0, marker.location);
            days = [[daysComponents substringWithRange:daysRange] intValue];
        }
        
        // Parse time components
        
        NSUInteger scanFrom = 0;
        
        marker = [timeComponents rangeOfString:@"H"];
        if (marker.length > 0)
        {
            timeRange = NSMakeRange(scanFrom, marker.location - scanFrom);
            hours = [[timeComponents substringWithRange:timeRange] intValue];
            scanFrom = marker.location + 1;
        }
        
        marker = [timeComponents rangeOfString:@"M"];
        if (marker.length > 0)
        {
            timeRange = NSMakeRange(scanFrom, marker.location - scanFrom);
            minutes = [[timeComponents substringWithRange:timeRange] intValue];
            scanFrom = marker.location + 1;
        }
        
        marker = [timeComponents rangeOfString:@"S"];
        if (marker.length > 0)
        {
            timeRange = NSMakeRange(scanFrom, marker.location - scanFrom);
            seconds = [[timeComponents substringWithRange:timeRange] intValue];
        }
    }
    return self;
}


- (NSString *)shortString
{
    if (days != 0)
    {
        return [NSString stringWithFormat:@"%dd %dh", days, hours];
    }
    else if (hours != 0)
    {
        return [NSString stringWithFormat:@"%dh %dm", hours, minutes];
    }
    else if (minutes != 0)
    {
        return [NSString stringWithFormat:@"%dm %ds", minutes, seconds];
    }
    else if (seconds != 0)
    {
        return [NSString stringWithFormat:@"%ds", seconds];
    }
    else
    {
        return @"Ended";
    }
}


- (BOOL)hasEnded
{
    return days == 0 && hours == 0 && minutes == 0 && seconds == 0;
}


- (BOOL)isEndingSoon
{
    return days == 0 && hours == 0 &&
        ((minutes == 1 && seconds == 0) || (minutes == 0 && seconds > 0));
}


- (UIColor *)textColor
{
    if ([self isEndingSoon])
    {
        return [UIColor redColor];
    }
    else
    {
        return [UIColor blackColor];
    }
}

@end
