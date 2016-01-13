//
//  TransferDetailController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/21.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "TransferDetailController.h"
#import "TransferDetailContentScrollView.h"

@interface TransferDetailController ()
@property (nonatomic,weak) TransferDetailContentScrollView *transferDetailContentScrollView;
@end

@implementation TransferDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.transferDetailContentScrollView setValueWith:self.assignmentDTOModel];
    // Do any additional setup after loading the view.
}

- (TransferDetailContentScrollView *)transferDetailContentScrollView{
    if (nil == _transferDetailContentScrollView) {
        TransferDetailContentScrollView *transferDetailContentScrollView = [[TransferDetailContentScrollView alloc] initWithFrame:self.view.bounds];
        transferDetailContentScrollView.backgroundColor = [UIColor yellowColor];
        _transferDetailContentScrollView = transferDetailContentScrollView;
        transferDetailContentScrollView.controller = self;
        [self.view addSubview:transferDetailContentScrollView];
    }
    return _transferDetailContentScrollView;
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
