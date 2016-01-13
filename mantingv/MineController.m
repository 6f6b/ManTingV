//
//  MineController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/3.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MineController.h"
#import "LoginController.h"
#import "MineContentScrollView.h"

@interface MineController ()
@property (nonatomic,weak) MineContentScrollView *mineContentScrollView;
@end

@implementation MineController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    
    self.title = @"我的";
    self.view.frame = CGRectMake(0, -20, SCREEN_WIDTH, SCREEN_HEIGHT);
    MineContentScrollView *mineContentScrollView = [[MineContentScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:mineContentScrollView];
    mineContentScrollView.backgroundColor = [UIColor whiteColor];
    self.mineContentScrollView = mineContentScrollView;
    self.mineContentScrollView.controller = self;
//    [self.mineContentScrollView setValueWith:nil];
    // Do any additional setup after loading the view from its nib.
}

/**
 *  每次界面出现的时候刷新用户数据
 *
 *  @param animated
 */
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.mineContentScrollView setValueWith:nil];
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
