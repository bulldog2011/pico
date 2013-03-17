//
//  PicoClassSchema.h
//  Pico
//
//  Created by bulldog on 13-2-24.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PicoClassSchema : NSObject {
    
@private
    // xml name
    NSString *_xmlName;
    // namespace URI
    NSString *_nsURI;
}

@property (nonatomic, assign) NSString *xmlName;
@property (nonatomic, assign) NSString *nsURI;

-(id)initWithXmlName:(NSString *)name nsUri: (NSString *)uri;

@end
