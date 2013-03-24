//
//  ViewController.h
//  BarCode
//
//  Created by bulldog on 13-3-20.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, retain) IBOutlet UITextField *dataToEncode;
@property (nonatomic, retain) IBOutlet UIImageView *barcodeImage;
@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

-(IBAction)buttonPressed:(id)sender;

@end
