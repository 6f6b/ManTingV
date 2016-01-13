//
//  MineSubView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/16.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MineSubView.h"
@interface MineSubView ()
@property (nonatomic,weak) UIImageView *leftImage;
@property (nonatomic,weak) UILabel  *titleLabel;
@property (nonatomic,weak) UIImageView *rightImage;
@end
@implementation MineSubView

+ (instancetype)mineSubViewWithLeftImage:(NSString *)leftImage rightImage:(NSString *)rightImage title:(NSString *)title{
    MineSubView *mineSubView = [[MineSubView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    mineSubView.backgroundColor = [UIColor colorWithRed:0.927 green:1.000 blue:0.926 alpha:1.000];
    
    mineSubView.leftImage.image = [UIImage imageNamed:leftImage];
    mineSubView.titleLabel.text = title;
    mineSubView.rightImage.image = [UIImage imageNamed:rightImage];
    
    return mineSubView;
}

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    UIView *superView = self;
    
    [self.leftImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(superView);
        
        make.left.equalTo(superView).with.offset(5);
        
        make.height.equalTo(@10);
        make.width.equalTo(@10);
    }];
    
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(superView);
        
        make.left.equalTo(self.leftImage.mas_right).with.offset(5);
    }];
    
    
    [self.rightImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(superView);
        
        make.right.equalTo(superView).with.offset(-5);
        
        make.height.equalTo(@10);
        make.width.equalTo(@10);
    }];
}

- (UIImageView *)leftImage{
    if (nil == _leftImage) {
        UIImageView *leftImage = [[UIImageView alloc] init];
        [self addSubview:leftImage];
        _leftImage = leftImage;
    }
    return _leftImage;
}

- (UILabel *)titleLabel{
    if (nil == _titleLabel) {
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.text = @"漫庭";
        titleLabel.textColor = [UIColor blackColor];
        [self addSubview:titleLabel];
        _titleLabel = titleLabel;
    }
    return _titleLabel;
}

- (UIImageView *)rightImage{
    if (nil == _rightImage) {
        UIImageView *rightImage = [[UIImageView alloc] init];
        [self addSubview:rightImage];
        _rightImage = rightImage;
    }
    return _rightImage;
}
@end
