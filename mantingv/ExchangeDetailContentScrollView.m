//
//  ExchangeDetailContentScrollView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/21.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ExchangeDetailContentScrollView.h"
#import "ExchangeDetailDescriptionView.h"
#import "ExchangeDetailPayMessageView.h"
#import "ExchangeDetailBaseView.h"
#import "CommitSuccessController.h"
#import "HouseInfoDTOModel.h"
#import "ExchangePoolDTOModel.h"
#import "ExchangeDetailController.h"

@interface ExchangeDetailContentScrollView ()
@property (nonatomic,weak) LFLoopScrollViewForMT *pictureScrollView;
@property (nonatomic,weak) ExchangeDetailBaseView *titleView;
@property (nonatomic,weak) ExchangeDetailDescriptionView *exchangeDetailDescriptionView;
@property (nonatomic,weak) ExchangeDetailPayMessageView *exchangeDetailPayMessageView;
@property (nonatomic,weak) UIButton *commitButton;
@end
@implementation ExchangeDetailContentScrollView

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    self.pictureScrollView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 150);
    
    self.titleView.frame = CGRectMake(0, CGRectGetMaxY(self.pictureScrollView.frame), SCREEN_WIDTH, 80);
    
    self.exchangeDetailDescriptionView.frame = CGRectMake(0, CGRectGetMaxY(self.titleView.frame)+10, SCREEN_WIDTH, 200);
    
    self.exchangeDetailPayMessageView.frame = CGRectMake(0, CGRectGetMaxY(self.exchangeDetailDescriptionView.frame), SCREEN_WIDTH, 200);
    
    UIButton *commitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    commitButton.backgroundColor = [UIColor orangeColor];
    [commitButton setTitle:@"提交信息" forState:UIControlStateNormal];
    [commitButton addTarget:self action:@selector(dealBtn) forControlEvents:UIControlEventTouchUpInside];
    commitButton.frame = CGRectMake(10, CGRectGetMaxY(self.exchangeDetailPayMessageView.frame)+10, SCREEN_WIDTH-20, 50);
    [self addSubview:commitButton];
    _commitButton = commitButton;
    self.contentSize = CGSizeMake(0, CGRectGetMaxY(self.commitButton.frame));
}

- (LFLoopScrollViewForMT *)pictureScrollView{
    if (nil == _pictureScrollView) {
        LFLoopScrollViewForMT *pictureScrollView = [LFLoopScrollViewForMT loopScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150)];
        pictureScrollView.autoScroll = YES;
        pictureScrollView.backgroundColor = [UIColor greenColor];
        _pictureScrollView = pictureScrollView;
        
        [self addSubview:pictureScrollView];
    }
    return _pictureScrollView;
}

- (ExchangeDetailBaseView *)titleView{
    if (nil == _titleView) {
        ExchangeDetailBaseView *titleView = [[ExchangeDetailBaseView alloc] init];
        titleView.backgroundColor = [UIColor greenColor];
        _titleView = titleView;
        
        [self addSubview:titleView];
    }
    return _titleView;
}


- (ExchangeDetailDescriptionView *)exchangeDetailDescriptionView{
    if (nil == _exchangeDetailDescriptionView) {
        ExchangeDetailDescriptionView *exchangeDetailDescriptionView = [[ExchangeDetailDescriptionView alloc] init];
        exchangeDetailDescriptionView.backgroundColor = [UIColor redColor];
        _exchangeDetailDescriptionView = exchangeDetailDescriptionView;
        
        [self addSubview:exchangeDetailDescriptionView];
    }
    return _exchangeDetailDescriptionView;
}

- (ExchangeDetailPayMessageView *)exchangeDetailPayMessageView{
    if (nil == _exchangeDetailPayMessageView) {
        ExchangeDetailPayMessageView *exchangeDetailPayMessageView = [[ExchangeDetailPayMessageView alloc] init];
        exchangeDetailPayMessageView.backgroundColor = [UIColor redColor];
        _exchangeDetailPayMessageView = exchangeDetailPayMessageView;
        
        [self addSubview:exchangeDetailPayMessageView];
    }
    return _exchangeDetailPayMessageView;
}


- (void)setValueWith:(id)data{
    
    ExchangePoolDTOModel *exchangePoolDTOModel = [ExchangePoolDTOModel modelWithDictionary:data];
    NSLog(@"--->%@",exchangePoolDTOModel.username);
    HouseInfoDTOModel *houseInfoDTOModel = [HouseInfoDTOModel modelWithDictionary:exchangePoolDTOModel.houseInfoDTO];
    [self.pictureScrollView setImageWithUrlS:houseInfoDTOModel.imageGuids];
    
    [self.titleView setValueWith:houseInfoDTOModel];
    [self.exchangeDetailDescriptionView setValueWith:houseInfoDTOModel];
    [self.exchangeDetailPayMessageView setValueWith:houseInfoDTOModel];
}

- (void)dealBtn{
    
    ExchangeDetailController *exchangeDetailController = (ExchangeDetailController *)self.controller;
    NSMutableDictionary *parameter = [[NSMutableDictionary alloc] init];
    [parameter setValue:exchangeDetailController.exchangePoolGuid forKey:@"exchangePoolGuid"];
    [parameter setValue:exchangeDetailController.myHouseGuid forKey:@"myHouseGuid"];
    [parameter setValue:[MTTools userGuid] forKey:@"userGuid"];

    NSLog(@"%@",parameter);
    NSString *url = [BASE_URL stringByAppendingString:@"/exchange/do_exchange"];
    [self.manager POST:url parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"------>%@",dic);
        NSString *result = [dic objectForKey:@"result"];
        if ([@"SUCCESS" isEqualToString:result]) {
            CommitSuccessController *commitSuccessController = [[CommitSuccessController alloc] init];
            [self.controller.navigationController pushViewController:commitSuccessController animated:YES];
        }
        
        else{
            [KVNProgress showErrorWithStatus:result];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"错误");
    }];
    
}
@end
