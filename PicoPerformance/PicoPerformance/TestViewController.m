//
//  TestViewController.m
//  PicoPerformance
//
//  Created by bulldog on 13-2-24.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "TestViewController.h"
#import "PicoXMLReader.h"
#import "PersonListType.h"
#import "PersonParser.h"

@implementation TestViewController

@synthesize selectedLibraries = _selectedLibraries;
@synthesize selectedFile;
@synthesize hud = _hud;
@synthesize results = _results;
@synthesize repeats;
@synthesize graphView = _graphView;
@synthesize completed;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)dealloc {
    self.hud = nil;
    self.selectedFile = nil;
    [_graphView release];
    [_results release];
    [_selectedLibraries release];
    [super dealloc];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.title = self.selectedFile;
    self.completed = NO;
    
    _results = [[NSMutableDictionary alloc] initWithCapacity:[_selectedLibraries count]];
    
    _graphView = [[UIWebView alloc] initWithFrame:self.navigationController.view.bounds];
    [_graphView setHidden:YES];
    _graphView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.navigationController.view addSubview:_graphView];
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
    
    _hud = [[MBProgressHUD alloc] initWithView:self.view];
    [_hud setLabelText:@"Parsing..."];
    [_hud show:YES];
    [self.view addSubview:_hud];
    
    [self performSelector:@selector(parse) withObject:nil afterDelay:0.2];
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
    if (!self.completed) return NO;
    
    // Return YES for supported orientations
    if (!(interfaceOrientation == UIInterfaceOrientationPortrait)) {
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    } else {
        [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
    }
    return !(interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown);
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    if (fromInterfaceOrientation == UIInterfaceOrientationPortrait) {
        [_graphView setHidden:NO];
    } else {
        [_graphView setHidden:YES];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_selectedLibraries count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    cell.textLabel.text = [_selectedLibraries objectAtIndex:indexPath.row];
    
    NSMutableArray *results = [_results objectForKey:[_selectedLibraries objectAtIndex:indexPath.row]];
    
    if (indexPath.section == 0) {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%.2f ms", [self average:results]];
    } else if (indexPath.section == 1) {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%.2f ms", [self min:results]];
    } else if (indexPath.section == 2) {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%.2f ms", [self max:results]];
    }
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return [NSString stringWithFormat:@"Average (%i repeats)", self.repeats];
            break;
        case 1:
            return @"Min";
            break;
        case 2:
            return @"Max";
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
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

#pragma mark - HUD delegate

- (void)hudWasHidden:(MBProgressHUD *)hud
{
    [hud release];
}

#pragma mark - Calculation

- (float)average:(NSArray *)items
{
    if ([items count] == 0) return 0;
    float total = 0.0;
    for (NSNumber *n in items) {
        total+= [n floatValue];
    }
    return total / [items count];
}

- (float)min:(NSArray *)items
{
    if ([items count] == 0) return 0;
    float min = MAXFLOAT;
    for (NSNumber *n in items) {
        if ([n floatValue] < min)
            min = [n floatValue];
    }
    return min;
}

- (float)max:(NSArray *)items
{
    if ([items count] == 0) return 0;
    float max = 0.0;
    for (NSNumber *n in items) {
        if ([n floatValue] > max)
            max = [n floatValue];
    }
    return max;
}

#pragma merk - Build Chard

- (void)buildChart
{
    NSString *pathToTemplate = [[NSBundle mainBundle] pathForResource:@"graph" 
                                                               ofType:@"html" 
                                                          inDirectory:@"/htdocs" ];
    NSString *template = [NSString stringWithContentsOfFile:pathToTemplate 
                                                   encoding:NSUTF8StringEncoding 
                                                      error:nil];
    
    //categories: ['Africa', 'America', 'Asia', 'Europe', 'Oceania']
    NSMutableString *categories = [NSMutableString stringWithString:@"["];
    for (NSString *libname in self.selectedLibraries) {
        [categories appendFormat:@"'%@'", libname];
        if (libname != [self.selectedLibraries lastObject])
            [categories appendString:@", "];
    }
    [categories appendString:@"]"];
    
    NSMutableString *series = [NSMutableString stringWithString:@"[{\n name: 'Average', \ndata: ["];
    for (NSString *libname in self.selectedLibraries) {        
        NSMutableArray *results = [_results objectForKey:libname];
        [series appendFormat:@"%.2f", [self average:results]];
        
        if (libname != [self.selectedLibraries lastObject])
            [series appendString:@", "];
    }
    [series appendString:@"]}, \n{name: 'Min', \ndata: ["];
    
    for (NSString *libname in self.selectedLibraries) {        
        NSMutableArray *results = [_results objectForKey:libname];
        [series appendFormat:@"%.2f", [self min:results]];
        
        if (libname != [self.selectedLibraries lastObject])
            [series appendString:@", "];
    }
    [series appendString:@"]}, \n{name: 'Max', \ndata: ["];
    
    for (NSString *libname in self.selectedLibraries) {        
        NSMutableArray *results = [_results objectForKey:libname];
        [series appendFormat:@"%.2f", [self max:results]];
        
        if (libname != [self.selectedLibraries lastObject])
            [series appendString:@", "];
    }
    [series appendString:@"]}\n]"];
    
    NSString *html = [NSString stringWithFormat:template, self.selectedFile, self.repeats, categories, series];
    
    [self.graphView loadHTMLString:html baseURL:[NSURL fileURLWithPath:
                                                 [NSString stringWithFormat:@"%@/htdocs/graph.html", 
                                                  [[NSBundle mainBundle] bundlePath]]]];    
}

#pragma mark - Parser


- (void)parse
{    
    [_hud setLabelText:@"Parsing..."];
    
    NSError *error = nil;
    NSString *pathToFile = [[NSBundle mainBundle] pathForResource:selectedFile ofType:@""];
    NSString *contentFile = [NSString stringWithContentsOfFile:pathToFile encoding:NSUTF8StringEncoding error:&error];
    if (error) {
        NSLog(@"Error: %@", [error description]);
        return;
    }
    NSData *contentData = [contentFile dataUsingEncoding:NSUTF8StringEncoding];
    
    //Libs Pico, NSXML
    
    for (NSString *libName in _selectedLibraries) 
    {
        NSMutableArray *results = [[[NSMutableArray alloc] initWithCapacity:self.repeats] autorelease];
        SEL method = NSSelectorFromString([NSString stringWithFormat:@"parseWith%@:",libName]);
        
        for (int i = 0; i < self.repeats; i++) {
            [results addObject:[self performSelector:method withObject:contentData]];
        }
       
        [_results setObject:results forKey:libName];
    }
    
    [_hud hide:YES];
    [self.tableView reloadData];    
    [self buildChart];
    [self setCompleted:YES];
}

- (NSNumber *)parseWithPico:(NSData *)content
{
    NSDate *startTime = [NSDate date];
    PicoXMLReader *reader = [[PicoXMLReader alloc] init];
    PersonListType *persons = [reader fromData:content withClass:[PersonListType class]];
    PersonType *person = [persons.person objectAtIndex:0];
    [reader release];
    float elapsedTime = [startTime timeIntervalSinceNow] * -1000;
    if (persons == nil)
        elapsedTime = -1.0;
    return [NSNumber numberWithFloat:elapsedTime];
}


- (NSNumber *)parseWithNSXMLParser:(NSData *)content {
    NSDate *startTime = [NSDate date];
    
    // create an init NSXMLParser object
    NSXMLParser *nsXmlParser = [[NSXMLParser alloc] initWithData:content];
    [nsXmlParser setShouldProcessNamespaces:YES];
    // create and init delegate
    PersonParser *parser = [[PersonParser alloc] initPersonParser];
    // set delegate
    [nsXmlParser setDelegate:parser];
    // parsing...
    BOOL success = [nsXmlParser parse];
    PersonListType *persons = parser.personList;
    PersonType *person = [persons.person objectAtIndex:1];
    
    [parser release];
    [nsXmlParser release];
    
    float elapsedTime = [startTime timeIntervalSinceNow] * -1000;
    if (persons == nil)
        elapsedTime = -1.0;
    return [NSNumber numberWithFloat:elapsedTime];
}

@end
