//
//  CurrencyConverterSerivceClient.h
//  CurrencyConverter
//
//  Created by user on 13-3-19.
//  Copyright (c) 2013年 Leansoft. All rights reserved.
//

#import "CurrencyConvertorSoap_SOAPClient.h"

@interface CurrencyConverterSerivceClient : CurrencyConvertorSoap_SOAPClient

+ (CurrencyConverterSerivceClient *)sharedClient;

@end
