//
//  PicoXMLReadHelper.h
//  pico
//
//  Created by bulldog on 13-2-26.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

@interface PicoXMLReadHelper : NSObject {
@private
    int _depth;
    NSMutableString *_buffer;
    NSMutableArray *_stack;
    BOOL _isAnyElement;

}

@property (nonatomic, assign) int depth;
@property (nonatomic, retain) NSMutableString *buffer;
@property (nonatomic, retain) NSMutableArray *stack;
@property (nonatomic, assign) BOOL isAnyElement;

-(BOOL)isRoot;

-(void)clearBuffer;

-(id)pop;

-(id)peek;

-(void)push:(id) element;

-(int)size;

@end
