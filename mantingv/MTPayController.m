//
//  MTPayController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/15.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MTPayController.h"

#import "MTPayContentScrollView.h"

@interface MTPayController ()
@property (nonatomic,weak) MTPayContentScrollView *payContentScrollView;
@end

@implementation MTPayController

- (id)init{
    if(self = [super init]){
        _addressTag = 0;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
}

- (void)loadData{
    [self.payContentScrollView setValueWith:nil];
}

- (MTPayContentScrollView *)payContentScrollView{
    if (nil == _payContentScrollView) {
        MTPayContentScrollView *payContentScrollView = [[MTPayContentScrollView alloc] initWithFrame:self.view.bounds];
        payContentScrollView.controller = self;
        payContentScrollView.backgroundColor = [UIColor whiteColor];
        _payContentScrollView = payContentScrollView;
        [self.view addSubview:_payContentScrollView];
    }
    return _payContentScrollView;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.payContentScrollView setValueWith:nil];
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
