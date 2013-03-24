//
//  SearchControllerViewController.m
//  AWSECDemoApp
//
//  Created by bulldog on 13-3-22.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

#import "SearchViewController.h"
#import "AWSECommerceServiceClient.h"
#import "CommonTypes.h"
#import "SOAP11Fault.h"
#import "Toast+UIView.h"
#import "ItemTableViewCell.h"
#import "DetailsViewController.h"

@interface SearchViewController ()

-(void)searchAmazonByKeyword:(NSString *)keyword;

-(void)setCell:(ItemTableViewCell *)cell fromSearchItem:(Item *)item;

@end

@implementation SearchViewController

#pragma mark -
#pragma mark UISearchBarDelegate

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    [self.searchBar setShowsCancelButton:YES animated:YES];
    self.tableView.allowsSelection = NO;
    self.tableView.scrollEnabled = NO;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    self.searchBar.text=@"";
    
    [self.searchBar setShowsCancelButton:NO animated:YES];
    [self.searchBar resignFirstResponder];
    self.tableView.allowsSelection = YES;
    self.tableView.scrollEnabled = YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
	
    [self.searchBar setShowsCancelButton:NO animated:YES];
    [self.searchBar resignFirstResponder];
    self.tableView.allowsSelection = YES;
    self.tableView.scrollEnabled = YES;
	
    [self searchAmazonByKeyword:self.searchBar.text];
}

#pragma mark -
#pragma mark UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	// Initialize & Populate table cell
	NSString *cellID = [ItemTableViewCell reuseIdentifier];
    ItemTableViewCell *cell = (ItemTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell = [ItemTableViewCell itemTableViewCellFromNib];
    }
    [self setCell:cell fromSearchItem:[_tableData objectAtIndex:[indexPath row]]];
    return cell;
}

-(void)setCell:(ItemTableViewCell *)cell fromSearchItem:(Item *)item {
    cell.titleLabel.text = item.itemAttributes.title;
    [cell setImageURL:item.smallImage.url];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (!self.detailsViewController) {
        self.detailsViewController = [[DetailsViewController alloc] initWithNibName:@"DetailsView" bundle:nil];
    }
    
    Item *item = [_tableData objectAtIndex: [indexPath row]];
    self.detailsViewController.item = item;
    
    //switch to the item details view
    [[self navigationController] pushViewController:self.detailsViewController animated:YES];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (void)viewDidLoad
{
	[super viewDidLoad];
    
    if (_tableData) {
        [_tableData removeAllObjects];
    } else {
        _tableData = [[NSMutableArray alloc] init];
    }
}

#pragma mark -
#pragma mark Memory management
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Search on Amazon Server
-(void)searchAmazonByKeyword:(NSString *)keyword {
    
    // start progress activity
    [self.view makeToastActivity];
    
    // get shared client
    AWSECommerceServiceClient *client = [AWSECommerceServiceClient sharedClient];
    client.debug = YES;
    
    // build request
    ItemSearch *request = [[[ItemSearch alloc] init] autorelease];
    request.associateTag = @"tag"; // seems any tag is ok
    request.shared = [[[ItemSearchRequest alloc] init] autorelease];
    request.shared.searchIndex = @"Books";
    request.shared.keywords = keyword;
    request.shared.responseGroup = [NSMutableArray arrayWithObjects:@"Images", @"ItemAttributes", @"Offers",nil];
    
    // authenticate the request
    // see : http://docs.aws.amazon.com/AWSECommerceService/latest/DG/NotUsingWSSecurity.html
    [client authenticateRequest:@"ItemSearch"];
    [client itemSearch:request success:^(ItemSearchResponse *responseObject) {
        // stop progress activity
        [self.view hideToastActivity];
        
        // success handling logic
        if (responseObject.items.count > 0) {
            Items *items = [responseObject.items objectAtIndex:0];
            if (items.item.count > 0) {
                
                // Show found items in the table
                [_tableData removeAllObjects];
                [_tableData addObjectsFromArray:items.item];
                [self.tableView reloadData];
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

-(void)dealloc {
    self.searchBar = nil;
    self.tableView = nil;
    [_tableData release];
    self.detailsViewController = nil;
    [super dealloc];
}

@end
