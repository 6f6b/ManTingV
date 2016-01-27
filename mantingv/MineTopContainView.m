//
//  MineTopContainView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/16.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MineTopContainView.h"
#import "UserAccount.h"

@interface MineTopContainView ()
@property (nonatomic,weak) UIImageView *backImage;
@property (nonatomic,weak) UIImageView *icon;
@property (nonatomic,weak) UILabel *accountLabel;
@end

@implementation MineTopContainView

+ (instancetype)mineTopContainView{
    MineTopContainView *mineTopContainView = [[MineTopContainView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 220)];
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
        backImage.image = [UIImage imageNamed:@"user_backgrounimage"];
        [self addSubview:backImage];
        _backImage = backImage;
    }
    return _backImage;
}

- (UIImageView *)icon{
    if (nil == _icon) {
        UIImageView *icon = [[UIImageView alloc] init];
        icon.backgroundColor = [UIColor whiteColor];
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
    UserAccount *model = [UserAccount modelWithDictionary:data];
    self.model = model;
    [self.icon lfSetImageWithURL:model.imageGuid];
    if (nil == self.icon.image) {
        self.icon.image = [UIImage imageNamed:@"6e99cf785f741d8b840ed49bd5cd3df7.jpg"];
    }
    self.accountLabel.text = model.username;
//    self.accountLabel.text = [NSString stringWithFormat:@"%@/%@",userAccount.username,userAccount.phoneNum];
}
@end
