//
//  AppDelegate.m
//  FirstFollowLineTestMap
//
//  Created by u212_pc3 on 13. 12. 11..
//  Copyright (c) 2013년 u212_pc3. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

#import "SecondViewController.h"

#import "ThirdViewController.h"

@implementation AppDelegate
@synthesize navi;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    UIViewController *viewController1 = [[ViewController alloc]initWithNibName:@"ViewController" bundle:nil];
    UINavigationController *firstViewNavi = [[UINavigationController alloc]initWithRootViewController:viewController1];
    UIViewController *viewController2 = [[SecondViewController alloc]initWithNibName:@"SecondViewController" bundle:nil];
    UINavigationController *secondViewNavi = [[UINavigationController alloc]initWithRootViewController:viewController2];
    UIViewController *viewController3 = [[ThirdViewController alloc]initWithNibName:@"ThirdViewController" bundle:nil];
    UINavigationController *thirdViewNavi = [[UINavigationController alloc]initWithRootViewController:viewController3];
    self.tabBarController = [[UITabBarController alloc]init];
    self.tabBarController.viewControllers = @[firstViewNavi, secondViewNavi, thirdViewNavi];
    self.window.rootViewController = self.tabBarController;
    
    //self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    //self.window.rootViewController = self.viewController;
    
    //self.navi = [[UINavigationController alloc]initWithRootViewController:self.tableViewController];
    [self.window addSubview:navi.view];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
