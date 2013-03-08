//
//  AppDelegate.h
//  PicoTutorial
//
//  Created by user on 13-3-8.
//  Copyright (c) 2013年 Leansoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Party;

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    Party *_party;
}

@property (strong, nonatomic) UIWindow *window;
@property (retain, nonatomic) Party *party;


@end
