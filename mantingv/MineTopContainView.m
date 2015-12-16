//
//  MineTopContainView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/16.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MineTopContainView.h"
@interface MineTopContainView ()
@property (nonatomic,weak) UIImageView *backImage;
@property (nonatomic,weak) UIImageView *icon;
@property (nonatomic,weak) UILabel *accountLabel;
@end

@implementation MineTopContainView

+ (instancetype)mineTopContainView{
    MineTopContainView *mineTopContainView = [[MineTopContainView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 180)];
    return mineTopContainView;
}

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    UIView *superView = self;
    
    [self.backImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(superView);
        
        make.right.equalTo(superView);
        
        make.top.equalTo(superView);
        
        make.bottom.equalTo(superView);
    }];
    
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(superView);
        
        make.width.equalTo(@70);
        
        make.height.equalTo(@70);
    }];
    
    [self.accountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(superView);
        make.bottom.equalTo(superView);
    }];
}

- (UIImageView *)backImage{
    if (nil == _backImage) {
        UIImageView *backImage = [[UIImageView alloc] init];
        backImage.image = [UIImage imageNamed:@"14008695_135933664000_2-2.jpg"];
        [self addSubview:backImage];
        _backImage = backImage;
    }
    return _backImage;
}

- (UIImageView *)icon{
    if (nil == _icon) {
        UIImageView *icon = [[UIImageView alloc] init];
        icon.image = [UIImage imageNamed:@"18c2bff02481ae8f22c021a4142b44ba.jpg"];
        icon.backgroundColor = [UIColor redColor];
        icon.layer.cornerRadius = 35;
        icon.clipsToBounds = YES;
        [self addSubview:icon];
        _icon = icon;
    }
    return _icon;
}

- (UILabel *)accountLabel{
    if (nil == _accountLabel) {
        UILabel *accountLabel = [[UILabel alloc] init];
        [self addSubview:accountLabel];
        _accountLabel = accountLabel;
    }
    return _accountLabel;
}
- (void)setValueWith:(id)data{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    self.accountLabel.text = [user objectForKey:USER_ACCOUNT];
}
@end
