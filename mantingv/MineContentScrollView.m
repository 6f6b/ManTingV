//
//  MineContentScrollView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/16.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MineContentScrollView.h"
#import "MineTopContainView.h"
#import "MineSubView.h"
#import "LoginController.h"

@interface MineContentScrollView ()
@property (nonatomic,weak) MineTopContainView *mineTopContainView;
@property (nonatomic,strong) NSMutableArray *mineSubViews;
@property (nonatomic,weak) UIButton *resignButton;
@property (nonatomic,weak) UIButton *loginButton;
@end
@implementation MineContentScrollView

- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.mineSubViews = [[NSMutableArray alloc] init];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}



- (MineTopContainView *)mineTopContainView{
    if (nil == _mineTopContainView) {
        MineTopContainView *mineTopContainView = [MineTopContainView mineTopContainView];
        [self addSubview:mineTopContainView];
        _mineTopContainView = mineTopContainView;
    }
    return _mineTopContainView;
}

- (void)setValueWith:(id)data{
    self.mineTopContainView.frame = CGRectMake(0, 0, self.mineTopContainView.frame.size.width, self.mineTopContainView.frame.size.height);
    
    NSArray *titles = @[@"权益中心",@"我的短租",@"我的转让",@"我的入住",@"帐号设置",@"关于我们"];
    for (int i=0; i<6; i++) {
        MineSubView *mineSubView = [MineSubView mineSubViewWithLeftImage:@"arrow_right_12.81592039801px_1197003_easyicon.net"rightImage:@"arrow_right_12.81592039801px_1197003_easyicon.net" title:titles[i]];
        
        CGFloat X = 0;
        CGFloat Y = (mineSubView.frame.size.height+2)*i+20+CGRectGetMaxY(self.mineTopContainView.frame);
        CGFloat W = mineSubView.frame.size.width;
        CGFloat H = mineSubView.frame.size.height;
        
        mineSubView.frame = CGRectMake(X, Y, W, H);
        [self addSubview:mineSubView];
        
        [self.mineSubViews addObject:mineSubView];
    }
    
    MineSubView *mineSubView = self.mineSubViews[self.mineSubViews.count-1];
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    if (![user objectForKey:USER_ACCOUNT]) {
        NSLog(@"111111111");
        [self bringSubviewToFront:self.loginButton];
    }
    if ([user objectForKey:USER_ACCOUNT]) {
        NSLog(@"222222222");
        [self bringSubviewToFront:self.resignButton];
    }
    
    [self.mineTopContainView setValueWith:nil];
//    self.contentSize = CGSizeMake(0, CGRectGetMaxY(self.resignButton.frame));
}

- (void)dealLoginBtn{
    LoginController *loginController = [[LoginController alloc] init];
    [self.controller.navigationController pushViewController:loginController animated:YES];
}

- (void)dealResignBtn{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setObject:nil forKey:USER_ACCOUNT];
    [user setObject:nil forKey:USER_PASSWORD];
    [self setValueWith:nil];
}

- (UIButton *)resignButton{
    if (nil == _resignButton) {
        UIButton *resignButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [resignButton addTarget:self action:@selector(dealResignBtn) forControlEvents:UIControlEventTouchUpInside];
        resignButton.backgroundColor = [UIColor redColor];
        resignButton.layer.cornerRadius = 8;
        resignButton.clipsToBounds = YES;
        [resignButton setTitle:@"退出登录" forState:UIControlStateNormal];
        resignButton.frame = CGRectMake(0, 0, 250, 35);
        MineSubView *mineSubView = self.mineSubViews[self.mineSubViews.count-1];
        resignButton.center = CGPointMake(self.center.x, CGRectGetMaxY(mineSubView.frame)+50);
        [self addSubview:resignButton];
        _resignButton = resignButton;
        self.contentSize = CGSizeMake(0, CGRectGetMaxY(resignButton.frame));
    }
    return _resignButton;
}

- (UIButton *)loginButton{
    if (nil == _loginButton) {
        UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [loginButton addTarget:self action:@selector(dealLoginBtn) forControlEvents:UIControlEventTouchUpInside];
        loginButton.backgroundColor = [UIColor redColor];
        loginButton.layer.cornerRadius = 8;
        loginButton.clipsToBounds = YES;
        [loginButton setTitle:@"登录" forState:UIControlStateNormal];
        loginButton.frame = CGRectMake(0, 0, 250, 35);
        MineSubView *mineSubView = self.mineSubViews[self.mineSubViews.count-1];
        loginButton.center = CGPointMake(self.center.x, CGRectGetMaxY(mineSubView.frame)+50);
        [self addSubview:loginButton];
        _loginButton = loginButton;
        self.contentSize = CGSizeMake(0, CGRectGetMaxY(loginButton.frame));
    }
    return _loginButton;
}

@end
