//
//  CheckInDetailTopContentView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/22.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "CheckInDetailTopContentView.h"

@interface CheckInDetailTopContentView ()
@property (nonatomic,weak) LFLoopScrollView *pictureScrollView;
@property (nonatomic,weak) UILabel *titleLabel;
@property (nonatomic,weak) UILabel *locationLabel;
@end
@implementation CheckInDetailTopContentView

+ (instancetype)checkInDetailTopContentView{
    CheckInDetailTopContentView *checkInDetailTopContentView = [[CheckInDetailTopContentView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 220)];
    checkInDetailTopContentView.backgroundColor = [UIColor whiteColor];
    return checkInDetailTopContentView;
}

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    UIView *superView = self;
    
    [self.pictureScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView);
        make.left.equalTo(superView);
        make.right.equalTo(superView);
        
        make.height.equalTo(@150);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(superView).with.offset(10);
        make.top.equalTo(self.pictureScrollView.mas_bottom).with.offset(10);
    }];
    
    [self.locationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(superView).with.offset(10);
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(10);
    }];
    
}

- (LFLoopScrollView *)pictureScrollView{
if (nil == _pictureScrollView) {
        LFLoopScrollView *pictureScrollView = [LFLoopScrollView loopScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150)];
        [self addSubview:pictureScrollView];
        _pictureScrollView = pictureScrollView;
    }
    return _pictureScrollView;
}

- (UILabel *)titleLabel{
    if (nil == _titleLabel) {
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.backgroundColor = [UIColor greenColor];
        [self addSubview:titleLabel];
        _titleLabel = titleLabel;
    }
    return _titleLabel;
}

- (UILabel *)locationLabel{
    if (nil == _locationLabel) {
        UILabel *locationLabel = [[UILabel alloc] init];
        locationLabel.backgroundColor = [UIColor greenColor];
        locationLabel.textColor = [UIColor grayColor];
        locationLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:locationLabel];
        _locationLabel = locationLabel;
    }
    return _locationLabel;
}

- (void)setValueWith:(id)data{
    NSArray *urls = @[@"http://down.tutu001.com/d/file/20101129/2f5ca0f1c9b6d02ea87df74fcc_560.jpg",@"http://pica.nipic.com/2008-03-19/2008319183523380_2.jpg",@"http://pic25.nipic.com/20121209/9252150_194258033000_2.jpg"];
    [self.pictureScrollView setImageWithUrlS:urls];
    
    self.titleLabel.text = @"老子山公园";
    self.locationLabel.text = @"位于德天大瀑布旁边";
    
//    for (int i=0; i<3; i++) {
//        CGFloat X = 10
//        CGFloat X
//        CGFloat X
//        CGFloat X
//        UILabel *label = [[UILabel alloc] initWithFrame:<#(CGRect)#>]
//    }
    
}
@end
