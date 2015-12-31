//
//  MTNavigationController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/3.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MTNavigationController.h"
#import "NSObject+AOP.h"
#import "MTLoginController.h"
#import "LoginController.h"

@interface MTNavigationController ()

@end

@implementation MTNavigationController

//- (id)init{
//    if (self = [super init]) {
//        self.navigationItem.hidesBackButton = YES;
//    }
//    return self;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //隐藏掉所有的navigationBar
    self.navigationBar.hidden = NO;

    self.navigationBar.tintColor = [UIColor blueColor];
    
}

#pragma mark - 加载这个控制器的时候交换里面的两个方法的指针
+ (void)load{
    [self exchangeMethodWithNewMethod:@selector(pushViewController:animated:) oldMethod:@selector(aopPushViewController:animated:)
     ];
}

#pragma mark - push 第二个界面的时候隐藏Tabbar pop回来的时候恢复Tabbar
//注意！ 需要在pop回来的时候显示出tabbar
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count>0) {
        viewController.hidesBottomBarWhenPushed = YES;
        
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"arrow_left_18.63670411985px_1190576_easyicon.net"] style:UIBarButtonItemStyleDone target:self action:@selector(popViewControllerAnimated:)];
        viewController.navigationItem.leftBarButtonItem = leftItem;
    }
    [super pushViewController:viewController animated:animated];
}


- (UIViewController *)popViewControllerAnimated:(BOOL)animated{
    if (1 == self.viewControllers.count) {
        self.hidesBottomBarWhenPushed = NO;
    }
    UIViewController *viewController = [super popViewControllerAnimated:animated];
    return viewController;
}

#pragma mark - push的时候检测是否登录 逻辑判断
- (void)aopPushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    //如果viewcontroller说明了不需要检测，也正常登录
    MTController *vc = (MTController *)viewController;
    if (!vc.isNeedToCheckLogin) {
        [self aopPushViewController:viewController animated:YES];
        return;
    }
    
    //检测是否登录，已经登录则正常push
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    id name = [user objectForKey:USER_GUID];
    if (name) {
        [self aopPushViewController:viewController animated:YES];
        return;
    }
    
    //未登录则push到登录页
    if (!name) {
        LoginController *login = [[LoginController alloc] init];
        login.willPushVC = (MTController *)viewController;
        [self aopPushViewController:login animated:YES];
    }
    
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
