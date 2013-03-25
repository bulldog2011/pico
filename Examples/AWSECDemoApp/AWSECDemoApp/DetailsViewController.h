//
//  DetailsViewController.h
//  AWSECDemoApp
//
//  Created by bulldog on 13-3-23.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonTypes.h"

@class CartViewController;

@interface DetailsViewController : UIViewController

@property (nonatomic, retain) Item *item;
@property (nonatomic, retain) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) IBOutlet UILabel *listPriceLabel;
@property (nonatomic, retain) IBOutlet UILabel *authorLabel;
@property (nonatomic, retain) IBOutlet UILabel *bindingLabel;
@property (nonatomic, retain) IBOutlet UILabel *editionLabel;
@property (nonatomic, retain) IBOutlet UILabel *publisherLabel;
@property (nonatomic, retain) IBOutlet UILabel *publicationDateLabel;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;

@property (nonatomic, retain) CartViewController *cartViewController;

@end
