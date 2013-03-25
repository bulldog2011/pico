//
//  CartViewController.h
//  AWSECDemoApp
//
//  Created by user on 13-3-24.
//  Copyright (c) 2013年 Leansoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Cart;

@interface CartViewController : UIViewController

@property (nonatomic, retain) IBOutlet UILabel *cartId;
@property (nonatomic, retain) IBOutlet UILabel *productId;
@property (nonatomic, retain) IBOutlet UILabel *price;
@property (nonatomic, retain) IBOutlet UILabel *seller;
@property (nonatomic, retain) IBOutlet UILabel *quantity;
@property (nonatomic, retain) Cart *cart;

-(IBAction)purchaseButtonPresssed:(id)sender;

@end
