//
//  MTLoginModule.m
//  mantingv
//
//  Created by LiuFeng on 15/12/16.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MTLoginModule.h"
#import "MTLoginController.h"

@implementation MTLoginModule

+ (instancetype)loginModul{
    MTLoginModule *loginModul = [[MTLoginModule alloc] initWithFrame:CGRectMake(0, 0, 250, 200)];
    loginModul.backgroundColor = [UIColor redColor];
    return loginModul;
}

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    UIView *superView = self;
    
    [self.account mas_makeConstraints:^(MASConstraintMaker *make) {
        //距 self.password 顶部 10
        make.bottom.equalTo(self.password.mas_top).with.offset(-10);
        
        //距 父视图 左侧 0
        make.left.equalTo(superView);
        
        //距 父视图 右侧 0
        make.right.equalTo(superView);
        
        //高 40
        make.height.equalTo(@35);
    }];
    
    [self.password mas_makeConstraints:^(MASConstraintMaker *make) {
        //位于 父视图 中心
        make.center.equalTo(superView);
        
        //距 父视图 左侧 0
        make.left.equalTo(superView);
        
        //距 父视图 右侧 0
        make.right.equalTo(superView);
        
        //高 40
        make.height.equalTo(@35);
    }];
    
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        //距 self.password 底部 10
        make.top.equalTo(self.password.mas_bottom).with.offset(10);
        
        //距 父视图 左侧 0
        make.left.equalTo(superView);
        
        //距 父视图 右侧 0
        make.right.equalTo(superView);
        
        //高 40
        make.height.equalTo(@35);
    }];
    
    [self.forgetPasswordButton mas_makeConstraints:^(MASConstraintMaker *make) {
        //距 self.loginButton 底部 0
        make.top.equalTo(self.loginButton.mas_bottom);
        
        //距 父视图 右侧 0
        make.right.equalTo(superView);
        
        //宽 80
        make.width.equalTo(@80);
        
        //高 30
        make.height.equalTo(@30);
    }];
}

- (UITextField *)account{
    if (nil == _account) {
        UITextField *account = [[UITextField alloc] init];
        account.backgroundColor = [UIColor greenColor];
        account.placeholder = @"请输入您的帐号";
        [self addSubview:account];
        _account = account;
    }
    return _account;
}

- (UITextField *)password{
    if (nil == _password) {
        UITextField *password = [[UITextField alloc] init];
        password.backgroundColor = [UIColor greenColor];
        password.placeholder = @"请输入您的密码";
        [self addSubview:password];
        _password = password;
    }
    return _password;
}

- (UIButton *)loginButton{
    if (nil == _loginButton) {
        UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [loginButton addTarget:self action:@selector(dealLoginBtn) forControlEvents:UIControlEventTouchUpInside];
        [loginButton setTitle:@"登录" forState:UIControlStateNormal];
        loginButton.backgroundColor = [UIColor greenColor];
        [self addSubview:loginButton];
        _loginButton = loginButton;
    }
    return _loginButton;
}

- (UIButton *)forgetPasswordButton{
    if (nil == _forgetPasswordButton) {
        UIButton *forgetPasswordButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [forgetPasswordButton addTarget:self action:@selector(dealForgetBtn) forControlEvents:UIControlEventTouchUpInside];
        forgetPasswordButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [forgetPasswordButton setTitle:@"忘记密码" forState:UIControlStateNormal];
        forgetPasswordButton.backgroundColor = [UIColor greenColor];
        [self addSubview:forgetPasswordButton];
        _forgetPasswordButton = forgetPasswordButton;
    }
    return _forgetPasswordButton;
}

- (void)dealForgetBtn{
    NSLog(@"忘记密码");
}

- (void)dealLoginBtn{
    NSLog(@"%@-----%@",self.account.text,self.password.text);
    NSString *useraccount = self.account.text;
    NSString *password = self.password.text;
    if (!useraccount) {
        return;
    }
    if (!password) {
        return;
    }
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setObject:useraccount forKey:USER_ACCOUNT];
    [user setObject:password forKey:USER_PASSWORD];
    
    MTLoginController *loginController = self.controller;
    [loginController.navigationController pushViewController:loginController.willPushVC animated:YES];
    [loginController removeFromParentViewController];
}
@end
