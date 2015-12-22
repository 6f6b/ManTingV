//
//  ExchangeDetailBaseView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/21.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ExchangeDetailBaseView.h"

@interface ExchangeDetailBaseView ()
@property (nonatomic,weak) UIView *separationLine;
@end
@implementation ExchangeDetailBaseView

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    UIView *superView = self;
    
    [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(superView).with.offset(10);
        make.centerY.equalTo(superView);
    }];
    
    [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(superView).with.offset(-10);
        make.centerY.equalTo(superView);
    }];
    
    [self.separationLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(superView).with.offset(10);
        make.right.equalTo(superView).with.offset(-10);
        
        make.bottom.equalTo(superView);
        make.height.equalTo(@1);
    }];
    
}

- (UILabel *)leftLabel{
    if (nil == _leftLabel) {
        UILabel *leftLabel = [[UILabel alloc] init];
        leftLabel.text = @"left";
        leftLabel.backgroundColor = [UIColor purpleColor];
        [self addSubview:leftLabel];
        _leftLabel = leftLabel;
    }
    return _leftLabel;
}

- (UILabel *)rightLabel{
    if (nil == _rightLabel) {
        UILabel *rightLabel = [[UILabel alloc] init];
        rightLabel.text = @"left";
        rightLabel.backgroundColor = [UIColor purpleColor];
        [self addSubview:rightLabel];
        _rightLabel = rightLabel;
    }
    return _rightLabel;
}

- (UIView *)separationLine{
    if(nil == _separationLine){
        UIView *separationLine = [[UIView alloc] init];
        separationLine.backgroundColor = [UIColor grayColor];
        [self addSubview:separationLine];
        _separationLine = separationLine;
    }
    return _separationLine;
}

- (void)setValueWith:(id)data{

}
@end
