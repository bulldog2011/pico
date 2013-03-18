//
//  EBayFindingServiceClient.h
//  HelloeBayFinding
//
//  Created by bulldog on 13-3-16.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

#import "FindingServicePortType_SOAPClient.h"

@interface EBayFindingServiceClient : FindingServicePortType_SOAPClient

+ (EBayFindingServiceClient *)sharedClient;

@end
