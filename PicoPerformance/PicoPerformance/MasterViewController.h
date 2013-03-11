//
//  MasterViewController.h
//  PicoPerformance
//
//  Created by bulldog on 13-2-24.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestViewController.h"

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) NSArray *libraries;
@property (strong, nonatomic) NSArray *files;
@property (strong, nonatomic) NSMutableArray *selectedLibraries;
@property (strong, nonatomic) NSString *selectedFile;
@property (assign, nonatomic) NSInteger repeats;

@end
