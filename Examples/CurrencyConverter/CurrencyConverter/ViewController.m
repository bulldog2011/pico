//
//  ViewController.m
//  CurrencyConverter
//
//  Created by bulldog on 13-3-19.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

#import "ViewController.h"
#import "CurrencyConverterSerivceClient.h"
#import "SOAP11Fault.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - view life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload
{
    self.fromCurrencyTextField = nil;
    self.toCurrencyTextField = nil;
    self.convertButton = nil;
    self.activityIndicator = nil;
    
    [super viewDidUnload];
}



#pragma mark - UI Event Handlers
- (IBAction)onConvertClicked:(id)sender {
    
    if (!self.fromCurrencyTextField.text.length || !self.toCurrencyTextField.text.length)
    {
        UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"Invalid Parameters" message:@"Please enter valid from and to currency types and try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        return;
    }
    
    [self.activityIndicator setHidden:NO];
    [self.activityIndicator startAnimating];
    
    // Get shared client
    CurrencyConverterSerivceClient *client = [CurrencyConverterSerivceClient sharedClient];
    client.debug = YES; // enable message logging
    client.timeoutInverval = 10; // http timeout in seconds
    
    // build request
    ConversionRate *request = [[[ConversionRate alloc] init] autorelease];
    request.fromCurrency = self.fromCurrencyTextField.text;
    request.toCurrency = self.toCurrencyTextField.text;
    
    // make API call
    [client conversionRate:request success:^(ConversionRateResponse *responseObject) {
        
        // success handling logic
        [self.activityIndicator stopAnimating];
        
        UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"Success!" message:[NSString stringWithFormat:@"Currency Conversion Rate is %@",responseObject.conversionRateResult] delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        
    } failure:^(NSError *error, id<PicoBindable> soapFault) {
        
        [self.activityIndicator stopAnimating];
        
        // error handling logic
        if (error) { // http or parsing error
            UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"Error" message:error.localizedDescription delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        } else if (soapFault) { // soap fault
            SOAP11Fault *soap11Fault = (SOAP11Fault *)soapFault;
            UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"SOAP Fault" message:soap11Fault.faultstring delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }
    }];
    
}

#pragma mark - TextField Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
    
}

@end
