//
//  ViewController.m
//  AWSECommerce
//
//  Created by bulldog on 13-3-21.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

#import "ViewController.h"
#import "AWSECommerceServiceClient.h"
#import "CommonTypes.h"
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
    _searchText.placeholder = @"<Book title to search>";
    _searchText.textAlignment = NSTextAlignmentLeft;
    _searchText.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_searchText];
    [_searchText release];
    
    // Create a search button for triggering the search.
    _searchButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _searchButton.frame = CGRectMake(250.0f, 10.0f, 65.0f, 30.0f);
    [_searchButton setTitle:@"Search" forState:UIControlStateNormal];
    [_searchButton addTarget:self action:@selector(searchButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_searchButton];
}

- (void)viewDidUnload
{
    [_searchText release];
    [_searchButton release];
    
    [super viewDidUnload];
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
        
        // get shared client
        AWSECommerceServiceClient *client = [AWSECommerceServiceClient sharedClient];
        client.debug = YES;
        
        // build request, see details here:
        ItemSearch *request = [[[ItemSearch alloc] init] autorelease];
        request.associateTag = @"tag"; // seems any tag is ok
        request.shared = [[[ItemSearchRequest alloc] init] autorelease];
        request.shared.searchIndex = @"Books";
        request.shared.responseGroup = [NSMutableArray arrayWithObjects:@"Images", @"Small", nil];
        ItemSearchRequest *itemSearchRequest = [[[ItemSearchRequest alloc] init] autorelease];
        itemSearchRequest.title = _searchText.text;
        request.request = [NSMutableArray arrayWithObject:itemSearchRequest];
        
        // authenticate the request
        // http://docs.aws.amazon.com/AWSECommerceService/latest/DG/NotUsingWSSecurity.html
        [client authenticateRequest:@"ItemSearch"];
        [client itemSearch:request success:^(ItemSearchResponse *responseObject) {
            // stop progress activity
            [self.view hideToastActivity];
            
            // success handling logic
            if (responseObject.items.count > 0) {
                Items *items = [responseObject.items objectAtIndex:0];
                if (items.item.count > 0) {
                    Item *item = [items.item objectAtIndex:0];
                    
                    // start image downloading progress activity
                    [self.view makeToastActivity];
                    // get gallery image
                    NSURL *imageURL = [NSURL URLWithString:item.smallImage.url];
                    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
                    // stop progress activity
                    [self.view hideToastActivity];
                    
                    UIImage *image = [UIImage imageWithData:imageData];
                    [self.view makeToast:item.itemAttributes.title duration:3.0 position:@"center" title:@"Success" image:image];
                } else {
                    // no result
                    [self.view makeToast:@"No result" duration:3.0 position:@"center"];
                }
                
            } else {
                // no result
                [self.view makeToast:@"No result" duration:3.0 position:@"center"];
            }
            // TODO
        } failure:^(NSError *error, id<PicoBindable> soapFault) {
            // stop progress activity
            [self.view hideToastActivity];
            
            // error handling logic
            if (error) { // http or parsing error
                [self.view makeToast:[error localizedDescription] duration:3.0 position:@"center" title:@"Error"];
            } else if (soapFault) {
                SOAP11Fault *soap11Fault = (SOAP11Fault *)soapFault;
                [self.view makeToast:soap11Fault.faultstring duration:3.0 position:@"center" title:@"SOAP Fault"];
            }
        }];
        
    }
}

@end
