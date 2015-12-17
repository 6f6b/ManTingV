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
    // Do any additional setup after loading the view.
    [self.shortRentDetailContentScrollView setValueWith:nil];
}

- (ShortRentDetailContentScrollView *)shortRentDetailContentScrollView{
    if (nil == _shortRentDetailContentScrollView) {
        ShortRentDetailContentScrollView *shortRentDetailContentScrollView = [[ShortRentDetailContentScrollView alloc] initWithFrame:self.view.bounds];
        shortRentDetailContentScrollView.backgroundColor = [UIColor whiteColor];
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
