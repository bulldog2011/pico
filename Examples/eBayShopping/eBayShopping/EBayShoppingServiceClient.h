//
//  EBayShoppingServiceClient.h
//  eBayShopping
//
//  Created by bulldog on 13-3-17.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

#import "ShoppingInterface_XMLClient.h"

@interface EBayShoppingServiceClient : ShoppingInterface_XMLClient

+ (EBayShoppingServiceClient *)sharedClient;

@end
