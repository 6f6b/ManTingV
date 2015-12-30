//
//  ProductContainView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/15.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ProductContainView.h"
#import "ProductView.h"
#import "ProductContainViewModel.h"
#import "HolidayHouseSearchController.h"

@interface ProductContainView ()
@end
@implementation ProductContainView

- (void)setValueWith:(id)data{
    ProductContainViewModel *model = [ProductContainViewModel modelWithDictionary:data];
    
    __weak __typeof(self) ws = self;
    [self setClickedAction:^{
        HolidayHouseSearchController *holidayHouseSearchController = [[HolidayHouseSearchController alloc] init];
        holidayHouseSearchController.houseBaseName = model.title;
        [ws.controller.navigationController pushViewController:holidayHouseSearchController animated:YES];
    }];
    [self setTitle:model.title];
    for (int i=0; i<model.buildingTypeDTOs.count; i++) {
        CGFloat X = 0;
        CGFloat Y = 200*i+40;
        CGFloat W = self.frame.size.width;
        CGFloat H = 190;
        ProductView *productView = [[ProductView alloc] initWithFrame:CGRectMake(X, Y, W, H)];
        productView.controller = self.controller;
        productView.layer.cornerRadius = 5;
        productView.clipsToBounds = YES;
        productView.backgroundColor = [UIColor colorWithRed:1.000 green:0.990 blue:0.931 alpha:1.000];
        productView.tag = 100+i;
        

        [self addSubview:productView];
        NSDictionary *dic = model.buildingTypeDTOs[i];
        [productView setValueWith:dic];
        

        
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, CGRectGetMaxY(productView.frame));
    }
}
@end
