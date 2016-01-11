//
//  MyHouseListDetailContentScrollView.m
//  mantingv
//
//  Created by LiuFeng on 16/1/5.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "MyHouseListDetailContentScrollView.h"
#import "MyHouseListModel.h"
#import "HouseInfoDTOModel.h"

#import "EntrustRentalController.h"
#import "INeedCheckInDetailController.h"

@implementation MyHouseListDetailContentScrollView

- (MyHouseListDetailDescriptionView *)myHouseListDetailDescriptionView{
    if (nil == _myHouseListDetailDescriptionView) {
        MyHouseListDetailDescriptionView *myHouseListDetailDescriptionView = [[MyHouseListDetailDescriptionView alloc] init];
        myHouseListDetailDescriptionView.backgroundColor = [UIColor greenColor];
        CGFloat X = 0;
        CGFloat Y = CGRectGetMaxY(self.loopScrollView.frame);
        CGFloat W = SCREEN_WIDTH;
        CGFloat H = 50;
        myHouseListDetailDescriptionView.frame = CGRectMake(X, Y, W, H);
        [self addSubview:myHouseListDetailDescriptionView];
        _myHouseListDetailDescriptionView = myHouseListDetailDescriptionView;
    }
    return _myHouseListDetailDescriptionView;
}


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

- (void)setValueWith:(id)data{
    MyHouseListModel *myHouseListModel = [MyHouseListModel modelWithDictionary:data];
    self.model = myHouseListModel;
    HouseInfoDTOModel *houseInfoDTOModel = [HouseInfoDTOModel modelWithDictionary:myHouseListModel.houseInfoDTO];
    
    [self.loopScrollView setImageWithUrlS:houseInfoDTOModel.imageGuids];
    
    [self.myHouseListDetailDescriptionView setValueWith:myHouseListModel];
    
    self.functionButtonsView.backgroundColor = [UIColor whiteColor];
}

- (void)clickedAtIndexOfButton:(NSInteger)index{
    MyHouseListModel *myHouseListModel = self.model;
    MTController *controller;
    if (0 == index) {
        EntrustRentalController *entrustRentalController = [[EntrustRentalController alloc] init];
        entrustRentalController.myHouseGuid = myHouseListModel.guid;
        controller = entrustRentalController;
    }
    if (1 == index) {
        INeedCheckInDetailController *iNeedCheckInDetailController = [[INeedCheckInDetailController alloc] init];
        iNeedCheckInDetailController.myHouseGuid = myHouseListModel.guid;
        controller = iNeedCheckInDetailController;
    }
    [self.controller.navigationController pushViewController:controller animated:YES];
}
@end
