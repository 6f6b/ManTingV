//
//  AppDelegate.m
//  mantingv
//
//  Created by LiuFeng on 15/12/3.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "AppDelegate.h"
#import "MTNavigationController.h"
#import "MTTabBarController.h"
#import "HomeController.h"
#import "ProductController.h"
#import "ShortRentController.h"
#import "PropertyRightCenterController.h"
#import "MineController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //创建首页
    HomeController *home = [[HomeController alloc] init];
    //[self configControllerWith:home title:@"首页"];
    MTNavigationController *homeNav = [[MTNavigationController alloc] initWithRootViewController:home];
    homeNav.navigationBar.hidden = NO;
    homeNav.title = @"首页";
    
    //创建产品页
    ProductController *product = [[ProductController alloc] init];
    MTNavigationController *productNav = [[MTNavigationController alloc] initWithRootViewController:product];
    productNav.navigationBar.hidden = NO;
    productNav.title = @"产品";
    
    //创建短租页
    ShortRentController *shortRent = [[ShortRentController alloc] init];
    MTNavigationController *shortRentNav = [[MTNavigationController alloc] initWithRootViewController:shortRent];
    shortRentNav.title = @"短租";
    
    //创建产权中心页
    PropertyRightCenterController *propertyRC = [[PropertyRightCenterController alloc] init];
    MTNavigationController *propertyRCNav = [[MTNavigationController alloc] initWithRootViewController:propertyRC];
    propertyRCNav.title = @"产权中心";
    
    //创建我的页
    MineController *mine = [[MineController alloc] init];
    MTNavigationController *mineNAV = [[MTNavigationController alloc] initWithRootViewController:mine];
    mineNAV.title = @"我的";
    
    //创建TabBarController控制器
    MTTabBarController *tbc = [[MTTabBarController alloc] init];
    tbc.viewControllers = @[homeNav,productNav,shortRentNav,propertyRCNav,mineNAV];
    self.window.rootViewController = tbc;
    
    
    return YES;
}

- (void)configControllerWith:(UIViewController *)controller title:(NSString *)title{
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
