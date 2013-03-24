//
//  ViewController.m
//  BarCode
//
//  Created by bulldog on 13-3-20.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

#import "ViewController.h"
#import "BarCodeServiceClient.h"
#import "CommonTypes.h"
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
    self.dataToEncode = nil;
    self.barcodeImage = nil;
    self.activityIndicator = nil;
    
    [super viewDidUnload];
}

#pragma mark - UI Event Handlers
-(IBAction)buttonPressed:(id)sender {
    if (!self.dataToEncode.text.length)
    {
        UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"Invalid Parameters" message:@"Please enter valid data to encode and try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        return;
    }
    
    
    [self.activityIndicator setHidden:NO];
    [self.activityIndicator startAnimating];
    
    // get shared client
    BarCodeServiceClient *client = [BarCodeServiceClient sharedClient];
    client.debug = YES; // enable message logging
    
    // build request
    BarCodeData *barCodeData = [[[BarCodeData alloc] init] autorelease];
    barCodeData.height = [NSNumber numberWithInt:125];
    barCodeData.width = [NSNumber numberWithInt:225];
    barCodeData.angle = [NSNumber numberWithInt:0];
    barCodeData.ratio = [NSNumber numberWithInt:5];
    barCodeData.module = [NSNumber numberWithInt:0];
    barCodeData.left = [NSNumber numberWithInt:25];
    barCodeData.top = [NSNumber numberWithInt:0];
    barCodeData.checkSum = [NSNumber numberWithBool:NO];
    barCodeData.fontName = @"Arial";
    barCodeData.barColor = @"Black";
    barCodeData.bgColor = @"White";
    barCodeData.fontSize = [NSNumber numberWithFloat:10.0];
    barCodeData.barcodeOption = BarcodeOption_BOTH;
    barCodeData.barcodeType = BarcodeType_CODE_2_5_INTERLEAVED;
    barCodeData.checkSumMethod = CheckSumMethod_NONE;
    barCodeData.showTextPosition = ShowTextPosition_BOTTOM_CENTER;
    barCodeData.barCodeImageFormat = ImageFormats_PNG;
    
    GenerateBarCode *request = [[[GenerateBarCode alloc] init] autorelease];
    request.barCodeParam = barCodeData;
    request.barCodeText = self.dataToEncode.text;
    
    // make API call with callback registration
    [client generateBarCode:request success:^(GenerateBarCodeResponse *responseObject) {
        [self.activityIndicator stopAnimating];
        
        // handle success
        UIImage *barcodeImage = [UIImage imageWithData:[responseObject generateBarCodeResult]];
        self.barcodeImage.image = barcodeImage;
        
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
