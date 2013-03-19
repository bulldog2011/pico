//
//  ViewController.m
//  eBayShopping
//
//  Created by user on 13-3-17.
//  Copyright (c) 2013年 Leansoft. All rights reserved.
//

#import "ViewController.h"
#import "Shopping_CommonTypes.h"
#import "EBayShoppingServiceClient.h"
#import "Toast+UIView.h"
#import "SOAP11Fault.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Create a text field for the user input.
    _searchText = [[UITextField alloc] initWithFrame:CGRectMake(5.0f, 10.0f, 240.0f, 30.0f)];
    _searchText.placeholder = @"<keyword for popular items>";
    _searchText.textAlignment = NSTextAlignmentLeft;
    _searchText.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_searchText];
    [_searchText release];
    
    // Create a search button for triggering the search.
    _searchButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _searchButton.frame = CGRectMake(250.0f, 10.0f, 65.0f, 30.0f);
    [_searchButton setTitle:@"Find" forState:UIControlStateNormal];
    [_searchButton addTarget:self action:@selector(searchButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_searchButton];
}

- (void)viewDidUnload
{
    [_searchText release];
    [_searchButton release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)searchButtonPressed:(id)sender
{
    // Hide the keyboard.
    [_searchText resignFirstResponder];
    
    if (_searchText.text.length > 0) {
        
        // start progress activity
        [self.view makeToastActivity];
        
        // Get shared service client
        EBayShoppingServiceClient *shoppingClient = [EBayShoppingServiceClient sharedClient];
        shoppingClient.debug = YES; // enable request/response message logging
        
        // Build request object
        Shopping_FindPopularItemsRequestType *request = [[[Shopping_FindPopularItemsRequestType alloc] init] autorelease];
        request.queryKeywords = _searchText.text;
        // only need one item for demo
        request.maxEntries = [NSNumber numberWithInt:1];
        
        // make API call and register callbacks
        [shoppingClient findPopularItems:request success:^(Shopping_FindPopularItemsResponseType *responseObject) {
            
            // stop progress activity
            [self.view hideToastActivity];
            
            if ([Shopping_AckCodeType_SUCCESS isEqualToString:responseObject.ack]) {
            
                if (responseObject.itemArray.item.count > 0) {
                    // show the title of the first found item
                    Shopping_SimpleItemType *item = [responseObject.itemArray.item objectAtIndex:0];
                    
                    // start image downloading progress activity
                    [self.view makeToastActivity];
                    // get gallery image
                    NSURL *imageURL = [NSURL URLWithString:item.galleryURL];
                    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
                    // stop progress activity
                    [self.view hideToastActivity];
                    
                    UIImage *image = [UIImage imageWithData:imageData];
                    [self.view makeToast:item.title duration:3.0 position:@"center" title:@"Success" image:image];
                } else {
                    
                    // no result
                    [self.view makeToast:@"No result" duration:3.0 position:@"center"];
                }
                
            } else { // response resident error
                Shopping_ErrorType *error = [responseObject.errors objectAtIndex:0];
                [self.view makeToast:error.shortMessage duration:3.0 position:@"center" title:@"Error"];
            }
        } failure:^(NSError *error) {
            
            [self.view makeToast:[error localizedDescription] duration:3.0 position:@"center" title:@"Error"];
        }];
        
    }
}

@end
