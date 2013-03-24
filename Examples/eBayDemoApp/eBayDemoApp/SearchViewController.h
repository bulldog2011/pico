//
//  SearchViewController.h
//  eBayDemoApp
//
//  Created by bulldog on 13-3-24.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailsViewController;

@interface SearchViewController : UIViewController <UISearchBarDelegate, UITableViewDelegate> {
    // container halding search results;
    NSMutableArray *_tableData;
    
    DetailsViewController *_detailsViewController;
}
@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property (retain, nonatomic) IBOutlet UISearchBar *searchBar;

@end
