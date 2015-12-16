//
//  MTRegisterPreview.m
//  mantingv
//
//  Created by LiuFeng on 15/12/16.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MTRegisterPreview.h"
@interface MTRegisterPreview ()
@property (nonatomic,weak) UILabel *label;
@property (nonatomic,weak) UIButton *registerPreviewButton;
@end
@implementation MTRegisterPreview

+ (instancetype)registerPreview{
    MTRegisterPreview *registerPreview = [[MTRegisterPreview alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    registerPreview.backgroundColor = [UIColor yellowColor];
    return registerPreview;
}

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    UIView *superView = self;
    
    [self.registerPreviewButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(superView);
        
        make.top.equalTo(superView);
        
        make.bottom.equalTo(superView);
        
        make.width.equalTo(@40);
    }];
}

- (UILabel *)label{
    if (nil == _label) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:12];
        label.text = @"还没有注册？5秒";
        [self addSubview:label];
        _label = label;
    }
    return _label;
}

- (UIButton *)registerPreviewButton{
    if (nil == _registerPreviewButton) {
        UIButton *registerPreviewButton = [UIButton buttonWithType:UIButtonTypeCustom];
        registerPreviewButton.titleLabel.font = [UIFont systemFontOfSize:12];
        registerPreviewButton.backgroundColor = [UIColor orangeColor];
        [registerPreviewButton setTitle:@"立即注册" forState:UIControlEventTouchUpInside];
        [self addSubview:registerPreviewButton];
        _registerPreviewButton = registerPreviewButton;
    }
    return _registerPreviewButton;
}
@end
