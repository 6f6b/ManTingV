//
//  ShortRentDetailController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/17.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ShortRentDetailController.h"
#import "ShortRentDetailContentScrollView.h"

@interface ShortRentDetailController ()
@property (nonatomic,weak) ShortRentDetailContentScrollView *shortRentDetailContentScrollView;
@end

@implementation ShortRentDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.shortRentDetailContentScrollView setValueWith:nil];
    [self.shortRentDetailContentScrollView setValueWith:self.guid];
}

- (ShortRentDetailContentScrollView *)shortRentDetailContentScrollView{
    if (nil == _shortRentDetailContentScrollView) {
        ShortRentDetailContentScrollView *shortRentDetailContentScrollView = [[ShortRentDetailContentScrollView alloc] initWithFrame:self.view.bounds];
        shortRentDetailContentScrollView.backgroundColor = [UIColor colorWithRed:(float)238/255 green:(float)238/255 blue:(float)238/255 alpha:1.000];
        shortRentDetailContentScrollView.controller = self;
        [self.view addSubview:shortRentDetailContentScrollView];
        _shortRentDetailContentScrollView = shortRentDetailContentScrollView;
    }
    return _shortRentDetailContentScrollView;
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
