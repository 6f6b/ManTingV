//
//  CheckInDetailTopContentView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/22.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "CheckInDetailTopContentView.h"
#import "HouseInfoDTOModel.h"

@interface CheckInDetailTopContentView ()
@property (nonatomic,weak) LFLoopScrollViewForMT *pictureScrollView;
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
        make.right.equalTo(superView).with.offset(-10);
//        make.bottom.equalTo(superView).with.offset(-10);
    }];
    
}

- (LFLoopScrollView *)pictureScrollView{
if (nil == _pictureScrollView) {
        LFLoopScrollViewForMT *pictureScrollView = [LFLoopScrollViewForMT loopScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150)];
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
        locationLabel.lineBreakMode = NSLineBreakByWordWrapping;
        locationLabel.numberOfLines = 0;
        locationLabel.textColor = [UIColor grayColor];
        locationLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:locationLabel];
        _locationLabel = locationLabel;
    }
    return _locationLabel;
}

- (void)setValueWith:(id)data{
    HouseInfoDTOModel *houseInfoDTOModel = [HouseInfoDTOModel modelWithDictionary:data];
    
    [self.pictureScrollView setImageWithUrlS:houseInfoDTOModel.imageGuids];
    
    self.titleLabel.text = houseInfoDTOModel.name;
    self.locationLabel.text = houseInfoDTOModel.houseFeature;
//    CGRect frame = self.frame;
//    frame.size.height = CGRectGetMaxY(self.locationLabel.frame)+10;
//    self.frame = frame;
//    for (int i=0; i<3; i++) {
//        CGFloat X = 10
//        CGFloat X
//        CGFloat X
//        CGFloat X
//        UILabel *label = [[UILabel alloc] initWithFrame:<#(CGRect)#>]
//    }
    
}
@end
