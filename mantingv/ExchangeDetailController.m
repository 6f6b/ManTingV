//
//  ExchangeDetailController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/21.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ExchangeDetailController.h"
#import "ExchangeDetailContentScrollView.h"

@interface ExchangeDetailController ()
@property (nonatomic,weak) ExchangeDetailContentScrollView *exchangeDetailContentScrollView;
@end

@implementation ExchangeDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.exchangeDetailContentScrollView setValueWith:nil];
    // Do any additional setup after loading the view.
}

- (ExchangeDetailContentScrollView *)exchangeDetailContentScrollView{
    if (nil == _exchangeDetailContentScrollView) {
        ExchangeDetailContentScrollView *exchangeDetailContentScrollView = [[ExchangeDetailContentScrollView alloc] initWithFrame:self.view.bounds];
        exchangeDetailContentScrollView.backgroundColor = [UIColor purpleColor];
        [self.view addSubview:exchangeDetailContentScrollView];
        exchangeDetailContentScrollView.controller = self;
        _exchangeDetailContentScrollView = exchangeDetailContentScrollView;
    }
    return _exchangeDetailContentScrollView;
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
