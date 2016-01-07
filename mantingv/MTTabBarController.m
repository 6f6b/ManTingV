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
    [self setViewControllerWith:home title:@"首页" itemImage:@"down"];
    
    
    //创建产品页
    ProductController *product = [[ProductController alloc] init];
    [self setViewControllerWith:product title:@"产品" itemImage:@"down"];
    
    
    //创建短租页
    ShortRentController *shortRent = [[ShortRentController alloc] init];
    [self setViewControllerWith:shortRent title:@"短租" itemImage:@"down"];
    
    //创建产权中心页
    PropertyRightCenterController *propertyRC = [[PropertyRightCenterController alloc] init];
    [self setViewControllerWith:propertyRC title:@"产权中心" itemImage:@"down"];
    
    //创建我的页
    MineController *mine = [[MineController alloc] init];
   [self setViewControllerWith:mine title:@"我的" itemImage:@"down"];

    self.delegate = self;

}

- (MTNavigationController *)setViewControllerWith:(UIViewController *)controller title:(NSString *)title itemImage:(NSString *)imageName{
    MTNavigationController *NAV = [[MTNavigationController alloc] initWithRootViewController:controller];
    NAV.title =title;
    [NAV.tabBarItem setImage:[UIImage imageNamed:imageName]];
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
