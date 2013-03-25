//
//  ViewController.m
//  Weather
//
//  Created by bulldog on 13-3-20.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

#import "ViewController.h"
#import "WeatherServiceClient.h"
#import "CommonTypes.h"
#import "SOAP11Fault.h"

#import "Toast+UIView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    // Create a text field for the user input.
    _queryText = [[UITextField alloc] initWithFrame:CGRectMake(5.0f, 10.0f, 240.0f, 30.0f)];
    _queryText.placeholder = @"<Enter zip to query>";
    _queryText.textAlignment = NSTextAlignmentLeft;
    _queryText.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_queryText];
    [_queryText release];
    
    // Create a search button that will trigger the search.
    _queryButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _queryButton.frame = CGRectMake(250.0f, 10.0f, 65.0f, 30.0f);
    [_queryButton setTitle:@"Query" forState:UIControlStateNormal];
    [_queryButton addTarget:self action:@selector(queryButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_queryButton];
    
    // Create a text view in which we will display the search results.
    _queryResults = [[UITextView alloc] initWithFrame:CGRectMake(5.0f, 50.0f, 310.0f, 400.0f)];
    _queryResults.editable = NO;
    [self.view addSubview:_queryResults];
    
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
    [_queryText release];
    [_queryButton release];
    [_queryResults release];
}

- (void)queryButtonPressed:(id)sender {
    
    // Hide the keyboard.
    [_queryText resignFirstResponder];
    
    // validate input
    if (!_queryText.text.length)
    {
        UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"Invalid Parameters" message:@"Please enter valid zip to query and try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        return;
    }
    
    // start progress activity
    [self.view makeToastActivity];
    
    WeatherServiceClient *client = [WeatherServiceClient sharedClient];
    client.debug = YES; // enable message logging
    
    // build reqeust
    GetCityWeatherByZIP *request = [[[GetCityWeatherByZIP alloc] init] autorelease];
    request.zip = _queryText.text;
    
    // make API call with registered callbacks
    [client getCityWeatherByZIP:request success:^(GetCityWeatherByZIPResponse *responseObject) {
        // stop progress activity
        [self.view hideToastActivity];
        
        WeatherReturn *weatherReturn = responseObject.getCityWeatherByZIPResult;
        
        // success handling logic
        if (weatherReturn.success.boolValue == YES) {
        
            NSMutableDictionary *resultDict = [NSMutableDictionary dictionary];
            [resultDict setObject:weatherReturn.weatherStationCity forKey:@"City"];
            [resultDict setObject:weatherReturn.description forKey:@"Conditions"];
            [resultDict setObject:weatherReturn.temperature forKey:@"Temperature"];
            [resultDict setObject:weatherReturn.relativeHumidity forKey:@"RelativeHumidity"];
            [resultDict setObject:weatherReturn.wind forKey:@"Wind"];
            
            // show result
            _queryResults.text = [resultDict description];
            
        } else {
            // response resident error
            [self.view makeToast:weatherReturn.responseText duration:3.0 position:@"center" title:@"Failure"];
        }
        
    } failure:^(NSError *error, id<PicoBindable> soapFault) {
        
        // stop progress activity
        [self.view hideToastActivity];
        
        // error handling logic
        if (error) { // http or parsing error
            [self.view makeToast:[error localizedDescription] duration:3.0 position:@"center" title:@"Error"];
        } else if (soapFault) { // soap fault
            SOAP11Fault *soap11Fault = (SOAP11Fault *)soapFault;
            [self.view makeToast:soap11Fault.faultstring duration:3.0 position:@"center" title:@"SOAP Fault"];
        }
        
    }];
}

@end
