//
//  INeedCheckInDetailController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/22.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "INeedCheckInDetailController.h"
#import "INeedCheckInDetailContentScrollView.h"

@interface INeedCheckInDetailController ()
@property (nonatomic,weak) INeedCheckInDetailContentScrollView *iNeedCheckInDetailContentScrollView;
@end

@implementation INeedCheckInDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.iNeedCheckInDetailContentScrollView setValueWith:nil];
    NSLog(@"--------->%@",self.iNeedCheckInDetailContentScrollView);
    // Do any additional setup after loading the view.
}

- (INeedCheckInDetailContentScrollView *)iNeedCheckInDetailContentScrollView{
    if (nil == _iNeedCheckInDetailContentScrollView) {
        INeedCheckInDetailContentScrollView *iNeedCheckInDetailContentScrollView = [[INeedCheckInDetailContentScrollView alloc] initWithFrame:self.view.bounds];
        iNeedCheckInDetailContentScrollView.backgroundColor = [UIColor yellowColor];
        iNeedCheckInDetailContentScrollView = iNeedCheckInDetailContentScrollView;
        [self.view addSubview:iNeedCheckInDetailContentScrollView];
        _iNeedCheckInDetailContentScrollView = iNeedCheckInDetailContentScrollView;
    }
    return _iNeedCheckInDetailContentScrollView;
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
