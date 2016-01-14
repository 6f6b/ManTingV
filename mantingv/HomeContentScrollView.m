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
@interface HomeContentScrollView ()<FunctionButtonsViewDelegate>
@end

@implementation HomeContentScrollView


- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.fourButtons = [[NSMutableArray alloc] init];
    }
    return self;
}



#pragma mark - 四个按钮
- (FunctionButtonsView *)functionButtonsView{
    if (nil == _functionButtonsView) {
        FunctionButtonsView *functionButtonsView = [FunctionButtonsView functionButtonsViewWithOrigin:CGPointMake(0, CGRectGetMaxY(self.loopScrollView.frame))];
        functionButtonsView.delegate = self;
        NSArray *titles = @[@"委托出租",@"我要入驻",@"我要交换",@"我要转让"];
        NSMutableArray *images = [[NSMutableArray alloc] init];
        for (int i=0; i<4; i++) {
            NSString *url = [NSString stringWithFormat:@"http://manting.51shanjian.com/Public/images/nav_0%d.png",i+1];
            [images addObject:url];
        }
        [functionButtonsView setImagesWithUrls:images titles:titles];
//        [functionButtonsView setImages:images titles:titles];
        [self addSubview:functionButtonsView];
        _functionButtonsView = functionButtonsView;
    }
    return _functionButtonsView;
}

- (void)clickedAtIndexOfButton:(NSInteger)index{
    if (0 == index) {
        ProductController *pc = [[ProductController alloc] init];
        [self.controller.navigationController pushViewController:pc animated:YES];
    }
    else if(1 == index){
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
        themeContentView.controller = self.controller;
        [self addSubview:themeContentView];
        themeContentView.backgroundColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:1.000];
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
        ChoiceNessTheme *choiceNessTheme = [ChoiceNessTheme choiceNessViewWithPoint:CGPointMake(0,CGRectGetMaxY(self.what.frame))];
        choiceNessTheme.controller = self.controller;
        [choiceNessTheme setTitle:@"精选主题"];
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
        ChoiceNessRoom *choiceNessRoom = [ChoiceNessRoom choiceNessViewWithPoint:CGPointMake(0, CGRectGetMaxY(self.choiceNessTheme.frame))];
        choiceNessRoom.controller = self.controller;
        [choiceNessRoom setTitle:@"精选房间"];
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


- (void)setValueWith:(id)data{
    /////////////////////////////////////////////下载轮播图片数据///////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    NSString *adScrollViewUrl = [BASE_URL stringByAppendingString:@"/front/banner/first"];
    [KVNProgress showWithStatus:@"正在加载。。"];
    [self.manager GET:adScrollViewUrl parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        MTModel *model = [MTModel modelWithDictionary:dic];
        [self.loopScrollView setImageWithUrlS:model.data];
        
        self.themeContentView.frame = CGRectMake(0, CGRectGetMaxY(self.functionButtonsView.frame)+20, SCREEN_WIDTH, 0);
        [self loadThemeContentViewData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
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
        [KVNProgress dismiss];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

@end
