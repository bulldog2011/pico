//
//  PicoXMLElement.h
//  pico
//
//  Created by bulldog on 13-3-4.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

@interface PicoXMLElement : NSObject {

@private
    PicoXMLElement *_parent; // nonretained
    NSString *_name; // element name
    NSString *_nsUri; // element namespace
    NSString *_value; // element text if any
    NSMutableArray *_children; // children of the element
    NSDictionary *_attributes; // attributes of the element
}

@property (nonatomic, assign) PicoXMLElement *parent;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *nsUri;
@property (nonatomic, retain) NSString *value;
@property (nonatomic, retain) NSMutableArray *children;
@property (nonatomic, retain) NSDictionary *attributes;

@end
