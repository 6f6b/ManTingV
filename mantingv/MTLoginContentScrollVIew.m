//
//  MTLoginContentScrollVIew.m
//  mantingv
//
//  Created by LiuFeng on 15/12/16.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MTLoginContentScrollVIew.h"

@implementation MTLoginContentScrollVIew


- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    
    self.backImage.frame = CGRectMake(0, 0, ScreenWidth, Screenheight);
    
    CGPoint center = self.center;
    self.loginModule.center = center;
    
    center.y = self.frame.size.height-self.registerPreview.frame.size.height/2;
    self.registerPreview.center = center;
}

- (UIImageView *)backImage{
    if (nil == _backImage) {
        UIImageView *backcImage = [[UIImageView alloc] init];
        [self addSubview:backcImage];
        backcImage.image = [UIImage imageNamed:@"login"];
        _backImage = backcImage;
    }
    return _backImage;
}

- (MTLoginModule *)loginModule{
    if (nil == _loginModule) {
        MTLoginModule *loginModule = [MTLoginModule loginModul];
        loginModule.controller = self.controller;
        [self addSubview:loginModule];
        _loginModule = loginModule;
    }
    return _loginModule;
}

- (MTRegisterPreview *)registerPreview{
    if (nil == _registerPreview) {
        MTRegisterPreview *registerPreview = [MTRegisterPreview registerPreview];
        [self addSubview:registerPreview];
        _registerPreview = registerPreview;
    }
    return _registerPreview;
}
@end
