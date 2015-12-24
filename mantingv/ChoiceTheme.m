//
//  ChoiceTheme.m
//  mantingv
//
//  Created by LiuFeng on 15/12/18.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ChoiceTheme.h"
#import "ChoiceThemeModel.h"
@interface ChoiceTheme ()
@property (nonatomic,weak) UIImageView *backImage;
@property (nonatomic,weak) UILabel *titleLabel;
@property (nonatomic,weak) UIView *line1;
@property (nonatomic,weak) UILabel *locationLabel;
@property (nonatomic,weak) UIView *line2;
@end

@implementation ChoiceTheme

//创建子控件并添加约束
- (void)willMoveToSuperview:(UIView *)newSuperview{
    UIView *superView = self;
    
    //backImage
    [self.backImage mas_makeConstraints:^(MASConstraintMaker *make) {
        //距 父视图 四边 0
        make.edges.equalTo(superView).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    //titleLabel
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //位于 父视图 水平中心
        make.centerX.equalTo(superView);
        //距 line1 5
        make.bottom.equalTo(self.line1.mas_top).with.offset(-5);
        
        
    }];
    
    //line1
    [self.line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        //位于 父视图 水平中心
        make.centerX.equalTo(superView);
        //距 locationLabel 上边 0
        make.bottom.equalTo(self.locationLabel.mas_top);
        //宽 等于 locationLabel
        make.width.equalTo(self.locationLabel);
        //高 等于 2
        make.height.equalTo(@2);
        NSNumber *num = [NSNumber numberWithDouble:SCREEN_WIDTH-5];
        make.width.lessThanOrEqualTo(num);
        
    }];
    
    //locationLabel
    [self.locationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //位于 父视图 中心
        make.center.equalTo(superView);
        
    }];
    
    //line2
    [self.line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        //位于 父视图 水平中心
        make.centerX.equalTo(superView);
        //距 locationLabel 下边 0
        make.top.equalTo(self.locationLabel.mas_bottom);
        //宽 等于 locationLabel
        make.width.equalTo(self.locationLabel);
        //高 等于 2
        make.height.equalTo(@2);
        NSNumber *num = [NSNumber numberWithDouble:SCREEN_WIDTH-5];
        make.width.lessThanOrEqualTo(num);
    }];
}

- (UIImageView *)backImage{
    if (nil == _backImage) {
        UIImageView *backImage = [[UIImageView alloc] init];
        backImage.backgroundColor = [UIColor redColor];
        [self addSubview:backImage];
        _backImage = backImage;
    }
    return _backImage;
}

- (UILabel *)titleLabel{
    if (nil == _titleLabel) {
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.textColor = [UIColor whiteColor];
        [self addSubview:titleLabel];
        _titleLabel = titleLabel;
    }
    return _titleLabel;
}

- (UIView *)line1{
    if (nil == _line1) {
        UIView *line1 = [[UIView alloc] init];
        line1.backgroundColor = [UIColor whiteColor];
        [self addSubview:line1];
        _line1 = line1;
    }
    
    return _line1;
}

- (UILabel *)locationLabel{
    if (nil == _locationLabel) {
        UILabel *locationLabel = [[UILabel alloc] init];
        locationLabel.textColor = [UIColor whiteColor];
        locationLabel.numberOfLines = 0;
        locationLabel.lineBreakMode = NSLineBreakByWordWrapping;
        locationLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:locationLabel];
        _locationLabel = locationLabel;
    }
    return _locationLabel;
}

- (UIView *)line2{
    if (nil == _line2) {
        UIView *line2 = [[UIView alloc] init];
        line2.backgroundColor = [UIColor whiteColor];
        [self addSubview:line2];
        _line2 = line2;
    }
    
    return _line2;
}

//为子控件赋值
- (void)setValueWith:(id)data{
    ChoiceThemeModel *model = [ChoiceThemeModel modelWithDictionary:data];
    [self.backImage lfSetImageWithURL:model.imageGuids[0]];
    self.titleLabel.text = model.title;
    self.locationLabel.text = model.introduction;

}
@end

