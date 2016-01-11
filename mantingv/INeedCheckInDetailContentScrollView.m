//
//  INeedCheckInDetailContentScrollView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/22.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "INeedCheckInDetailContentScrollView.h"
#import "CheckInDetailTopContentView.h"
#import "CheckInDetailMessageContainView.h"
#import "CheckInDetailTimeView.h"
#import "MyHouseDTOModel.h"
#import "HouseWeekTimeDTOModel.h"

@interface INeedCheckInDetailContentScrollView ()
@property (nonatomic,weak) CheckInDetailTopContentView *checkInDetailTopContentView;
@property (nonatomic,weak) CheckInDetailMessageContainView *checkInDetailMessageContainView;
@property (nonatomic,weak) CheckInDetailTimeView *checkInDetailTimeView;
@property (nonatomic,weak) UIButton *payButton;
@end

@implementation INeedCheckInDetailContentScrollView

- (CheckInDetailTopContentView *)checkInDetailTopContentView{
    if (nil == _checkInDetailTopContentView) {
        CheckInDetailTopContentView *checkInDetailTopContentView =
        [CheckInDetailTopContentView checkInDetailTopContentView];
        [self addSubview:checkInDetailTopContentView];
        _checkInDetailTopContentView = checkInDetailTopContentView;
    }
    return _checkInDetailTopContentView;
}

- (CheckInDetailMessageContainView *)checkInDetailMessageContainView{
    if (nil == _checkInDetailMessageContainView) {
        CheckInDetailMessageContainView *checkInDetailMessageContainView =
        [[CheckInDetailMessageContainView alloc] init];
        checkInDetailMessageContainView.backgroundColor = [UIColor orangeColor];
        CGRect frame = CGRectMake(0, CGRectGetMaxY(self.checkInDetailTimeView.frame)+10, SCREEN_WIDTH, 180);
        checkInDetailMessageContainView.frame = frame;
        [self addSubview:checkInDetailMessageContainView];
        _checkInDetailMessageContainView = checkInDetailMessageContainView;
    }
    return _checkInDetailMessageContainView;
}

- (CheckInDetailTimeView *)checkInDetailTimeView{
    if (nil == _checkInDetailTimeView) {
        CheckInDetailTimeView *checkInDetailTimeView = [[CheckInDetailTimeView alloc] init];
        checkInDetailTimeView.frame = CGRectMake(0, CGRectGetMaxY(self.checkInDetailTopContentView.frame)+10, SCREEN_WIDTH, 50);
        checkInDetailTimeView.backgroundColor = [UIColor greenColor];
        checkInDetailTimeView.controller = self.controller;
        [self addSubview:checkInDetailTimeView];
        _checkInDetailTimeView = checkInDetailTimeView;
    }
    return _checkInDetailTimeView;
}

- (UIButton *)payButton{
    if (nil == _payButton) {
        UIButton *payButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [payButton addTarget:self action:@selector(dealPay) forControlEvents:UIControlEventTouchUpInside];
        payButton.backgroundColor = [UIColor orangeColor];
        [payButton setTitle:@"立即支付" forState:UIControlStateNormal];
        [self addSubview:payButton];
        _payButton = payButton;
    }
    return _payButton;
}

- (void)setValueWith:(id)data{
    MyHouseDTOModel *myHouseDTOModel = [MyHouseDTOModel modelWithDictionary:data];
    self.model = myHouseDTOModel;
    [self.checkInDetailTopContentView setValueWith:myHouseDTOModel.houseInfoDTO];
    
    [self.checkInDetailTimeView setValueWith:myHouseDTOModel.houseWeekDTO];
    
    [self.checkInDetailMessageContainView setValueWith:nil];
    
    self.payButton.frame = CGRectMake(10, CGRectGetMaxY(self.checkInDetailMessageContainView.frame)+20, SCREEN_WIDTH-20, 50);
    
    self.contentSize = CGSizeMake(0, CGRectGetMaxY(self.payButton.frame)+20);
}

- (void)dealPay{
    NSMutableDictionary *parameter = [[NSMutableDictionary alloc] init];
    HouseWeekTimeDTOModel *houseWeekTimeDTOModel = self.checkInDetailTimeView.model;
    NSString *houseWeekTimeGuids = houseWeekTimeDTOModel.guid;
    [parameter setValue:houseWeekTimeGuids forKey:@"houseWeekTimeGuids"];
    
    MyHouseDTOModel *myHouseDTOModel = self.model;
    NSString *myHouseGuid = myHouseDTOModel.guid;
    [parameter setValue:myHouseGuid forKey:@"myHouseGuid"];
    
    NSString *userName = self.checkInDetailMessageContainView.contactPerson.rightTextFeild.text;
    NSString *phoneNum = self.checkInDetailMessageContainView.forReceiveMessage.rightTextFeild.text;
    NSString *person = [NSString stringWithFormat:@"%lu",self.checkInDetailMessageContainView.numberOfPeopleCheckIn.lfStepper.value];
    [parameter setValue:userName forKey:@"userName"];
    [parameter setValue:phoneNum forKey:@"phoneNum"];
    [parameter setValue:person forKey:@"person"];

    NSString *url = [BASE_URL stringByAppendingString:@"/reserve/booking"];
    [self.manager POST:url parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@",dic);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    NSLog(@"%@",parameter);
    NSLog(@"立即支付");
}
@end
