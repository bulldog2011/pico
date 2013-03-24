//
//  PriceFormatter.m
//  eBayDemoApp
//
//  Created by bulldog on 13-3-24.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

#import "PriceUtil.h"


@implementation PriceUtil

/// Sets number formatter to handle given currency
+ (void)setNumberFormatter:(NSNumberFormatter *)numberFormatter forCurrency:(NSString *)currencyID
{
    [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [numberFormatter setCurrencyCode:currencyID];
}


+ (NSString *)stringFromConvertedCurrentPrice:(NSNumber *)value currency:(NSString *)currencyID
{
    // We can use a single number formatter because the "converted current price" will always be
    // in a single currency.
    static NSNumberFormatter *numberFormatter = nil;
    if (numberFormatter == nil)
    {
        numberFormatter = [[NSNumberFormatter alloc] init];
        [self setNumberFormatter:numberFormatter forCurrency:currencyID];
    }
    
    return [numberFormatter stringFromNumber:value];
}


+ (NSString *)stringFromValue:(NSNumber *)value currency:(NSString *)currencyID
{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [self setNumberFormatter:numberFormatter forCurrency:currencyID];
    
    NSString *result = [numberFormatter stringFromNumber:value];
    [numberFormatter release];
    return result;
}

@end
