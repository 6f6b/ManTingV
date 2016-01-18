//
//  SpecialOfferContentView.m
//  mantingv
//
//  Created by LiuFeng on 16/1/15.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "SpecialOfferContentView.h"
#import "ThemeListController.h"
#import "SpecialView.h"

@implementation SpecialOfferContentView


- (void)setValueWith:(id)data{
    MTModel *model = [MTModel modelWithDictionary:data];
    ;
    NSArray *arr = (NSArray *)model.data;
    for (int i=0; i<arr.count; i++) {
        SpecialView *specialView = [[SpecialView alloc] init];
        specialView.controller = self.controller;
        specialView.layer.cornerRadius = 5;
        specialView.clipsToBounds = YES;
        specialView.tag = 1000+i;
        CGFloat X = i%2*(SCREEN_WIDTH/2+10);
        CGFloat Y = i/2*(SCREEN_WIDTH/2);
        CGFloat W = (SCREEN_WIDTH/2);
        CGFloat H = SCREEN_WIDTH/2-10;
        specialView.frame = CGRectMake(X, Y, W, H);
        [self addSubview:specialView];
        
        
        CGRect frame = self.frame;
        frame.size.width = SCREEN_WIDTH;
        frame.size.height = CGRectGetMaxY(specialView.frame);
        
        self.frame = frame;
        [specialView setValueWith:model.data[i]];
    }
}



@end
