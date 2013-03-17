//
//  PicoSOAPReader.h
//  Pico
//
//  Created by bulldog on 13-3-13.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoXMLReader.h"

@interface PicoSOAPReader : PicoXMLReader

// Convert binary data to soap object
-(id)fromData:(NSData *)data withSOAPClass:(Class)soapClazz innerClass:(Class)innerClazz;

// Convert string to soap object
-(id)fromString:(NSString *)string withSOAPClass:(Class)clazz innerClass:(Class)innerClazz;

@end
