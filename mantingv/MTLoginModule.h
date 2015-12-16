//
//  MTLoginModule.h
//  mantingv
//
//  Created by LiuFeng on 15/12/16.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MTBaseView.h"

@interface MTLoginModule : MTBaseView
@property (nonatomic,weak) UITextField *account;
@property (nonatomic,weak) UITextField *password;
@property (nonatomic,weak) UIButton *loginButton;
@property (nonatomic,weak) UIButton *forgetPasswordButton;

+ (instancetype)loginModul;
@end
