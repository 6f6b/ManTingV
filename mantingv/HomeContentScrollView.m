//
//  HomeContentScrollView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/18.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "HomeContentScrollView.h"


#import "ProductController.h"
#import "CheckInController.h"
#import "RightsListController.h"
#import "ChoiceNessRoom.h"
#import "ShortRentController.h"

#import "MTModel.h"
@interface HomeContentScrollView ()
//@property (nonatomic,copy) AFHTTPSessionManager *manager;
@end

@implementation HomeContentScrollView


- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.fourButtons = [[NSMutableArray alloc] init];
    }
    return self;
}

#pragma mark - 滚动广告视图
- (LFLoopScrollViewForMT *)adScrollView{
    if (nil == _adScrollView) {
        LFLoopScrollViewForMT *adScrollView = [LFLoopScrollViewForMT loopScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.5)];
        adScrollView.autoScroll = YES;
        adScrollView.backgroundColor = [UIColor greenColor];
        _adScrollView = adScrollView;
        [self addSubview:_adScrollView];
    }
    return _adScrollView;
}

- (void)setButtonWithImage:(UIImage *)image frame:(CGRect)frame{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:image forState:UIControlStateNormal];
    [button addTarget:self action:@selector(dealButton:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:button];
}

- (void)dealButton:(UIButton *)button{
    if (100 == button.tag) {
        ProductController *pc = [[ProductController alloc] init];
        [self.controller.navigationController pushViewController:pc animated:YES];
    }
    else if(101 == button.tag){
        CheckInController *checkIn = [[CheckInController alloc] init];
        [self.controller.navigationController pushViewController:checkIn animated:YES];
    }
    else{
        RightsListController *rightsVC = [[RightsListController alloc] init];
        [self.controller.navigationController pushViewController:rightsVC animated:YES];
    }
    
}

#pragma mark - 默认的两个主题
- (ThemeContentView *)themeContentView{
    if (nil == _themeContentView) {
        ThemeContentView *themeContentView = [[ThemeContentView alloc] init];
        [self addSubview:themeContentView];
        themeContentView.backgroundColor = [UIColor blueColor];
        _themeContentView = themeContentView;
    }
    return _themeContentView;
}

#pragma mark - 不知道什么鬼
- (UIImageView *)what{
    if (nil == _what) {
        UIImageView *what = [[UIImageView alloc] init];
        what.backgroundColor = [UIColor redColor];
        [self addSubview:what];
        _what = what;
    }
    return _what;
}

#pragma mark - 精选主题
- (ChoiceNessTheme *)choiceNessTheme{
    if (nil == _choiceNessTheme) {
        ChoiceNessTheme *choiceNessTheme = [ChoiceNessTheme choiceNessViewWith:@"精选主题" point:CGPointMake(0,CGRectGetMaxY(self.what.frame))];
        choiceNessTheme.backgroundColor = [UIColor whiteColor];
        [choiceNessTheme setClickedAction:^{
            ProductController *productController = [[ProductController alloc] init];
            [self.controller.navigationController pushViewController:productController animated:YES];
        }];
        [self addSubview:choiceNessTheme];
        _choiceNessTheme = choiceNessTheme;
    }
    return _choiceNessTheme;
}

#pragma mark - 精选房间
- (ChoiceNessRoom *)choiceNessRoom{
    if (nil == _choiceNessRoom) {
        ChoiceNessRoom *choiceNessRoom = [ChoiceNessRoom choiceNessViewWith:@"精选房间" point:CGPointMake(0, CGRectGetMaxY(self.choiceNessTheme.frame))];
        [choiceNessRoom setClickedAction:^{
            ShortRentController *shortController = [[ShortRentController alloc] init];
            [self.controller.navigationController pushViewController:shortController animated:YES];
        }];
        choiceNessRoom.backgroundColor = [UIColor whiteColor];
        [self addSubview:choiceNessRoom];
        _choiceNessRoom = choiceNessRoom;
    }
    return _choiceNessRoom;
}

//- (AFHTTPSessionManager *)manager{
//    if (nil == _manager) {
//        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//        _manager = manager;
//    }
//    return _manager;
//}

- (void)setValueWith:(id)data{
    
    /////////////////////////////////////////////下载轮播图片数据///////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    NSString *adScrollViewUrl = [BASE_URL stringByAppendingString:@"/front/banner/first"];
    [self.manager GET:adScrollViewUrl parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        MTModel *model = [MTModel modelWithDictionary:dic];
        [self.adScrollView setImageWithUrlS:model.data];
        
        [self setButtons];
        
        UIButton *button = self.fourButtons[0];
        self.themeContentView.frame = CGRectMake(0, CGRectGetMaxY(button.frame), SCREEN_WIDTH, 0);
        [self loadThemeContentViewData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

/////////////////////////////////////////////设置四个按钮///////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setButtons{
    NSArray *titles = @[@"我要买房",@"我要入住",@"我要交换",@"我要转让"];
    //NSArray *images = @[];
    for (int i=0; i<4; i++) {
        float btnX = i*SCREEN_WIDTH/4;
        float btnY = CGRectGetMaxY(self.adScrollView.frame);
        float btnW = SCREEN_WIDTH/4;
        float btnH = 50;
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundColor:[UIColor blackColor]];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        button.frame = CGRectMake(btnX, btnY, btnW, btnH);
        [button setBackgroundImage:[UIImage imageNamed:@"RSS_button_48px_1104904_easyicon.net"] forState:UIControlStateNormal];
        [button setImageEdgeInsets:UIEdgeInsetsMake(10, 20, -20, -10)];
        [button setTitleEdgeInsets:UIEdgeInsetsMake(20, 0, -20, 0)];
        
        button.tag = 100+i;
        [button addTarget:self action:@selector(dealButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.fourButtons addObject:button];
        [self addSubview:button];
    }
}

/////////////////////////////////////////////下载特价房间数据///////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)loadThemeContentViewData{
    NSString *url = [BASE_URL stringByAppendingString:@"/house/special"];
    [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        [self.themeContentView setValueWith:dic];
        self.what.frame = CGRectMake(0, CGRectGetMaxY(self.themeContentView.frame), SCREEN_WIDTH, 200);
        self.choiceNessTheme.frame = CGRectMake(0, CGRectGetMaxY(self.what.frame), SCREEN_WIDTH, 0);
        [self loadWhatData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

/////////////////////////////////////////////下载第二广告位数据///////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)loadWhatData{
    NSString *whatUrl = [BASE_URL stringByAppendingString:@"/front/banner/second"];
    [self.manager GET:whatUrl parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        MTModel *model = [MTModel modelWithDictionary:dic];
        [self.what lfSetImageWithURL:model.data];
        
        [self loadChoiceNessThemeData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

/////////////////////////////////////////////下载精选主题数据///////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)loadChoiceNessThemeData{
    NSString *choiceNessThemeUrl = [BASE_URL stringByAppendingString:@"/house/fine_theme"];
    [self.manager GET:choiceNessThemeUrl parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        [self.choiceNessTheme setValueWith:dic];
        self.choiceNessRoom.frame = CGRectMake(0, CGRectGetMaxY(self.choiceNessTheme.frame), SCREEN_WIDTH, 0);
        [self loadChoiceNessRoomData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

/////////////////////////////////////////////下载精选房间数据///////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)loadChoiceNessRoomData{
    NSString *choiceNessRoomUrl = [BASE_URL stringByAppendingString:@"/house/fine_room"];
    [self.manager GET:choiceNessRoomUrl parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        [self.choiceNessRoom setValueWith:dic];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

@end
