//
//  MTLoginController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/16.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MTLoginController.h"
#import "MTLoginContentScrollVIew.h"

@interface MTLoginController ()
@property (nonatomic,weak) MTLoginContentScrollVIew *loginContentScrollView;
@end

@implementation MTLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    MTLoginContentScrollVIew *loginContentScrollView = [[MTLoginContentScrollVIew alloc] initWithFrame:self.view.bounds];
    loginContentScrollView.controller = self;
    loginContentScrollView.contentSize = CGSizeMake(0, self.view.frame.size.height);
    [self.view addSubview:loginContentScrollView];
    self.loginContentScrollView = loginContentScrollView;
    
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
