//
//  SearchViewController.m
//  eBayDemoApp
//
//  Created by bulldog on 13-3-24.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

#import "SearchViewController.h"
#import "Finding_CommonTypes.h"
#import "EBayFindingServiceClient.h"
#import "SOAP12Fault.h"
#import "SOAP12Faultreason.h"
#import "SOAP12Detail.h"
#import "SOAP12Reasontext.h"
#import "ItemTableViewCell.h"
#import "PriceUtil.h"
#import "Duration.h"
#import "DetailsViewController.h"
#import "Toast+UIView.h"

static BOOL isFixedPrice(Finding_SearchItem *item)
{
    NSString *listingType = item.listingInfo.listingType;
    return [listingType isEqualToString:@"FixedPrice"] ||
	[listingType isEqualToString:@"StoreInventory"];
}

@interface SearchViewController ()

-(void)searcheBayByKeywords:(NSString *)keyword;

-(void)setCell:(ItemTableViewCell *)cell fromSearchItem:(Finding_SearchItem *)item;

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
	
    [self searcheBayByKeywords:self.searchBar.text];
}

- (void)viewDidLoad
{
    if (_tableData) {
        [_tableData removeAllObjects];
    } else {
        _tableData = [[NSMutableArray alloc] init];
    }
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Search on eBay Server
-(void)searcheBayByKeywords:(NSString *)keywords {
    // start progress activity
    // start progress activity
    [self.view makeToastActivity];
    
    EBayFindingServiceClient *findingClient = [EBayFindingServiceClient sharedClient];
    findingClient.debug = YES;
    
    Finding_FindItemsByKeywordsRequest *request = [[[Finding_FindItemsByKeywordsRequest alloc] init] autorelease];
    request.keywords = keywords;
    Finding_PaginationInput *pagination = [[[Finding_PaginationInput alloc] init] autorelease];
	pagination.entriesPerPage = [NSNumber numberWithInt:10];
	request.paginationInput = pagination;
    
    [findingClient findItemsByKeywords:request success:^(Finding_FindItemsByKeywordsResponse *responseObject) {
        // stop progress activity
        // stop progress activity
        [self.view hideToastActivity];
        
        if ([Finding_AckValue_SUCCESS isEqualToString:responseObject.ack]) {
            if (responseObject.searchResult.count > 0) {
                
                // Show found items in the table
                [_tableData removeAllObjects];
                [_tableData addObjectsFromArray:responseObject.searchResult.item];
                [self.tableView reloadData];
            } else {
                // no result
                [self.view makeToast:@"No result" duration:3.0 position:@"center"];
            }
        } else {
            Finding_ErrorData *errorData = [responseObject.errorMessage.error objectAtIndex:0];
            [self.view makeToast:errorData.message duration:3.0 position:@"center" title:@"Finding API Error"];
        }
    } failure:^(NSError *error, id<PicoBindable> soapFault) {
        // stop progress activity
        [self.view hideToastActivity];
        
        // error handling logic
        if (error) { // http or parsing error
            [self.view makeToast:[error localizedDescription] duration:3.0 position:@"center" title:@"Error"];
        } else if (soapFault) {
            SOAP12Fault *soap12Fault = (SOAP12Fault *)soapFault;
            SOAP12Reasontext *reasonText = [soap12Fault.reason.text objectAtIndex:0];
            [self.view makeToast:reasonText.value duration:3.0 position:@"center" title:@"SOAP Fault"];
        }
    }];
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Initialize listing details veiw controller
	if (!_detailsViewController)
    {
        _detailsViewController = [[DetailsViewController alloc] initWithNibName:@"DetailsViewController"
                                                                                      bundle:nil];
    }
    
    Finding_SearchItem *item = [_tableData objectAtIndex:[indexPath row]];
    _detailsViewController.selectedItem = item;
    _detailsViewController.isFixedPrice = isFixedPrice(item);
    
	// switch to the listing details view
    [[self navigationController] pushViewController:_detailsViewController animated:YES];
}


/// Sets attributes of a table view cell using the given item
- (void)setCell:(ItemTableViewCell *)cell fromSearchItem:(Finding_SearchItem *)item
{
    [[cell titleLabel] setText:item.title];
    
    Finding_Amount* convertedCurrentPrice = item.sellingStatus.convertedCurrentPrice;
    [[cell priceLabel] setText:[PriceUtil stringFromConvertedCurrentPrice:convertedCurrentPrice.value
                                                                      currency:convertedCurrentPrice.currencyId]];
    
    if (isFixedPrice(item))
    {
        [[cell bidsLabel] setText:nil];
    }
    else
    {
        NSNumber *bidCount = item.sellingStatus.bidCount;
        NSString *formatString = nil;
        if ([bidCount unsignedIntegerValue] == 1)
        {
            formatString = @"%@ bid";
        }
        else
        {
            formatString = @"%@ bids";
        }
        NSString *bidsText = [[NSString alloc] initWithFormat:formatString, bidCount];
        [[cell bidsLabel] setText:bidsText];
        [bidsText release];
    }
    
    ISODuration *timeLeft = [[ISODuration alloc] initWithISODurationString:item.sellingStatus.timeLeft];
    UILabel *timeLeftLabel = [cell timeLeftLabel];
    [timeLeftLabel setText:[timeLeft shortString]];
    [timeLeftLabel setTextColor:[timeLeft textColor]];
    [timeLeft release];
    
    [cell setImageURL:item.galleryURL];
}

-(void)dealloc {
    self.searchBar = nil;
    self.tableView = nil;
    [_tableData release];
    [super dealloc];
}

@end
