//
//  EBayTradingSerivceClient.h
//  eBayTrading
//
//  Created by bulldog on 13-3-18.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

#import "EBayAPIInterface_SOAPClient.h"

@interface EBayTradingServiceClient : EBayAPIInterface_SOAPClient

+ (EBayTradingServiceClient *)sharedClient;

@end
