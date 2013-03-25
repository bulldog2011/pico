//
//  ItemTableViewCell.m
//  eBayDemoApp
//
//  Created by bulldog on 13-3-24.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

#import "ItemTableViewCell.h"
#import "UIImageView+AFNetworking.h"

@implementation ItemTableViewCell

+ (ItemTableViewCell *)itemTableViewCellFromNib
{
    ItemTableViewCell *cell = nil;
    
    // Workaround for iOS not directly supporting loading of UITableViewCells from nib files:
    NSArray *nibObjects = [[NSBundle mainBundle] loadNibNamed:@"ItemTableViewCell"
                                                        owner:nil
                                                      options:nil];
    for (id currentObject in nibObjects)
    {
        if ([currentObject isKindOfClass:[ItemTableViewCell class]])
        {
            cell = currentObject;
        }
    }
    
    UIImageView *afImageView = [[UIImageView alloc] init];
    cell.afImageView = afImageView;
    [afImageView release];
    
    cell.titleLabel.numberOfLines = 0; // for wrapping
    
    return cell;
    
}

+ (NSString *)reuseIdentifier
{
    return @"ItemTableViewCell";    // Keep in sync with Identifier field in nib
}


- (void) prepareForReuse {
    [super prepareForReuse];
    [self.afImageView cancelImageRequestOperation];
}

- (void)setImageURL:(NSString *)urlString {
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    [self.afImageView setImageWithURLRequest: request placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        if (image) {
            self.thumbnailView.image = image;
        }
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        // do nothing
    }];
}

- (void)dealloc
{
    [_titleLabel release];
    [_priceLabel release];
    [_bidsLabel release];
    [_timeLeftLabel release];
    [_thumbnailView release];
    self.afImageView = nil;
    
    [super dealloc];
}

@end
