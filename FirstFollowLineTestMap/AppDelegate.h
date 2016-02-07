//
//  AppDelegate.h
//  FirstFollowLineTestMap
//
//  Created by u212_pc3 on 13. 12. 11..
//  Copyright (c) 2013년 u212_pc3. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;


@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

@property (strong, nonatomic) UITabBarController *tabBarController;

@property (strong, nonatomic) UINavigationController *navi;



@end
