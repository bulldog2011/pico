//
//  ViewController.m
//  eBayTrading
//
//  Created by user on 13-3-18.
//  Copyright (c) 2013年 Leansoft. All rights reserved.
//

#import "ViewController.h"
#import "EBayTradingServiceClient.h"
#import "Trading_CommonTypes.h"
#import "SOAP11Fault.h"

#import "Toast+UIView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Create a search button for getting ebay official time.
    _getTimeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _getTimeButton.frame = CGRectMake(80.0f, 10.0f, 165.0f, 30.0f);
    [_getTimeButton setTitle:@"GeteBayOfficialTime" forState:UIControlStateNormal];
    [_getTimeButton addTarget:self action:@selector(getTimeButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_getTimeButton];
}

- (void)viewDidUnload
{
    [_getTimeButton dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getTimeButtonPressed:(id)sender
{
        
    // start progress activity
    [self.view makeToastActivity];
    
    // Get shared service client
    EBayTradingServiceClient  *tradingClient = [EBayTradingServiceClient sharedClient];
    tradingClient.debug = YES; // enable request/response message logging
    
    // Build request object
    Trading_GeteBayOfficialTimeRequestType *request = [[[Trading_GeteBayOfficialTimeRequestType alloc] init] autorelease];
    
    // make API call and register callbacks
    [tradingClient geteBayOfficialTime:request success:^(Trading_GeteBayOfficialTimeResponseType *responseObject) {
        
        // stop progress activity
        [self.view hideToastActivity];
        
        if ([Trading_AckCodeType_SUCCESS isEqualToString:responseObject.ack]) {
            NSString *dateString = [NSDateFormatter localizedStringFromDate:responseObject.timestamp
                                                                  dateStyle:NSDateFormatterShortStyle
                                                                  timeStyle:NSDateFormatterFullStyle];
            [self.view makeToast:dateString duration:3.0 position:@"center" title:@"eBay Official Time"];
        } else { // response residenet error
            Trading_ErrorType *error = [responseObject.errors objectAtIndex:0];
            [self.view makeToast:error.shortMessage duration:3.0 position:@"center" title:@"Error"];
        }
    } failure:^(NSError *error, id<PicoBindable> soapFault) {
        
        // stop progress activity
        [self.view hideToastActivity];
        
        if (error) {
            [self.view makeToast:[error localizedDescription] duration:3.0 position:@"center" title:@"Error"];
        } else if (soapFault) {
            SOAP11Fault *soap11Fault = (SOAP11Fault *)soapFault;
            [self.view makeToast:soap11Fault.faultstring duration:3.0 position:@"center" title:@"SOAP Fault"];
        }
    }];
    
}

@end
