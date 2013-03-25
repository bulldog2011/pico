//
//  PicoXMLElement.m
//  pico
//
//  Created by bulldog on 13-3-4.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoXMLElement.h"

@implementation PicoXMLElement

@synthesize parent = _parent;
@synthesize name = _name;
@synthesize nsUri = _nsUri;
@synthesize value = _value;
@synthesize children = _children;
@synthesize attributes = _attributes;

- (NSString *)descriptionWithIndent:(NSString *)indent {
    
	NSMutableString *s = [NSMutableString string];
	[s appendFormat:@"%@<%@", indent, _name];
	
	for (NSString *attribute in _attributes)
		[s appendFormat:@" %@=\"%@\"", attribute, [_attributes objectForKey:attribute]];
    
	NSString *trimVal = [_value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
	if (trimVal.length > 25)
		trimVal = [NSString stringWithFormat:@"%@…", [trimVal substringToIndex:25]];
	
	if (_children.count) {
		[s appendString:@">\n"];
		
		NSString *childIndent = [indent stringByAppendingString:@"  "];
		
		if (trimVal.length)
			[s appendFormat:@"%@%@\n", childIndent, trimVal];
        
		for (PicoXMLElement *child in _children)
			[s appendFormat:@"%@\n", [child descriptionWithIndent:childIndent]];
		
		[s appendFormat:@"%@</%@>", indent, _name];
	}
	else if (trimVal.length) {
		[s appendFormat:@">%@</%@>", trimVal, _name];
	}
	else [s appendString:@"/>"];
	
	return s;	
}

- (NSString *)description {
	return [self descriptionWithIndent:@""];
}

-(void)dealloc {
	
    self.parent = nil;
	self.name = nil;
	self.value = nil;
	self.children = nil;
	self.attributes = nil;
	[super dealloc];
	
}

@end
