//
//  ShortRentDetailContentScrollView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/29.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ShortRentDetailContentScrollView.h"
#import "CheckInAndCheckOutView.h"
#import "ShortRentPriceView.h"
#import "RelatedProductContentView.h"
#import "ShortRentDetailContentScrollViewModel.h"

@interface ShortRentDetailContentScrollView ()
@property (nonatomic,weak) CheckInAndCheckOutView *checkInAndCheckOutView;
@property (nonatomic,weak) ShortRentPriceView *shortRentPriceView;
@property (nonatomic,weak) UILabel *relatedProductsLabel;
@property (nonatomic,weak) RelatedProductContentView *relatedProductContentView;
@property (nonnull,strong) MTModel *model;
@end
@implementation ShortRentDetailContentScrollView

//- (LFLoopScrollView *)shortRentDetailAdScrollView{
//    if (nil == _shortRentDetailAdScrollView) {
//        LFLoopScrollView *shortRentDetailAdScrollView = [LFLoopScrollView loopScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150)];
//        shortRentDetailAdScrollView.autoScroll = YES;
//        shortRentDetailAdScrollView.backgroundColor = [UIColor greenColor];
//        _shortRentDetailAdScrollView = shortRentDetailAdScrollView;
//        [self addSubview:shortRentDetailAdScrollView];
//    }
//    return _shortRentDetailAdScrollView;
//}

- (void)willMoveToSuperview:(UIView *)newSuperview{
    self.checkInAndCheckOutView.frame = CGRectMake(0, CGRectGetMaxY(self.adScrollView.frame), SCREEN_WIDTH, 100);

    self.shortRentPriceView.frame = CGRectMake(0, CGRectGetMaxY(self.checkInAndCheckOutView.frame)+20, SCREEN_WIDTH, 100);

    self.relatedProductsLabel.frame = CGRectMake(0, CGRectGetMaxY(self.shortRentPriceView.frame), SCREEN_WIDTH, 40);

    self.relatedProductContentView.frame = CGRectMake(0, CGRectGetMaxY(self.relatedProductsLabel.frame), SCREEN_WIDTH, 0);
}

- (CheckInAndCheckOutView *)checkInAndCheckOutView{
    if (nil == _checkInAndCheckOutView) {
        CheckInAndCheckOutView *checkInAndCheckOutView = [[CheckInAndCheckOutView alloc] init];
        checkInAndCheckOutView.backgroundColor = [UIColor yellowColor];
        [self addSubview:checkInAndCheckOutView];
        _checkInAndCheckOutView = checkInAndCheckOutView;
    }
    return _checkInAndCheckOutView;
}

- (ShortRentPriceView *)shortRentPriceView{
    if (nil == _shortRentPriceView) {
        ShortRentPriceView *shortRentPriceView = [[ShortRentPriceView alloc] init];
        shortRentPriceView.backgroundColor = [UIColor purpleColor];
        shortRentPriceView.controller = self.controller;
        [self addSubview:shortRentPriceView];
        _shortRentPriceView = shortRentPriceView;
    }
    return _shortRentPriceView;
}

- (UILabel *)relatedProductsLabel{
    if (nil == _relatedProductsLabel) {
        UILabel *relatedProductsLabel = [[UILabel alloc] init];
        relatedProductsLabel.text = @"相关产品";
        relatedProductsLabel.backgroundColor = [UIColor greenColor];
        [self addSubview:relatedProductsLabel];
        _relatedProductsLabel = relatedProductsLabel;
    }
    return _relatedProductsLabel;
}

- (RelatedProductContentView *)relatedProductContentView{
    if (nil == _relatedProductContentView) {
        RelatedProductContentView *relatedProductContentView = [[RelatedProductContentView alloc] init];
        relatedProductContentView.controller = self.controller;
        relatedProductContentView.backgroundColor = [UIColor purpleColor];
        [self addSubview:relatedProductContentView];
        _relatedProductContentView = relatedProductContentView;
    }
    return _relatedProductContentView;
}

#pragma mark - 从网络加载数据
- (void)setValueWith:(id)data{
    /**
     *  下载详情数据
     */
    NSString *url = [BASE_URL stringByAppendingString:[NSString stringWithFormat:@"/rent/details/%@",data]];
    [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSDictionary *dic1 = [dic objectForKey:@"data"];
        ShortRentDetailContentScrollViewModel *model = [ShortRentDetailContentScrollViewModel modelWithDictionary:dic1];
        self.model = model;
        [self loadAdScrollViewData];
        [self.checkInAndCheckOutView setValueWith:model];
        [self.shortRentPriceView setValueWith:model];
        [self loadDataForRelatedContentView];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"错误");
    }];
}


/**
 *  下载轮播图片
 */
- (void)loadAdScrollViewData{
    ShortRentDetailContentScrollViewModel *model = (ShortRentDetailContentScrollViewModel *)self.model;
    [self.adScrollView setImageWithUrlS:model.imageGuid];
}

/**
 *  下载相关产品数据
 */

- (void)loadDataForRelatedContentView{
    ShortRentDetailContentScrollViewModel *model = (ShortRentDetailContentScrollViewModel *)self.model;
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSDictionary *parameter = @{@"houseBaseName":model.houseBaseName,
                                @"userGuid":[user objectForKey:USER_GUID]
                                };
    NSLog(@"%@",[user objectForKey:USER_GUID]);
    NSString *url = [BASE_URL stringByAppendingString:@"/rent/list/matching"];
    [self.manager POST:url parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *arr = [dic objectForKey:@"data"];
        [self.relatedProductContentView setValueWith:arr];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}
@end
