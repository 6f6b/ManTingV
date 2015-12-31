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

#import "RightsListController.h"
#import "MyShortRentListController.h"
#import "MyAssignmentListController.h"
#import "MyCheckInListController.h"
#import "AccountConfigController.h"
#import "AboutUsController.h"

@interface MineContentScrollView ()
@property (nonatomic,weak) MineTopContainView *mineTopContainView;
@property (nonatomic,strong) NSMutableArray *mineSubViews;
@property (nonatomic,weak) UIButton *loginOrResignButton;
@end
@implementation MineContentScrollView

- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.mineSubViews = [[NSMutableArray alloc] init];
        self.backgroundColor = [UIColor whiteColor];
        
        self.mineTopContainView.frame = CGRectMake(0, 0, self.mineTopContainView.frame.size.width, self.mineTopContainView.frame.size.height);
        
        NSArray *titles = @[@"权益中心",@"我的短租",@"我的转让",@"我的入住",@"帐号设置",@"关于我们"];
        for (int i=0; i<6; i++) {
            MineSubView *mineSubView = [MineSubView mineSubViewWithLeftImage:@"arrow_right_12.81592039801px_1197003_easyicon.net"rightImage:@"arrow_right_12.81592039801px_1197003_easyicon.net" title:titles[i]];
            mineSubView.tag = 1000+i;
            CGFloat X = 0;
            CGFloat Y = (mineSubView.frame.size.height+2)*i+20+CGRectGetMaxY(self.mineTopContainView.frame);
            CGFloat W = mineSubView.frame.size.width;
            CGFloat H = mineSubView.frame.size.height;
            mineSubView.frame = CGRectMake(X, Y, W, H);
            [self addSubview:mineSubView];
            [self.mineSubViews addObject:mineSubView];
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dealTap:)];
            [mineSubView addGestureRecognizer:tap];
        }
        
        
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        if (![user objectForKey:USER_GUID]) {
            [self.loginOrResignButton setTitle:@"登录" forState:UIControlStateNormal];
        }
        if ([user objectForKey:USER_GUID]) {
            [self.loginOrResignButton setTitle:@"退出登录" forState:UIControlStateNormal];
        }
        self.contentSize = CGSizeMake(0, CGRectGetMaxY(self.loginOrResignButton.frame));
    }
    return self;
}

- (void)setValueWith:(id)data{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *guid = [user objectForKey:USER_GUID];

    NSLog(@"---------->guid%@",guid);
    if (!guid) {
        [self.loginOrResignButton setTitle:@"登录" forState:UIControlStateNormal];
        [self.mineTopContainView setValueWith:nil];
        return;
    }
    [self.loginOrResignButton setTitle:@"退出登录" forState:UIControlStateNormal];
    
    NSString *urlWithOutGuid = [BASE_URL stringByAppendingString:@"/user/user_info/"];
    NSString *urlWithGuid = [urlWithOutGuid stringByAppendingString:guid];
    
    [self.manager GET:urlWithGuid parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSDictionary *data = [dic objectForKey:@"data"];
        [self.mineTopContainView setValueWith:data];

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

/**
 *  懒加载顶部视图
 *
 *  @return
 */
- (MineTopContainView *)mineTopContainView{
    if (nil == _mineTopContainView) {
        MineTopContainView *mineTopContainView = [MineTopContainView mineTopContainView];
        [self addSubview:mineTopContainView];
        _mineTopContainView = mineTopContainView;
    }
    return _mineTopContainView;
}


/**
 *  为若干个选项实现点击事件
 *
 *  @param tap
 */
- (void)dealTap:(UITapGestureRecognizer *)tap{
    
    UIView *view = tap.view;
    MTController *vc;
    switch (view.tag) {
        case 1000:{
            //权益列表
            RightsListController *rightsListController = [[RightsListController alloc] init];
            vc = rightsListController;
        }
            break;
        case 1001:{
            //我的短租
            MyShortRentListController *myShortRentListController = [[MyShortRentListController alloc] init];
            vc = myShortRentListController;
        }
            
            break;
        case 1002:{
            //我的转让
            MyAssignmentListController *myAssignmentListController = [[MyAssignmentListController alloc] init];
            vc = myAssignmentListController;
        }
            
            break;
        case 1003:{
            //我的入住
            MyCheckInListController *myCheckInListController = [[MyCheckInListController alloc] init];
            vc = myCheckInListController;
        }
            
            break;
        case 1004:{
            //账号设置
            AccountConfigController *accountConfigController = [[AccountConfigController alloc] init];
            vc = accountConfigController;
        }
            
            break;
        case 1005:{
            //关于我们
            AboutUsController *aboutUsController = [[AboutUsController alloc] init];
            vc = aboutUsController;
        }
            
            break;
        default:
            break;
    }
    vc.isNeedToCheckLogin = YES;
    [self.controller.navigationController pushViewController:vc animated:YES];
}

- (UIButton *)loginOrResignButton{
    if (nil == _loginOrResignButton) {
        UIButton *loginOrResignButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [loginOrResignButton addTarget:self action:@selector(dealLoginOrResign:) forControlEvents:UIControlEventTouchUpInside];
        loginOrResignButton.backgroundColor = [UIColor redColor];
        loginOrResignButton.layer.cornerRadius = 8;
        loginOrResignButton.clipsToBounds = YES;
        loginOrResignButton.frame = CGRectMake(0, 0, 350, 35);
        MineSubView *mineSubView = self.mineSubViews[self.mineSubViews.count-1];
        loginOrResignButton.center = CGPointMake(self.center.x, CGRectGetMaxY(mineSubView.frame)+50);
        [self addSubview:loginOrResignButton];
        _loginOrResignButton = loginOrResignButton;
        self.contentSize = CGSizeMake(0, CGRectGetMaxY(loginOrResignButton.frame));
    }
    return _loginOrResignButton;
}

/**
 *  登录&退出登录 此按钮状态根据用户登录状态而定
 *
 *  @param button 传入button以改变button状态
 */
- (void)dealLoginOrResign:(UIButton *)button{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    
    //如果已经登录
    if ([user objectForKey:USER_GUID]) {
        [user setObject:nil forKey:USER_GUID];
        [self setValueWith:nil];
        return;
    }
    
    //如果未登录
    if(![user objectForKey:USER_GUID]){
//        [button setTitle:@"退出登录" forState:UIControlStateNormal];
        LoginController *loginController = [[LoginController alloc] init];
        [self.controller.navigationController pushViewController:loginController animated:YES];
    }
    return;
}
@end
