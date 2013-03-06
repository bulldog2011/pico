//
//  PicoXMLReadHelper.m
//  pico
//
//  Created by bulldog on 13-2-26.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoXMLReadHelper.h"

@implementation PicoXMLReadHelper

@synthesize depth = _depth, buffer = _buffer, stack = _stack, isAnyElement = _isAnyElement;

-(id)init {
    self = [super init];
    if (self) {
        self.depth = 0;
        self.isAnyElement = NO;
        self.buffer = [[NSMutableString alloc] init];
        self.stack = [[NSMutableArray alloc] init];
    }
    return self;
}

- (BOOL) isRoot {
	return 1 == _depth && [self size] == 1;
}

- (void) clearBuffer {
	NSRange range = {0, [_buffer length]};
	[_buffer deleteCharactersInRange:range];
}

- (int) size {
	return _stack.count;
}

- (id) pop {
    if (_stack.count == 0) {
		@throw [NSException exceptionWithName:@"ReaderException" reason:[NSString stringWithFormat:@"Can not pop element from empty stack"] userInfo:nil];
	}
	int top = _stack.count - 1;
    id element = [_stack objectAtIndex:top];
    [_stack removeObjectAtIndex:top];
    return element;
}

- (id) peek {
	if (_stack.count == 0) {
		@throw [NSException exceptionWithName:@"ReaderException" reason:[NSString stringWithFormat:@"Can not peek element from empty stack"] userInfo:nil];
	}
	int top = _stack.count - 1;
	return [_stack objectAtIndex:top];
}

- (void) push:(id) element {
	[_stack addObject:element];
}

- (void) dealloc {
	self.buffer = nil;
    self.stack = nil;
	[super dealloc];
}

@end
