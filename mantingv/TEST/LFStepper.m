//
//  LFStepper.m
//  TEST
//
//  Created by LiuFeng on 15/12/22.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "LFStepper.h"
#import "Masonry.h"

@interface LFStepper ()
@property (nonatomic,weak) UIButton *addButton;
@property (nonatomic,weak) UILabel *valueLabel;
@property (nonatomic,weak) UIButton *reduceButton;
@end
@implementation LFStepper

+ (instancetype)lfStepperWithFrame:(CGRect)frame{
    LFStepper *lfStepper = [[LFStepper alloc] initWithFrame:frame];
    lfStepper.backgroundColor = [UIColor greenColor];
    return lfStepper;
}

- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:addButton];
        _addButton = addButton;
        [addButton setBackgroundImage:[UIImage imageNamed:@"add_24px_1138892_easyicon.net"] forState:UIControlStateNormal];
        [addButton addTarget:self action:@selector(dealAdd) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *reduceButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:reduceButton];
        _reduceButton = reduceButton;
        [reduceButton addTarget:self action:@selector(dealReduce) forControlEvents:UIControlEventTouchUpInside];
        [reduceButton setBackgroundImage:[UIImage imageNamed:@"add_24px_1138892_easyicon.net"] forState:UIControlStateNormal];
        
        self.value = 0;
        UILabel *valueLabel = [[UILabel alloc] init];
        [self addSubview:valueLabel];
        _valueLabel = valueLabel;
        valueLabel.textAlignment = NSTextAlignmentCenter;
        valueLabel.text = [NSString stringWithFormat:@"%lu",self.value];
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    self.backgroundColor = [UIColor greenColor];
    UIView *superView = self;
    
    [self.addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView);
        make.right.equalTo(superView);
        make.bottom.equalTo(superView);
        
        make.left.equalTo(self.valueLabel.mas_right).with.offset(2);;
    }];

    [self.valueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView);
        make.bottom.equalTo(superView);
        
        make.width.greaterThanOrEqualTo(@30);
    }];
    
    [self.reduceButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView);
        make.left.equalTo(superView);
        make.bottom.equalTo(superView);
        make.right.equalTo(self.valueLabel.mas_left).with.offset(-2);
    }];
    
}

- (void)dealAdd{
    self.value++;
    self.valueLabel.text = [NSString stringWithFormat:@"%lu",self.value];
}

- (void)dealReduce{
    if (0 == self.value) {
        return;
    }
    self.value--;
    self.valueLabel.text = [NSString stringWithFormat:@"%lu",self.value];
}
@end
