//
//  ItemTableViewCell.h
//  eBayDemoApp
//
//  Created by bulldog on 13-3-24.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemTableViewCell : UITableViewCell

@property (nonatomic, retain) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) IBOutlet UILabel *priceLabel;
@property (nonatomic, retain) IBOutlet UILabel *bidsLabel;
@property (nonatomic, retain) IBOutlet UILabel *timeLeftLabel;
@property (nonatomic, retain) IBOutlet UIImageView *thumbnailView;

@property (nonatomic, retain) UIImageView *afImageView;

/// Creates and returns a cell loaded from the nib file
+ (ItemTableViewCell *)itemTableViewCellFromNib;

/// String matching cell's identifier in nib file
+ (NSString *)reuseIdentifier;

/// Loads item image from given URL
- (void)setImageURL:(NSString *)URLString;

@end
