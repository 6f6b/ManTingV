//
//  CheckInDetailTimeView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/22.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "CheckInDetailTimeView.h"
#import "HouseWeekDTOModel.h"
#import "HouseWeekTimeDTOModel.h"

#import "HouseWeekListController.h"
#import "INeedCheckInDetailController.h"

@interface CheckInDetailTimeView ()
@property (nonatomic,weak) UIImageView *headImage;
@property (nonatomic,weak) UILabel *timeLabel;
@property (nonatomic,weak) UILabel *nightNumbersLabel;
@property (nonatomic,weak) UIImageView *rightImage;

@property (nonatomic,copy) NSArray *houseWeekTimeDTOs;
@end
@implementation CheckInDetailTimeView


- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    UIView *superView = self;
    
    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(superView);
        make.left.equalTo(superView).with.offset(10);
        
        make.height.equalTo(@20);
        make.width.equalTo(@20);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(superView);
        
        make.left.equalTo(self.headImage.mas_right).with.offset(10);
    }];
    
    [self.nightNumbersLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(superView);
        
        make.right.equalTo(self.rightImage.mas_left);
    }];
    
    [self.rightImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(superView);
        
        make.right.equalTo(superView).with.offset(-10);
        
        make.height.equalTo(@20);
        make.width.equalTo(@20);
    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dealTap)];
    [self addGestureRecognizer:tap];
}

- (UIImageView *)headImage{
    if (nil == _headImage) {
        UIImageView *headImage = [[UIImageView alloc] init];
        [self addSubview:headImage];
        headImage.backgroundColor = [UIColor redColor];
        _headImage = headImage;
    }
    return _headImage;
}

- (UILabel *)timeLabel{
    if (nil == _timeLabel) {
        UILabel *timeLabel = [[UILabel alloc] init];
        timeLabel.backgroundColor = [UIColor greenColor];
        timeLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:timeLabel];
        _timeLabel = timeLabel;
    }
    return _timeLabel;
}

- (UILabel *)nightNumbersLabel{
    if (nil == _nightNumbersLabel) {
        UILabel *nightNumbersLabel = [[UILabel alloc] init];
        nightNumbersLabel.backgroundColor = [UIColor greenColor];
        [self addSubview:nightNumbersLabel];
        _nightNumbersLabel = nightNumbersLabel;
    }
    return _nightNumbersLabel;
}

- (UIImageView *)rightImage{
    if (nil == _rightImage) {
        UIImageView *rightImage = [[UIImageView alloc] init];
        [self addSubview:rightImage];
        rightImage.backgroundColor = [UIColor redColor];
        _rightImage = rightImage;
    }
    return _rightImage;
}

- (void)setValueWith:(id)data{
    INeedCheckInDetailController *iNeedCheckInDetailController = (INeedCheckInDetailController *)self.controller;
    NSInteger index = iNeedCheckInDetailController.indexOfhouseWeekGuid;
    
    HouseWeekDTOModel *houseWeekDTOModel = [HouseWeekDTOModel modelWithDictionary:data];
    NSArray *houseWeekTimeDTOs = houseWeekDTOModel.houseWeekTimeDTOs;
    self.houseWeekTimeDTOs = houseWeekTimeDTOs;
    HouseWeekTimeDTOModel *houseWeekTimeDTOModel = [HouseWeekTimeDTOModel modelWithDictionary:houseWeekTimeDTOs[index]];
    self.model = houseWeekTimeDTOModel;
    NSString *startTimeAndEndTime = [NSString stringWithFormat:@"%@入住%@离店",houseWeekTimeDTOModel.start,houseWeekTimeDTOModel.end];
    self.timeLabel.text = startTimeAndEndTime;
//    self.nightNumbersLabel.text = @"共3晚";
}

- (void)dealTap{
    HouseWeekListController *houseWeekListController = [[HouseWeekListController alloc] init];
    houseWeekListController.dataArray = self.houseWeekTimeDTOs;
    [self.controller.navigationController pushViewController:houseWeekListController animated:YES];
}

@end
