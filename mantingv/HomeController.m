//
//  HomeController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/3.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "HomeController.h"
#import "ContentScrollView.h"

@interface HomeController ()
@property (weak,nonatomic) ContentScrollView* contentScrollView;
@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建顶部搜索框
    UISearchBar *productSearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(10, 10, 80, 40)];
    productSearchBar.placeholder = @"请输入关键词";
    self.navigationItem.titleView = productSearchBar;
    
    //创建左边下弹城市列表按钮
    UIButton *homeCityListButton = [UIButton buttonWithType:UIButtonTypeCustom];
    homeCityListButton.frame = CGRectMake(0, 0, 50, 30);
    [homeCityListButton setTitle:@"成都" forState:UIControlStateNormal];
    [homeCityListButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[homeCityListButton setBackgroundColor:[UIColor blackColor]];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:homeCityListButton];
    
    ContentScrollView *contentScrollView = [[ContentScrollView alloc] initWithFrame:self.view.bounds];
    contentScrollView.backgroundColor = [UIColor whiteColor];
    self.contentScrollView = contentScrollView;
    self.contentScrollView.contentSize = CGSizeMake(ScreenWidth, 1000);
    [self.view addSubview:contentScrollView];
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
