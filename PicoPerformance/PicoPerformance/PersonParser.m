//
//  PersonParser.m
//  PicoPerformance
//
//  Created by bulldog on 13-3-10.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

#import "PersonParser.h"
#import "PersonListType.h"
#import "PersonType.h"

static NSNumberFormatter *formatter = nil;

@implementation PersonParser

@synthesize personList = _personList;

+ (void) initialize {
    if (formatter == nil) {
        formatter = [[NSNumberFormatter alloc] init];
        formatter.locale = [NSLocale currentLocale];
    }
}

-(PersonParser *)initPersonParser {
    self = [super init];
    if (self) {
        // init array of person objects;
        _personList = [[PersonListType alloc] init];
        _personList.person = [NSMutableArray array];
    }
    return self;
}

- (void) parser:(NSXMLParser *)parser didStartElement:(NSString *) elementName
   namespaceURI:(NSString *)namespaceURI qualifiedName: (NSString *) qName attributes:(NSDictionary *) attrDic {
    
    [_currentElementValue release];
    _currentElementValue = nil;
    
    if ([elementName isEqualToString:@"person"]) {
        _person = [[PersonType alloc] init];
        NSString *idString = [attrDic objectForKey:@"id"];
        if (idString) {
            _person.id = [formatter numberFromString:idString];
        }
    }
    
}



- (void) parser:(NSXMLParser *)parser didEndElement:(NSString *) elementName namespaceURI:(NSString *)namespaceURI qualifiedName: (NSString *)qName {
    if ([elementName isEqualToString:@"persons"]) {
        // We reached the end of the XML doc
        return;
    }
    
    if ([elementName isEqualToString:@"person"]) {
        // We are done with person entry - add the parsed person
        // object to our person list array
        [_personList.person addObject:_person];
        // release person object
        [_person release];
        _person = nil;
    } else {
        // The parser hit one of the element values.
        // This syntax is possible because PersonType object
        // property names match the XML person element names
        [_person setValue:_currentElementValue forKey:elementName];
    }
    [_currentElementValue release];
    _currentElementValue = nil;
}


- (void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if (!_currentElementValue) {
        // init the ad hoc string with the value
        _currentElementValue = [[NSMutableString alloc] initWithString:string];
    } else {
        [_currentElementValue appendString:string];
    }
}

-(void) dealloc {
    [_personList release];
    [_person release];
    [_currentElementValue release];
    [super dealloc];
}

@end
