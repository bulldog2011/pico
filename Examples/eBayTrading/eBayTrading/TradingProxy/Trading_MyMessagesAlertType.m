// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "Trading_MyMessagesAlertType.h"
#import "Trading_MyMessagesResponseDetailsType.h"
#import "Trading_MyMessagesFolderType.h"
#import "Trading_MyMessagesForwardDetailsType.h"

@implementation Trading_MyMessagesAlertType

@synthesize sender = _sender;
@synthesize recipientUserID = _recipientUserID;
@synthesize subject = _subject;
@synthesize priority = _priority;
@synthesize alertID = _alertID;
@synthesize externalAlertID = _externalAlertID;
@synthesize contentType = _contentType;
@synthesize text = _text;
@synthesize resolutionStatus = _resolutionStatus;
@synthesize read = _read;
@synthesize creationDate = _creationDate;
@synthesize receiveDate = _receiveDate;
@synthesize expirationDate = _expirationDate;
@synthesize resolutionDate = _resolutionDate;
@synthesize lastReadDate = _lastReadDate;
@synthesize itemID = _itemID;
@synthesize isTimedResolution = _isTimedResolution;
@synthesize actionURL = _actionURL;
@synthesize responseDetails = _responseDetails;
@synthesize forwardDetails = _forwardDetails;
@synthesize folder = _folder;
@synthesize any = _any;

// class meta-data method
// note: this method is only for internal use, DO NOT CHANGE!
+(PicoClassSchema *)getClassMetaData {
    return nil;
}

// property meta-data method
// note: this method is only for internal use, DO NOT CHANGE!
+(NSMutableDictionary *)getPropertyMetaData {
    NSMutableDictionary *map = [NSMutableDictionary dictionary];
    
    PicoPropertySchema *ps = nil;
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"Sender" propertyName:@"sender" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"sender"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"RecipientUserID" propertyName:@"recipientUserID" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"recipientUserID"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"Subject" propertyName:@"subject" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"subject"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"Priority" propertyName:@"priority" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"priority"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"AlertID" propertyName:@"alertID" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"alertID"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"ExternalAlertID" propertyName:@"externalAlertID" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"externalAlertID"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"ContentType" propertyName:@"contentType" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"contentType"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"Text" propertyName:@"text" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"text"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"ResolutionStatus" propertyName:@"resolutionStatus" type:PICO_TYPE_ENUM clazz:nil];
    [map setObject:ps forKey:@"resolutionStatus"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"Read" propertyName:@"read" type:PICO_TYPE_BOOL clazz:nil];
    [map setObject:ps forKey:@"read"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"CreationDate" propertyName:@"creationDate" type:PICO_TYPE_DATE clazz:nil];
    [map setObject:ps forKey:@"creationDate"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"ReceiveDate" propertyName:@"receiveDate" type:PICO_TYPE_DATE clazz:nil];
    [map setObject:ps forKey:@"receiveDate"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"ExpirationDate" propertyName:@"expirationDate" type:PICO_TYPE_DATE clazz:nil];
    [map setObject:ps forKey:@"expirationDate"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"ResolutionDate" propertyName:@"resolutionDate" type:PICO_TYPE_DATE clazz:nil];
    [map setObject:ps forKey:@"resolutionDate"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"LastReadDate" propertyName:@"lastReadDate" type:PICO_TYPE_DATE clazz:nil];
    [map setObject:ps forKey:@"lastReadDate"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"ItemID" propertyName:@"itemID" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"itemID"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"IsTimedResolution" propertyName:@"isTimedResolution" type:PICO_TYPE_BOOL clazz:nil];
    [map setObject:ps forKey:@"isTimedResolution"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"ActionURL" propertyName:@"actionURL" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"actionURL"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"ResponseDetails" propertyName:@"responseDetails" type:PICO_TYPE_OBJECT clazz:[Trading_MyMessagesResponseDetailsType class]];
    [map setObject:ps forKey:@"responseDetails"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"ForwardDetails" propertyName:@"forwardDetails" type:PICO_TYPE_OBJECT clazz:[Trading_MyMessagesForwardDetailsType class]];
    [map setObject:ps forKey:@"forwardDetails"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"Folder" propertyName:@"folder" type:PICO_TYPE_OBJECT clazz:[Trading_MyMessagesFolderType class]];
    [map setObject:ps forKey:@"folder"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ANY_ELEMENT xmlName:@"any" propertyName:@"any" type:PICO_TYPE_ANYELEMENT clazz:nil];
    [map setObject:ps forKey:@"any"];
    [ps release];
    
    return map;
}



-(void)dealloc {
    self.sender = nil;
    self.recipientUserID = nil;
    self.subject = nil;
    self.priority = nil;
    self.alertID = nil;
    self.externalAlertID = nil;
    self.contentType = nil;
    self.text = nil;
    self.resolutionStatus = nil;
    self.read = nil;
    self.creationDate = nil;
    self.receiveDate = nil;
    self.expirationDate = nil;
    self.resolutionDate = nil;
    self.lastReadDate = nil;
    self.itemID = nil;
    self.isTimedResolution = nil;
    self.actionURL = nil;
    self.responseDetails = nil;
    self.forwardDetails = nil;
    self.folder = nil;
    self.any = nil;
    [super dealloc];
}

@end
