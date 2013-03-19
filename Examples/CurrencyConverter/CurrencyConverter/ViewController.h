//
//  ViewController.h
//  CurrencyConverter
//
//  Created by bulldog on 13-3-19.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (retain, nonatomic) IBOutlet UITextField *fromCurrencyTextField;
@property (retain, nonatomic) IBOutlet UITextField *toCurrencyTextField;
@property (retain, nonatomic) IBOutlet UIButton *convertButton;
@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end
