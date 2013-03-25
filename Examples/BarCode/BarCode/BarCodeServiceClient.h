//
//  BarCodeServiceClient.h
//  BarCode
//
//  Created by bulldog on 13-3-20.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

#import "BarCodeSoap_SOAPClient.h"

@interface BarCodeServiceClient : BarCodeSoap_SOAPClient

+ (BarCodeServiceClient *)sharedClient;

@end
