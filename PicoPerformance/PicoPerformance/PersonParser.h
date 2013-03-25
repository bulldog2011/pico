//
//  PersonParser.h
//  PicoPerformance
//
//  Created by bulldog on 13-3-10.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PersonType;
@class PersonListType;

@interface PersonParser : NSObject<NSXMLParserDelegate> {
    // an ad hoc string to hold element value
    NSMutableString *_currentElementValue;
    // Person object
    PersonType *_person;
    // person list
    PersonListType *_personList;
}

@property (nonatomic, readonly) PersonListType *personList;

-(PersonParser *)initPersonParser;

@end
