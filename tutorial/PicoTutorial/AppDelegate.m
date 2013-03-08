//
//  AppDelegate.m
//  PicoTutorial
//
//  Created by bulldog on 13-3-8.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

#import "AppDelegate.h"
#import "Party.h"
#import "Player.h"
#import "PicoXMLReader.h"
#import "PicoXMLWriter.h"
#import "RPGClass.h"

@implementation AppDelegate

@synthesize party = _party;

- (void)dealloc
{
    self.party = nil;
    [_window release];
    [super dealloc];
}

+ (NSString *)dataFilePath:(BOOL)forSave {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *documentsPath = [documentsDirectory stringByAppendingPathComponent:@"Party.xml"];
    if (forSave || [[NSFileManager defaultManager] fileExistsAtPath:documentsPath]) {
        return documentsPath;
    } else {
        return [[NSBundle mainBundle] pathForResource:@"Party" ofType:@"xml"];
    }
    
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    NSString *filePath = [AppDelegate dataFilePath:FALSE];
    NSData *xmlData = [[NSMutableData alloc] initWithContentsOfFile:filePath];
    PicoXMLReader *xmlReader = [[[PicoXMLReader alloc] init] autorelease];
    self.party = [xmlReader fromData:xmlData withClass:[Party class]];
    if (_party != nil) {
        for(Player *player in _party.player) {
            NSLog(@"%@", player.name);
        }
        
        Player *newPlayer = [[Player alloc] init];
        newPlayer.name = @"Waldo";
        newPlayer.level = [NSNumber numberWithInt:1];
        newPlayer.clazz = RPGClass_RPG_CLASS_ROGUE;
        [_party.player addObject:newPlayer];
        [newPlayer release];
    }
    
    
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    PicoXMLWriter *xmlWriter = [[[PicoXMLWriter alloc] init] autorelease];
    NSData *xmlData = [xmlWriter toData:self.party];
    
    NSString *filePath = [AppDelegate dataFilePath:YES];
    NSLog(@"Saving xml data to %@...", filePath);
    [xmlData writeToFile:filePath atomically:YES];
}

@end
