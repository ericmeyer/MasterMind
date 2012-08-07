//
//  AppDelegate.h
//  MasterMind
//
//  Created by Eric Meyer on 4/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MMMainGameViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) MMMainGameViewController *viewController;

@end
