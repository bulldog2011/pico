//
//  MasterViewController.m
//  PicoPerformance
//
//  Created by bulldog on 13-2-24.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "MasterViewController.h"

@implementation MasterViewController

@synthesize libraries = _libraries;
@synthesize files = _files;
@synthesize selectedLibraries = _selectedLibraries;
@synthesize selectedFile;
@synthesize repeats;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Pico Performance Test";
    }
    return self;
}
							
- (void)dealloc
{
    self.selectedFile = nil;
    
    [_libraries release];
    [_files release];
    [_selectedLibraries release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.    
    _libraries = [[NSArray alloc] initWithObjects:@"Pico", @"NSXMLParser", nil];
    
    _files = [[NSArray alloc] initWithObjects:@"10records.xml", @"50records.xml", @"300records.xml", nil];
    _selectedLibraries = [[NSMutableArray alloc] init];
    
    self.repeats = 1;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return [_libraries count];
    } else if (section == 1) {
        return [_files count];
    }  else if (section == 2) {
        return 5;
    }
    return 1;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    cell.textLabel.textAlignment = NSTextAlignmentLeft;
    
    // Configure the cell.
    if (indexPath.section == 0) {
        cell.textLabel.text = [_libraries objectAtIndex:indexPath.row];
        
        if ([_selectedLibraries containsObject:[_libraries objectAtIndex:indexPath.row]])
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        else
            cell.accessoryType = UITableViewCellAccessoryNone;
    } else if (indexPath.section == 1) {
        cell.textLabel.text = [_files objectAtIndex:indexPath.row];
        
        if ([self.selectedFile isEqualToString:[_files objectAtIndex:indexPath.row]])
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        else
            cell.accessoryType = UITableViewCellAccessoryNone;
    } else if (indexPath.section == 2) {
        NSInteger number = 0;
        switch (indexPath.row) {
            case 0:
                number = 1;
                break;
            case 1:
                number = 5;
                break;
            case 2:
                number = 25;
                break;
            case 3:
                number = 50;
                break;
            case 4:
                number = 100;
                break;
            default:
                break;
        }
        
        cell.textLabel.text = [NSString stringWithFormat:@"%i times", number];
        
        if (self.repeats == number)
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        else
            cell.accessoryType = UITableViewCellAccessoryNone;
        
    } else {
        cell.textLabel.text = @"RUN!";
        cell.textLabel.textAlignment = UITextAlignmentCenter;
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return @"Select Libraries";
            break;
        case 1:
            return @"Select File";
            break;
        case 2:
            return @"Parse the file...";
            break;
        default:
            break;
    }
    return nil;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if ([_selectedLibraries containsObject:[_libraries objectAtIndex:indexPath.row]]) {
            [_selectedLibraries removeObject:[_libraries objectAtIndex:indexPath.row]];
            cell.accessoryType = UITableViewCellAccessoryNone;
        } else {
            [_selectedLibraries addObject:[_libraries objectAtIndex:indexPath.row]];
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }        
        return;
    } else if (indexPath.section == 1) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if ([self.selectedFile isEqualToString:[_files objectAtIndex:indexPath.row]]) {
            self.selectedFile = nil;
            cell.accessoryType = UITableViewCellAccessoryNone;
        } else {
            NSIndexPath *prevSelection = nil;
            if (self.selectedFile != nil) {
                prevSelection = [NSIndexPath indexPathForRow:[_files indexOfObject:self.selectedFile] 
                                                   inSection:1];
            }
            self.selectedFile = [_files objectAtIndex:indexPath.row];
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            if (prevSelection)
                [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:prevSelection, nil] 
                                 withRowAnimation:UITableViewRowAnimationAutomatic];
        }        
        return;
    } else if (indexPath.section == 2) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        
        NSInteger number = 0;
        switch (indexPath.row) {
            case 0:
                number = 1;
                break;
            case 1:
                number = 5;
                break;
            case 2:
                number = 25;
                break;
            case 3:
                number = 50;
                break;
            case 4:
                number = 100;
                break;
            default:
                break;
        }

        if (self.repeats == number) return;
        
        NSInteger prevSelection = 0;
        switch (self.repeats) {
            case 1:
                prevSelection = 0;
                break;
            case 5:
                prevSelection = 1;
                break;
            case 25:
                prevSelection = 2;
                break;
            case 50:
                prevSelection = 3;
                break;
            case 100:
                prevSelection = 4;
                break;
            default:
                break;
        }
        

        NSIndexPath *selection = [NSIndexPath indexPathForRow:prevSelection 
                                                    inSection:2];

        self.repeats = number;
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:selection, nil] 
                         withRowAnimation:UITableViewRowAnimationAutomatic];
        return;
    }
    
    if (self.selectedFile == nil || [self.selectedLibraries count] == 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Hmmm..." 
                                                            message:@"Please select at least one library and one file to parse." 
                                                           delegate:nil 
                                                  cancelButtonTitle:@"Ok..." 
                                                  otherButtonTitles:nil];
        [alertView show];
        [alertView release];
        return;
    }
    
    TestViewController *detailViewController = [[TestViewController alloc] initWithNibName:@"TestViewController"
                                                                                        bundle:nil];
    detailViewController.selectedFile = self.selectedFile;
    detailViewController.selectedLibraries = self.selectedLibraries;
    detailViewController.repeats = self.repeats;
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
}

@end
