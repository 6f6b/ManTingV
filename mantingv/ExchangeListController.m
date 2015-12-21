//
//  ExchangeListController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/21.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ExchangeListController.h"
#import "ExchangeListContentScrollView.h"

@interface ExchangeListController ()
@property (nonatomic,weak) ExchangeListContentScrollView *exchangeListContentScrollView;
@end

@implementation ExchangeListController

- (void)viewDidLoad {
    [super viewDidLoad];
    ExchangeListContentScrollView *exchangeListContentScrollView = [[ExchangeListContentScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:exchangeListContentScrollView];
    exchangeListContentScrollView.controller = self;
    self.exchangeListContentScrollView = exchangeListContentScrollView;
    [self.exchangeListContentScrollView setValueWith:nil];
    
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
