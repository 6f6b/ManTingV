//
//  ExchangeDetailPayMessageView.h
//  mantingv
//
//  Created by LiuFeng on 15/12/21.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MTBaseView.h"
#import "ExchangeDetailBaseView.h"

@interface ExchangeDetailPayMessageView : MTBaseView
@property (nonatomic,weak) ExchangeDetailBaseView *payMessageMarkView;
@property (nonatomic,weak) ExchangeDetailBaseView *separationOfPowersView;
@property (nonatomic,weak) ExchangeDetailBaseView *propertyManagementFeeView;
@property (nonatomic,weak) UILabel *shouldPayLabel;
@property (nonatomic,weak) UILabel *numberOfShouldPayLabel;
@end
