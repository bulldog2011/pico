//
//  ViewController.m
//  StockQuote
//
//  Created by bulldog on 13-3-19.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

#import "ViewController.h"
#import "StockQuoteServiceClient.h"
#import "CommonTypes.h"
#import "SOAP11Fault.h"

#import "Toast+UIView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Create a text field for the user input.
    _symbolText = [[UITextField alloc] initWithFrame:CGRectMake(5.0f, 10.0f, 220.0f, 30.0f)];
    _symbolText.placeholder = @"<Enter company symbol>";
    _symbolText.textAlignment = NSTextAlignmentLeft;
    _symbolText.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_symbolText];
    [_symbolText release];
    
    // Create a search button for triggering the search.
    _getQuoteButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _getQuoteButton.frame = CGRectMake(230.0f, 10.0f, 85.0f, 30.0f);
    [_getQuoteButton setTitle:@"GetQuote" forState:UIControlStateNormal];
    [_getQuoteButton addTarget:self action:@selector(getQuotePressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_getQuoteButton];
    
    // Create a text view in which we will display the search results.
    _resultText = [[UITextView alloc] initWithFrame:CGRectMake(5.0f, 50.0f, 310.0f, 400.0f)];
    _resultText.editable = NO;
    [self.view addSubview:_resultText];
}

- (void)viewDidUnload
{
    [_symbolText release];
    [_getQuoteButton release];
    [_resultText release];
    
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getQuotePressed:(id)sender
{
    // Hide the keyboard.
    [_symbolText resignFirstResponder];
    
    if (_symbolText.text.length > 0) {
        
        // start progress activity
        [self.view makeToastActivity];
        
        // Get shared service client
        StockQuoteServiceClient *client = [StockQuoteServiceClient sharedClient];
        client.debug = YES; // enable request/response message logging
        
        // Build request object
        GetQuote *request = [[[GetQuote alloc] init] autorelease];
        request.symbol = _symbolText.text;
        
        // make API call and register callbacks
        [client getQuote:request success:^(GetQuoteResponse *responseObject) {
            
            // stop progress activity
            [self.view hideToastActivity];
            
            // show result
            _resultText.text = responseObject.getQuoteResult;
        } failure:^(NSError *error, id<PicoBindable> soapFault) {
            
            // stop progress activity
            [self.view hideToastActivity];
            
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
