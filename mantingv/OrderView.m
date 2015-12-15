//
//  OrderView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/15.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "OrderView.h"

@interface OrderView ()
@property (nonatomic,weak) UILabel *topCycleLabel;
@property (nonatomic,weak) UILabel *titleLabel;
@property (nonatomic,weak) UIImageView *backImage;
@property (nonatomic,weak) UILabel *houseTypeLabel;
@property (nonatomic,weak) UILabel *cycleLabel;
@property (nonatomic,weak) UILabel *sizeLabel;
@end
@implementation OrderView

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    UIView *superView = self;
    
    [self.topCycleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //距 父视图 左侧 5
        make.left.equalTo(superView).with.offset(5);
        
        //距 父视图 顶部 10
        make.top.equalTo(superView).with.offset(10);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //距 父视图 顶部 10
        make.top.equalTo(superView).with.offset(10);
        
        //距 self.topCycleLabel 右侧 10
        make.left.equalTo(self.topCycleLabel.mas_right).with.offset(10);
    }];
    
    [self.backImage mas_makeConstraints:^(MASConstraintMaker *make) {
        //距 self.titleLabel 底部 10
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(10);

        //距 父视图 左侧 5
        make.left.equalTo(superView).with.offset(5);
        
        //宽 100
        make.width.equalTo(@100);
        
        //高 70
        make.height.equalTo(@70);
    }];

    [self.houseTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //距 self.backImage 右侧 5
        make.left.equalTo(self.backImage.mas_right).with.offset(5);
        
        //距 self.backImage 顶部 0
        make.top.equalTo(self.backImage);
    }];
    
    [self.cycleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //距 self.backImage 右侧 5
        make.left.equalTo(self.backImage.mas_right).with.offset(5);
        
        //距 self.houseTypeLabel 底部 5
        make.top.equalTo(self.houseTypeLabel.mas_bottom).with.offset(5);

    }];
    
    [self.sizeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //距 self.backImage 右侧 5
        make.left.equalTo(self.backImage.mas_right).with.offset(5);

        //距 self.cycleLabel 底部 5
        make.top.equalTo(self.cycleLabel.mas_bottom).with.offset(5);
    }];
}

- (UILabel *)topCycleLabel{
    if (nil == _topCycleLabel) {
        UILabel *topCycleLabel = [[UILabel alloc] init];
        topCycleLabel.backgroundColor = [UIColor blueColor];
        [self addSubview:topCycleLabel];
        _topCycleLabel = topCycleLabel;
    }
    return _topCycleLabel;
}

- (UILabel *)titleLabel{
    if (nil == _titleLabel) {
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.backgroundColor = [UIColor blueColor];
        [self addSubview:titleLabel];
        _titleLabel = titleLabel;
    }
    return _titleLabel;
}

- (UIImageView *)backImage{
    if (nil == _backImage) {
        UIImageView *backImage = [[UIImageView alloc] init];
        backImage.backgroundColor = [UIColor blueColor];
        [self addSubview:backImage];
        _backImage = backImage;
    }
    return _backImage;
}

- (UILabel *)houseTypeLabel{
    if (nil == _houseTypeLabel) {
        UILabel *houseTypeLabel = [[UILabel alloc] init];
        houseTypeLabel.backgroundColor = [UIColor blueColor];
        [self addSubview:houseTypeLabel];
        _houseTypeLabel = houseTypeLabel;
    }
    return _houseTypeLabel;
}

- (UILabel *)cycleLabel{
    if (nil == _cycleLabel) {
        UILabel *cycleLabel = [[UILabel alloc] init];
        cycleLabel.backgroundColor = [UIColor blueColor];
        [self addSubview:cycleLabel];
        _cycleLabel = cycleLabel;
    }
    return _cycleLabel;
}
- (UILabel *)sizeLabel{
    if (nil == _sizeLabel) {
        UILabel *sizeLabel = [[UILabel alloc] init];
        sizeLabel.backgroundColor = [UIColor blueColor];
        [self addSubview:sizeLabel];
        _sizeLabel = sizeLabel;
    }
    return _sizeLabel;
}

- (void)setValueWith:(id)data{
    self.topCycleLabel.text = @"黄金周";
    self.titleLabel.text = @"太湖东山天景";
    self.cycleLabel.text = @"周期：黄金周";
    self.houseTypeLabel.text = @"房型:十居室";
    self.sizeLabel.text = @"总面积：500.27平米";
}
@end
