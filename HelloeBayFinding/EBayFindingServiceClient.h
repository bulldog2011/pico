//
//  EBayFindingServiceClient.h
//  HelloeBayFinding
//
//  Created by bulldog on 13-3-16.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

#import "FindingServicePortType_Client.h"

@interface EBayFindingServiceClient : FindingServicePortType_Client

+ (EBayFindingServiceClient *)sharedClient;

@end
