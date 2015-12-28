//
//  HolidayHouseSearchController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/28.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "HolidayHouseSearchController.h"
#import "HolidayHouseSearchContentScrollView.h"

@interface HolidayHouseSearchController ()
@property (nonatomic,weak) HolidayHouseSearchContentScrollView *holidayHouseSearchContentScrollView;
@end

@implementation HolidayHouseSearchController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.holidayHouseSearchContentScrollView setValueWith:self.houseBaseName];
}

- (HolidayHouseSearchContentScrollView *)holidayHouseSearchContentScrollView{
    if (nil == _holidayHouseSearchContentScrollView) {
        HolidayHouseSearchContentScrollView *holidayHouseSearchContentScrollView = [[HolidayHouseSearchContentScrollView alloc] initWithFrame:self.view.bounds];
        holidayHouseSearchContentScrollView.backgroundColor = [UIColor yellowColor];
        _holidayHouseSearchContentScrollView = holidayHouseSearchContentScrollView;
        holidayHouseSearchContentScrollView.controller = self;
        [self.view addSubview:holidayHouseSearchContentScrollView];
    }
    return _holidayHouseSearchContentScrollView;
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
