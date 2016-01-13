//
//  HouseDetailController.m
//  mantingv
//
//  Created by LiuFeng on 16/1/13.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "HouseDetailController.h"
#import "HouseDetailContentScrollView.h"

@interface HouseDetailController ()
@property (nonatomic,weak) HouseDetailContentScrollView *houseDetailContentScrollView;
@end

@implementation HouseDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.houseDetailContentScrollView setValueWith:nil];
    [self loadDataFromServer];
}

- (void)loadDataFromServer{
    NSString *urlWithOutHouseWeekGuid = [BASE_URL stringByAppendingString:@"/house/house_info/details_by_house_week/"];
    NSString *url = [urlWithOutHouseWeekGuid stringByAppendingString:self.houseWeekGuid];
    [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSDictionary *data = [dic objectForKey:@"data"];
        [self.houseDetailContentScrollView setValueWith:data];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (HouseDetailContentScrollView *)houseDetailContentScrollView{
    if (nil == _houseDetailContentScrollView) {
        HouseDetailContentScrollView *houseDetailContentScrollView = [[HouseDetailContentScrollView alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:houseDetailContentScrollView];
        houseDetailContentScrollView.controller = self;
        _houseDetailContentScrollView = houseDetailContentScrollView;
    }
    return _houseDetailContentScrollView;
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
