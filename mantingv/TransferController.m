//
//  TransferController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/21.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "TransferController.h"
#import "TransferContentScrollView.h"

@interface TransferController ()
@property (nonatomic,weak) TransferContentScrollView *transferContentScrollView;
@end

@implementation TransferController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.transferContentScrollView setValueWith:nil];
}

- (TransferContentScrollView *)transferContentScrollView{
    if (nil == _transferContentScrollView) {
        TransferContentScrollView *transferContentScrollView = [[TransferContentScrollView alloc] initWithFrame:self.view.bounds];
        _transferContentScrollView = transferContentScrollView;
        transferContentScrollView.controller = self;
        [self.view addSubview:transferContentScrollView];
    }
    return _transferContentScrollView;
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
