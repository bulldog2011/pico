//
//  TestViewController.h
//  PicoPerformance
//
//  Created by Junior Bontognali on 6.12.11.
//  Copyright (c) 2011 Mocha Code. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface TestViewController : UITableViewController <MBProgressHUDDelegate>

@property (strong, nonatomic) NSArray *selectedLibraries;
@property (strong, nonatomic) NSString *selectedFile;
@property (strong, nonatomic) MBProgressHUD *hud;
@property (strong, nonatomic) NSMutableDictionary *results;
@property (assign, nonatomic) NSInteger repeats;
@property (assign, nonatomic) BOOL completed;

@property (strong, nonatomic) UIWebView *graphView;

- (float)average:(NSArray *)items;
- (float)max:(NSArray *)items;
- (float)min:(NSArray *)items;

- (void)buildChart;

- (void)parse;
- (NSNumber *)parseWithPico:(NSData *)content;
- (NSNumber *)parseWithNSXMLParser:(NSData *)content;

@end
