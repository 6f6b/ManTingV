//
//  MTTabBarController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/3.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MTTabBarController.h"
#import "MTNavigationController.h"
#import "MTTabBarController.h"
#import "HomeController.h"
#import "ProductController.h"
#import "ShortRentController.h"
#import "PropertyRightCenterController.h"
#import "MineController.h"
#import "MTLoginController.h"

@interface MTTabBarController ()<UITabBarControllerDelegate>

@end

@implementation MTTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建首页
    HomeController *home = [[HomeController alloc] init];
    MTNavigationController *homeNav = [self setViewControllerWith:home title:@"首页" itemImage:@"down"];
    
    
    //创建产品页
    ProductController *product = [[ProductController alloc] init];
    MTNavigationController *productNav = [self setViewControllerWith:product title:@"产品" itemImage:@"down"];
    
    
    //创建短租页
    ShortRentController *shortRent = [[ShortRentController alloc] init];
    MTNavigationController *shortRentNav = [self setViewControllerWith:shortRent title:@"短租" itemImage:@"down"];
    
    //创建产权中心页
    PropertyRightCenterController *propertyRC = [[PropertyRightCenterController alloc] init];
    MTNavigationController *propertyRCNav = [self setViewControllerWith:propertyRC title:@"产权中心" itemImage:@"down"];
    
    //创建我的页
    MineController *mine = [[MineController alloc] init];
    MTNavigationController *mineNAV = [self setViewControllerWith:mine title:@"我的" itemImage:@"down"];

    
//    MineController *mine = [[MineController alloc] init];
//    MTNavigationController *mineNAV = [self setViewControllerWith:mine title:@"我的" itemImage:@"down"];
//    mineNAV.navigationBarHidden = YES;
    
//    self.viewControllers = @[homeNav,productNav,shortRentNav,propertyRCNav,mineNAV];
    self.delegate = self;

}

- (MTNavigationController *)setViewControllerWith:(UIViewController *)controller title:(NSString *)title itemImage:(NSString *)imageName{
    MTNavigationController *NAV = [[MTNavigationController alloc] initWithRootViewController:controller];
    NAV.title =title;
    [NAV.tabBarItem setImage:[UIImage imageNamed:imageName]];
    [self addChildViewController:NAV];
    return NAV;
}

////实现tabbarcontroller代理方法，判断是否登录，已经登录则直接到“我的”界面，否则push到登录界面
//- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
//    //如果不是点击的 我的 item，则不必进行判断
//    if (![viewController.tabBarItem.title isEqualToString:@"我的"]) {
//        return YES;
//    }
//    
//    //判断，如果已经登录则正常返回YES
//    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
//    if ([user objectForKey:@"seraccount"]) {
//        return YES;
//    }
//    
//    //判断，如果没登录则跳转到登录界面
//    //1.如果没登录成功则提示错误，并且停留在登录界面
//    //2.如果登录成功，则直接跳到 我的 界面？
//    //    if(![user objectForKey:@"seraccount"]){
//    //        NSLog(@"%@",tabBarController.selectedViewController);
//    //        NSLog(@"%@",NSStringFromClass([viewController class]));
//    //
//    //        MTNavigationController *nav = viewController;
//    //        MTController *vc = [nav.viewControllers objectAtIndex:0];
//    //
//    //        LoginController *login = [[LoginController alloc] init];
//    //        login.willPushVC = vc;
//    //        login.hidesBottomBarWhenPushed = YES;
//    //
//    //        [(MTNavigationController *)tabBarController.selectedViewController pushViewController:login animated:YES];
//    //        return NO;
//    //    }
//    return YES;
//}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
