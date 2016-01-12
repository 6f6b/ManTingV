//
//  TransferContentScrollView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/21.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "TransferContentScrollView.h"
#import "TransferContainView.h"
#import "TransferDetailController.h"

@interface TransferContentScrollView ()
@property (nonatomic,weak) TransferContainView *transferContainView;
@end
@implementation TransferContentScrollView

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    NSMutableArray *arr = [[NSMutableArray alloc] initWithArray:self.chooserView.dataContentArray];
    arr[2] = [MTTools houseWeekList];
    [self.chooserView setDataArraysWith:arr];
    NSArray *buttonTitles = @[@"地点",@"度假屋",@"周次"];
    [self.chooserView setTitlesOfButtonWith:buttonTitles];
}

- (TransferContainView *)transferContainView{
    if(nil == _transferContainView){
        TransferContainView *transferContainView = [[TransferContainView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.chooserView.frame), SCREEN_WIDTH, 10)];
        [self addSubview:transferContainView];
        transferContainView.controller = self.controller;
        _transferContainView = transferContainView;
    }
    return _transferContainView;
}

- (void)setValueWith:(id)data{
    NSString *url = [BASE_URL stringByAppendingString:@"/assignment/list"];
    [self.manager POST:url parameters:self.parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@",NSStringFromClass([[dic objectForKey:@"data"] class]));
        [self.transferContainView setValueWith:dic];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}

@end
