//
//  PicoPropertySchema.h
//  Pico
//
//  Created by bulldog on 13-2-24.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PicoPropertySchema : NSObject {
    
    // property kind
    NSString *_propertyKind;
    // xml name
    NSString *_xmlName;
    // property name
    NSString *_propertyName;
    // property type
    NSString *_propertyType;
    // class name of the type
    Class _clazz;
}

@property (nonatomic, assign) NSString *propertyKind;
@property (nonatomic, assign) NSString *xmlName;
@property (nonatomic, assign) NSString *propertyName;
@property (nonatomic, assign) NSString *propertyType;
@property (nonatomic, assign) Class clazz;

-(id)initWithKind: (NSString *)pKind xmlName: (NSString *)xName propertyName: (NSString *)proName type: (NSString *)pType clazz: (Class)clz;

@end
