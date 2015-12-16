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

#import "LoginController.h"

@interface AppDelegate ()<UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //创建首页
    HomeController *home = [[HomeController alloc] init];
    //[self configControllerWith:home title:@"首页"];
    MTNavigationController *homeNav = [[MTNavigationController alloc] initWithRootViewController:home];
    homeNav.navigationBar.hidden = NO;
    homeNav.title = @"首页";
    [homeNav.tabBarItem setImage:[UIImage imageNamed:@"down"]];

    
    //创建产品页
    ProductController *product = [[ProductController alloc] init];
    MTNavigationController *productNav = [[MTNavigationController alloc] initWithRootViewController:product];
    productNav.navigationBar.hidden = NO;
    productNav.title = @"产品";
    [productNav.tabBarItem setImage:[UIImage imageNamed:@"down"]];
    
    //创建短租页
    ShortRentController *shortRent = [[ShortRentController alloc] init];
    MTNavigationController *shortRentNav = [[MTNavigationController alloc] initWithRootViewController:shortRent];
    shortRentNav.title = @"短租";
    [shortRentNav.tabBarItem setImage:[UIImage imageNamed:@"down"]];
    
    //创建产权中心页
    PropertyRightCenterController *propertyRC = [[PropertyRightCenterController alloc] init];
    MTNavigationController *propertyRCNav = [[MTNavigationController alloc] initWithRootViewController:propertyRC];
    propertyRCNav.title = @"产权中心";
    [propertyRCNav.tabBarItem setImage:[UIImage imageNamed:@"down"]];
    
    //创建我的页
    MineController *mine = [[MineController alloc] init];
    MTNavigationController *mineNAV = [[MTNavigationController alloc] initWithRootViewController:mine];
    mineNAV.title = @"我的";
    [mineNAV.tabBarItem setImage:[UIImage imageNamed:@"down"]];
    
    //创建TabBarController控制器
    MTTabBarController *tbc = [[MTTabBarController alloc] init];
    tbc.delegate = self;
    tbc.viewControllers = @[homeNav,productNav,shortRentNav,propertyRCNav,mineNAV];
    self.window.rootViewController = tbc;
    
    
    return YES;
}

//实现tabbarcontroller代理方法，判断是否登录，已经登录则直接到“我的”界面，否则push到登录界面
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    //如果不是点击的 我的 item，则不必进行判断
    if (![viewController.tabBarItem.title isEqualToString:@"我的"]) {
        return YES;
    }
    
    //判断，如果已经登录则正常返回YES
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    if ([user objectForKey:@"seraccount"]) {
        return YES;
    }
    
    //判断，如果没登录则跳转到登录界面
        //1.如果没登录成功则提示错误，并且停留在登录界面
        //2.如果登录成功，则直接跳到 我的 界面？
//    if(![user objectForKey:@"seraccount"]){
//        NSLog(@"%@",tabBarController.selectedViewController);
//        NSLog(@"%@",NSStringFromClass([viewController class]));
//        
//        MTNavigationController *nav = viewController;
//        MTController *vc = [nav.viewControllers objectAtIndex:0];
//        
//        LoginController *login = [[LoginController alloc] init];
//        login.willPushVC = vc;
//        login.hidesBottomBarWhenPushed = YES;
//        
//        [(MTNavigationController *)tabBarController.selectedViewController pushViewController:login animated:YES];
//        return NO;
//    }
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
