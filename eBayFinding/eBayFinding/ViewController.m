//
//  ViewController.m
//  eBayFinding
//
//  Created by bulldog on 13-3-16.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

#import "ViewController.h"
#import "EBayFindingServiceClient.h"
#import "CommonTypes.h"
#import "SOAP12Fault.h"
#import "SOAP12Faultreason.h"
#import "SOAP12Detail.h"
#import "SOAP12Reasontext.h"

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
    
    // Create a text view in which we will display the search results.
    _searchResult = [[UITextView alloc] initWithFrame:CGRectMake(5.0f, 50.0f, 310.0f, 400.0f)];
    _searchResult.editable = NO;
    [self.view addSubview:_searchResult];
}

- (void)viewDidUnload
{
    [_searchText dealloc];
    [_searchButton dealloc];
    [_searchResult dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)searchButtonPressed:(id)sender
{
    // Reset the search results text and hide the keyboard.
    _searchResult.text = @"";
    [_searchText resignFirstResponder];
    
    if (_searchText.text.length > 0) {
        
        EBayFindingServiceClient *findingClient = [EBayFindingServiceClient sharedClient];
        findingClient.debug = YES;
        FindItemsByKeywordsRequest *request = [[[FindItemsByKeywordsRequest alloc] init] autorelease];
        request.keywords = _searchText.text;
        
        [findingClient findItemsByKeywords:request success:^(FindItemsByKeywordsResponse *responseObject) {
            // Build a string that will contain all the found items.
            NSMutableString* resultsText = [NSMutableString string];
            
            // Enumerate all the found items and append them to the temporary string
            int count = [[responseObject.searchResult count] intValue];
            for (int i = 0; i < count; ++i)
            {
                SearchItem *item = [responseObject.searchResult.item objectAtIndex:i];
                
                NSString* itemText = [NSString stringWithFormat:
                                          @"----------------\n"
                                          "Title: %@\n"
                                          "Price: %.2f %@\n"
                                          "Location: %@, %@\n"
                                          "URL: %@\n",
                                          item.title,
                                          [item.sellingStatus.currentPrice.value floatValue],
                                          item.sellingStatus.currentPrice.currencyId,
                                          item.country,
                                          item.location,
                                          item.viewItemURL];
                
                [resultsText appendString:itemText];
            }
            
            // Set the text in the search results control to the temporary string.
            _searchResult.text = resultsText;
            
        } failure:^(NSError *error, id<PicoBindable> soapFault) {
            if (error) {
                _searchResult.text = [error localizedDescription];
            } else if (soapFault) {
                SOAP12Fault *soap12Fault = (SOAP12Fault *)soapFault;
                SOAP12Reasontext *reasonText = [soap12Fault.reason.text objectAtIndex:0];
                _searchResult.text = [NSString stringWithFormat:@"Got soap fault, reason: %@", reasonText.value];
            }
        }];
        
    }
}

@end
