//
//  CheckInDetailTopDescriptionView.m
//  mantingv
//
//  Created by LiuFeng on 16/1/13.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "CheckInDetailTopDescriptionView.h"
#import "HouseInfoDTOModel.h"


@interface CheckInDetailTopDescriptionView ()
@property (nonatomic,weak) UILabel *titleLabel;
@property (nonatomic,weak) UILabel *locationLabel;
@end
@implementation CheckInDetailTopDescriptionView

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    UIView *superView = self;
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(superView).with.offset(10);
        make.top.equalTo(superView).with.offset(10);
    }];
    
    [self.locationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(superView).with.offset(10);
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(10);
        make.right.equalTo(superView).with.offset(-10);
    }];
    
}

- (UILabel *)titleLabel{
    if (nil == _titleLabel) {
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.backgroundColor = [UIColor greenColor];
        [self addSubview:titleLabel];
        _titleLabel = titleLabel;
    }
    return _titleLabel;
}

- (UILabel *)locationLabel{
    if (nil == _locationLabel) {
        UILabel *locationLabel = [[UILabel alloc] init];
        locationLabel.backgroundColor = [UIColor greenColor];
        locationLabel.lineBreakMode = NSLineBreakByWordWrapping;
        locationLabel.numberOfLines = 0;
        locationLabel.textColor = [UIColor grayColor];
        locationLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:locationLabel];
        _locationLabel = locationLabel;
    }
    return _locationLabel;
}

- (void)setValueWith:(id)data{
    HouseInfoDTOModel *houseInfoDTOModel = [HouseInfoDTOModel modelWithDictionary:data];
    
    self.titleLabel.text = houseInfoDTOModel.name;
    self.locationLabel.text = [NSString stringWithFormat:@"地址：%@%@",houseInfoDTOModel.province,houseInfoDTOModel.city];
}

@end
