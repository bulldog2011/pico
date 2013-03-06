//
//  BindingConstant.m
//  Pico
//
//  Created by bulldog on 13-2-24.
//  Copyright (c) 2013 Leansoft Technology. All rights reserved.
//

#import "PicoConstants.h"

// binding constants used by PICO framework

// PICO suppored types

// integer
NSString *const PICO_TYPE_INT = @"int";

// boolean
NSString *const PICO_TYPE_BOOL = @"bool";

// byte
NSString *const PICO_TYPE_BYTE = @"byte";

// char
NSString *const PICO_TYPE_CHAR = @"char";

// short
NSString *const PICO_TYPE_SHORT = @"short";

// long
NSString *const PICO_TYPE_LONG = @"long";

// float
NSString *const PICO_TYPE_FLOAT = @"float";

// double
NSString *const PICO_TYPE_DOUBLE = @"double";

// enum
NSString *const PICO_TYPE_ENUM = @"enum";

// date
NSString *const PICO_TYPE_DATE = @"date";

// duration
NSString *const PICO_TYPE_DURATION = @"duration";

// object
NSString *const PICO_TYPE_OBJECT = @"object";

// string
NSString *const PICO_TYPE_STRING = @"string";

// data
NSString *const PICO_TYPE_DATA = @"data";

// any element
NSString *const PICO_TYPE_ANYELEMENT = @"anyElement";


// PICO supported property kind

// map to xml attribute
NSString *const PICO_KIND_ATTRIBUTE = @"Attribute";

// map to xml element
NSString *const PICO_KIND_ELEMENT = @"Element";

// map to xml element array
NSString *const PICO_KIND_ELEMENT_ARRAY = @"ElementArray";

// map to xml text
NSString *const PICO_KIND_VALUE = @"Value";

// map to xml any element
NSString *const PICO_KIND_ANY_ELEMENT = @"AnyElement";

// meta-data method name

// method name to get class meta-data
NSString *const PICO_GET_CLASS_META_DATA_METHOD = @"getClassMetaData";

// method name to get property meta-data
NSString *const PICO_GET_PROPERTY_META_DATA_METHOD = @"getPropertyMetaData";


