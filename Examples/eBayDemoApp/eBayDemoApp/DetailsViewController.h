//
//  DetailsViewController.h
//  eBayDemoApp
//
//  Created by bulldog on 13-3-24.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Shopping_GetSingleItemRequestType.h"

@class Finding_SearchItem;
@interface DetailsViewController : UIViewController {
    Shopping_GetSingleItemRequestType *_currentGetSingleItemRequest;
}

@property (nonatomic, retain) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) IBOutlet UILabel *priceTypeLabel;
@property (nonatomic, retain) IBOutlet UILabel *priceLabel;
@property (nonatomic, retain) IBOutlet UILabel *itemIDLabel;
@property (nonatomic, retain) IBOutlet UILabel *startTimeLabel;
@property (nonatomic, retain) IBOutlet UILabel *endTimeLabel;
@property (nonatomic, retain) IBOutlet UILabel *timeLeftLabel;
@property (nonatomic, retain) IBOutlet UILabel *conditionLabel;
@property (nonatomic, retain) IBOutlet UILabel *listingTypeLabel;
@property (nonatomic, retain) IBOutlet UILabel *shippingCostLabel;
@property (nonatomic, retain) IBOutlet UILabel *locationLabel;
@property (nonatomic, retain) IBOutlet UILabel *paymentMethodLabel;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;

@property (nonatomic, retain) Finding_SearchItem *selectedItem;
@property (nonatomic, assign) BOOL isFixedPrice;

- (IBAction)viewOneBayMobileWeb:(id)sender;

@end
