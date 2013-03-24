//
//  PriceFormatter.h
//  eBayDemoApp
//
//  Created by bulldog on 13-3-24.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

@interface PriceUtil : NSObject

/// Converts given convertedCurrentPrice attributes to a string
+ (NSString *)stringFromConvertedCurrentPrice:(NSNumber *)value currency:(NSString *)currencyID;

/// Converts given attributes to a string
+ (NSString *)stringFromValue:(NSNumber *)value currency:(NSString *)currencyID;

@end
