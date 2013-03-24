//
//  DetailsViewController.m
//  AWSECDemoApp
//
//  Created by bulldog on 13-3-23.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

#import "DetailsViewController.h"
#import "UIImageView+AFNetworking.h"
#import "CommonTypes.h"
#import "Toast+UIView.h"
#import "AWSECommerceServiceClient.h"
#import "SOAP11Fault.h"

#import "CartViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

static UIImageView *afImageView;

+(void) initialize {
    afImageView = [[UIImageView alloc] init];
}

- (void)viewWillAppear:(BOOL)animated
{
    
    self.title = @"Item Details";
    
    self.titleLabel.text = self.item.itemAttributes.title;
    self.titleLabel.numberOfLines = 0; // for wrapping
    self.listPriceLabel.text = self.item.itemAttributes.listPrice.formattedPrice;
    self.bindingLabel.text = self.item.itemAttributes.binding;
    self.editionLabel.text = self.item.itemAttributes.edition;
    self.publisherLabel.text = self.item.itemAttributes.publisher;
    self.publicationDateLabel.text = self.item.itemAttributes.publicationDate;
    NSString *firstAuthor = [self.item.itemAttributes.author objectAtIndex:0];
    self.authorLabel.text = firstAuthor;
    
    // async image loading
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.item.mediumImage.url]];
    [afImageView setImageWithURLRequest: request placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        if (image) {
            self.imageView.image = image;
        }
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        // do nothing
    }];
    
    UIBarButtonItem *rightbarButton = [[UIBarButtonItem alloc] initWithTitle:@"Add to Cart" style:UIBarButtonItemStyleBordered target:self action:@selector(addToCart)];
	[self navigationItem].rightBarButtonItem = rightbarButton;
    
    [super viewWillAppear:animated];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillDisappear:(BOOL)animated
{
    [afImageView cancelImageRequestOperation];
    self.imageView.image = nil;
    
    [super viewWillDisappear:animated];
}

-(void)addToCart {
    
    if (![self checkAvailibility]) {
        [self.view makeToast:@"Can't add to cart, item not available" duration:3.0 position:@"center" title:@"Availibility Error"];
        return;
    }
    
    // start progress activity
    [self.view makeToastActivity];
    
    // get shared client
    AWSECommerceServiceClient *client = [AWSECommerceServiceClient sharedClient];
    client.debug = YES;
    
    // create request
    CartCreate *request = [[[CartCreate alloc] init] autorelease];
    request.associateTag = @"tag";
    
    CartCreateRequest *cartCreateRequest = [[[CartCreateRequest alloc] init] autorelease];
    cartCreateRequest.items = [[[CartCreateItems alloc] init] autorelease];
    cartCreateRequest.items.item = [NSMutableArray array];
    CartCreateItem *cartCreateItem = [[[CartCreateItem alloc] init] autorelease];
    cartCreateItem.asin = self.item.asin;
    cartCreateItem.quantity = [NSNumber numberWithInt:1];
    [cartCreateRequest.items.item addObject:cartCreateItem];
    
    request.shared = cartCreateRequest;
    request.shared.responseGroup = [NSMutableArray arrayWithObjects:@"Cart",nil];
    
    // authenticate the request
    // see : http://docs.aws.amazon.com/AWSECommerceService/latest/DG/NotUsingWSSecurity.html
    [client authenticateRequest:@"CartCreate"];
    // make API call with registered callbacks
    [client cartCreate:request success:^(CartCreateResponse *responseObject) {
        // stop progress activity
        [self.view hideToastActivity];
        
        // success handling logic
        Cart *cart = [responseObject.cart objectAtIndex:0];
        if (cart) {
            if ([@"True" isEqualToString:cart.request.isValid]) {
                if (!self.cartViewController) {
                    self.cartViewController = [[CartViewController alloc] initWithNibName:@"CartView" bundle:nil];
                }
                self.cartViewController.cart = cart;
                [self.navigationController pushViewController:self.cartViewController animated:YES];
            } else {
                [self.view makeToast:@"Invalid request" duration:3.0 position:@"center" title:@"Error"];
            }
        } else {
            [self.view makeToast:@"No Result" duration:3.0 position:@"center" title:@"Error"];
        }
        
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

-(BOOL)checkAvailibility {
    Offers *offers = self.item.offers;
    if ([offers.totalOffers longValue] > 0) {
        Offer *offer = [offers.offer objectAtIndex:0];
        OfferListing *offerListing = [offer.offerListing objectAtIndex:0];
        if (offerListing.availability) {
            return YES;
        }
    }
    return NO;
}

-(void)dealloc {
    self.titleLabel = nil;
    self.authorLabel = nil;
    self.listPriceLabel = nil;
    self.imageView = nil;
    self.item = nil;
    
    [super dealloc];
}

@end
