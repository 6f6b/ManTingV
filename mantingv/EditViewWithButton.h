//
//  EditViewWithButton.h
//  mantingv
//
//  Created by LiuFeng on 16/1/6.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "MTBaseView.h"

@interface EditViewWithButton : MTBaseView
@property (nonatomic,weak) UILabel *titleLabel;
@property (nonatomic,weak) UIButton *rightButton;
@property (nonatomic,copy) NSString *urlForAddress;

@property (nonatomic,copy) NSString *Id;
@property (nonatomic,copy) NSString *area;
@end
