//
//  AppDelegate.m
//  mantingv
//
//  Created by LiuFeng on 15/12/3.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "AppDelegate.h"

#import "MTTabBarController.h"

#import <AlipaySDK/AlipaySDK.h>

#import "UMSocial.h"
#import "UMSocialWechatHandler.h"
#import "UMSocialQQHandler.h"
#import "UMSocialSinaSSOHandler.h"

#import <Bugly/CrashReporter.h>

@interface AppDelegate ()<UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    MTTabBarController *tbc = [[MTTabBarController alloc] init];
    tbc.delegate = self;
    self.window.rootViewController = tbc;
    
    
    
    [self registThirdPartSDK];
    return YES;
}

/**
 *  注册相关三方SDK
 *
 *  @param
 */
- (void)registThirdPartSDK{
    [UMSocialData setAppKey:@"56975b9467e58e3593001c47"];
    
    //设置微信AppId、appSecret，分享url
    [UMSocialWechatHandler setWXAppId:@"x91729efc43a30eac" appSecret:@"d4624c36b6795d1d99dcf0547af5443d" url:@"http://www.baidu.com"];
    
    //设置QQ
    [UMSocialQQHandler setQQWithAppId:@"1105041237" appKey:@"olGOvGo5pwd8lveq" url:@"http://www.baidu.com"];
    
    //设置新浪微博
    [UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:@"4121879963" RedirectURL:@"http://sns.whalecloud.com/sina2/callback"];
    
    //=======================================初始化bugly===========================//
    [[CrashReporter sharedInstance] installWithAppId:@"900017958"];
    [[CrashReporter sharedInstance] enableLog:YES];
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


- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    
    if ([url.host isEqualToString:@"safepay"]) {
        //跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"result = %@",resultDic);
        }];
    }
    
    BOOL result = [UMSocialSnsService handleOpenURL:url];
    if (result == FALSE) {
        //调用其他SDK，例如支付宝SDK等
    }
    return result;
    return YES;
}
@end
