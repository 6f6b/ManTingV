//
//  MTNavigationController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/3.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MTNavigationController.h"

@interface MTNavigationController ()

@end

@implementation MTNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //隐藏掉所有的navigationBar
    self.navigationBar.hidden = YES;

    self.navigationBar.tintColor = [UIColor blueColor];
    
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
