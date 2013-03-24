//
//  CartViewController.m
//  AWSECDemoApp
//
//  Created by user on 13-3-24.
//  Copyright (c) 2013年 Leansoft. All rights reserved.
//

#import "CartViewController.h"
#import "CommonTypes.h"

@interface CartViewController ()

@end

@implementation CartViewController

- (void)viewWillAppear:(BOOL)animated
{
    
    self.title = @"Cart Details";
    
    self.cartId.text = self.cart.cartId;
    CartItem *cartItem = [self.cart.cartItems.cartItem objectAtIndex:0];
    self.productId.text = cartItem.asin;
    self.price.text = cartItem.itemTotal.formattedPrice;
    self.quantity.text = cartItem.quantity;
    self.seller.text = cartItem.sellerNickname;
    
    [super viewWillAppear:animated];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)purchaseButtonPresssed:(id)sender {
    
    NSURL *url=[NSURL URLWithString:self.cart.purchaseURL];
	[[UIApplication sharedApplication]openURL:url];
	
}

-(void)dealloc {
    self.cartId = nil;
    self.productId = nil;
    self.price = nil;
    self.seller = nil;
    self.cart = nil;
    
    [super dealloc];
}

@end
