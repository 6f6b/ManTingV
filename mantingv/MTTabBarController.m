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
    self.tabBar.tintColor = [UIColor colorWithRed:0/255.0 green:177/255.0 blue:168/255.0 alpha:1.000];
    
    //创建首页
    HomeController *home = [[HomeController alloc] init];
    [self setViewControllerWith:home title:@"首页" itemImage:@"icon_tab1_normal@2x" selectedImage:@"icon_tab1_selected@2x"];
    
    
    //创建产品页
    ProductController *product = [[ProductController alloc] init];
    [self setViewControllerWith:product title:@"产品" itemImage:@"icon_tab2_normal@2x" selectedImage:@"icon_tab2_selected@2x"];
    
    
    //创建短租页
    ShortRentController *shortRent = [[ShortRentController alloc] init];
    [self setViewControllerWith:shortRent title:@"短租" itemImage:@"icon_tab3_normal@2x" selectedImage:@"icon_tab3_selected@2x"];
    
//    //创建产权中心页
//    PropertyRightCenterController *propertyRC = [[PropertyRightCenterController alloc] init];
//    [self setViewControllerWith:propertyRC title:@"产权中心" itemImage:@"down"];
    
    //创建我的页
    MineController *mine = [[MineController alloc] init];
   [self setViewControllerWith:mine title:@"我的" itemImage:@"icon_tab4_normal@2x" selectedImage:@"icon_tab4_selected@2x"];

    self.delegate = self;

}

- (MTNavigationController *)setViewControllerWith:(UIViewController *)controller title:(NSString *)title itemImage:(NSString *)imageName selectedImage:(NSString *)selectedImage{
    MTNavigationController *NAV = [[MTNavigationController alloc] initWithRootViewController:controller];
    controller.title = title;
//    //使navigationbar背景透明
//    [NAV.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
//    
//    
//    //插入背景图片
//    UIImageView *imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"navigationbar_backimage"]];
//    imageview.frame = CGRectMake(0, -20, SCREEN_WIDTH, 64);
//    [NAV.navigationBar insertSubview:imageview atIndex:0];
    [NAV.navigationBar setBarTintColor:[UIColor colorWithRed:0/255.0 green:177/255.0 blue:168/255.0 alpha:1.0]];
    [NAV.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    [NAV.tabBarItem setImage:[UIImage imageNamed:imageName]];
    [NAV.tabBarItem setSelectedImage:[UIImage imageNamed:selectedImage]];
    [self addChildViewController:NAV];
    return NAV;
}




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
