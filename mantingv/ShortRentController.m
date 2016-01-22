//
//  ShortRentController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/29.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ShortRentController.h"
#import "ShortRentContentScrollView.h"

@interface ShortRentController ()
@property (nonatomic,weak) ShortRentContentScrollView *shortRentContentScrollView;
@end

@implementation ShortRentController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"短租";
    [self.shortRentContentScrollView setValueWith:nil];
    // Do any additional setup after loading the view.
}

- (ShortRentContentScrollView *)shortRentContentScrollView{
    if (nil == _shortRentContentScrollView) {
        ShortRentContentScrollView *shortRentContentScrollView = [[ShortRentContentScrollView alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:shortRentContentScrollView];
        shortRentContentScrollView.controller = self;
        _shortRentContentScrollView = shortRentContentScrollView;
    }
    return _shortRentContentScrollView;
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
