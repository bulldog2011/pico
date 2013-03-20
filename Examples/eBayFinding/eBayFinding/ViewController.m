//
//  ViewController.m
//  eBayFinding
//
//  Created by bulldog on 13-3-16.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

#import "ViewController.h"
#import "EBayFindingServiceClient.h"
#import "Finding_CommonTypes.h"
#import "SOAP12Fault.h"
#import "SOAP12Faultreason.h"
#import "SOAP12Detail.h"
#import "SOAP12Reasontext.h"

#import "Toast+UIView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Create a text field for the user input.
    _searchText = [[UITextField alloc] initWithFrame:CGRectMake(5.0f, 10.0f, 240.0f, 30.0f)];
    _searchText.placeholder = @"<Enter keyword to search>";
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
        
        // Get shared service client
        EBayFindingServiceClient *findingClient = [EBayFindingServiceClient sharedClient];
        findingClient.debug = YES; // enable request/response message logging
        
        // Build request object
        Finding_FindItemsByKeywordsRequest *request = [[[Finding_FindItemsByKeywordsRequest alloc] init] autorelease];
        request.keywords = _searchText.text;
        // only need one item for demo
        Finding_PaginationInput *pagination = [[Finding_PaginationInput alloc] init];
        pagination.pageNumber = [NSNumber numberWithInt:1];
        pagination.entriesPerPage = [NSNumber numberWithInt:1];
        request.paginationInput = pagination;
        [pagination release];
        
        // make API call and register callbacks
        [findingClient findItemsByKeywords:request success:^(Finding_FindItemsByKeywordsResponse *responseObject) {
            
            // stop progress activity
            [self.view hideToastActivity];
            
            if ([Finding_AckValue_SUCCESS isEqualToString:responseObject.ack]) {
                if (responseObject.searchResult.count > 0) {
                    // show the title of the first found item
                    Finding_SearchItem *item = [responseObject.searchResult.item objectAtIndex:0];
                    
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
            } else { // response residenet error
                Finding_ErrorData *errorData = [responseObject.errorMessage.error objectAtIndex:0];
                [self.view makeToast:errorData.message duration:3.0 position:@"center" title:@"Error"];
            }
        } failure:^(NSError *error, id<PicoBindable> soapFault) {
            
            // stop progress activity
            [self.view hideToastActivity];
            
            if (error) {
                [self.view makeToast:[error localizedDescription] duration:3.0 position:@"center" title:@"Error"];
            } else if (soapFault) {
                SOAP12Fault *soap12Fault = (SOAP12Fault *)soapFault;
                SOAP12Reasontext *reasonText = [soap12Fault.reason.text objectAtIndex:0];
                [self.view makeToast:reasonText.value duration:3.0 position:@"center" title:@"SOAP Fault"];
            }
        }];
        
    }
}

@end
