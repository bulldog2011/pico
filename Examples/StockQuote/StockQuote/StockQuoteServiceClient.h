//
//  StockQuoteServiceClient.h
//  StockQuote
//
//  Created by user on 13-3-19.
//  Copyright (c) 2013年 Leansoft. All rights reserved.
//

#import "StockQuoteSoap_SOAPClient.h"

@interface StockQuoteServiceClient : StockQuoteSoap_SOAPClient

+ (StockQuoteServiceClient *)sharedClient;

@end
