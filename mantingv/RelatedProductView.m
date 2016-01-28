//
//  RelatedProductView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/17.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "RelatedProductView.h"
#import "BookOrderController.h"
#import "RelatedProductViewModel.h"

@interface RelatedProductView ()
@property (nonatomic,weak) UILabel *houseNameLabel;
@end
@implementation RelatedProductView

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    UIView *superView = self;
    [self.houseNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.timeLabel);
        make.left.equalTo(self.timeLabel.mas_right).with.offset(5);
    }];

}

- (UILabel *)houseNameLabel{
    if (nil == _houseNameLabel) {
        UILabel *houseNameLabel = [[UILabel alloc] init];
        [self addSubview:houseNameLabel];
        _houseNameLabel = houseNameLabel;
    }
    return _houseNameLabel;
}

- (void)dealBuyBtn{
    BookOrderController *bookOrderController = [[BookOrderController alloc] init];
    RelatedProductViewModel *model = (RelatedProductViewModel *)self.model;
    bookOrderController.earnestMoney = model.price;
    bookOrderController.rentGuid = model.guid;
    [self.controller.navigationController pushViewController:bookOrderController animated:YES];
}

- (UILabel *)priceLabel{
    return nil;
}

- (UILabel *)surplusLabel{
    return nil;
}

- (void)setValueWith:(id)data{
    [ZJModelTool createModelWithDictionary:data modelName:nil];
    RelatedProductViewModel *model = [RelatedProductViewModel modelWithDictionary:data];
    self.model = model;
    
//    @property (nonatomic,weak) UIImageView *backImage;
//    @property (nonatomic,weak) UILabel *timeLabel;
//    @property (nonatomic,weak) UILabel *houseTypeLabel;
//    @property (nonatomic,weak) UILabel *sizeLabel;
//    @property (nonatomic,weak) UIButton *buyButton;
//    
//    @property (nonatomic,copy) NSString *buildingSize;
//    @property (nonatomic,weak) NSString *imageUrl;
//    @property (nonatomic,copy) NSString *houseType;
    [self.buyButton setTitle:@"立即预定" forState:UIControlStateNormal];
    [self.backImage lfSetImageWithURL:model.houseImageGuid[0]];
    
    self.timeLabel.text = [NSString stringWithFormat:@"【%@】",model.houseWeek];
    self.timeLabel.textColor = [UIColor colorWithRed:(float)3/255 green:(float)167/255 blue:(float)156/255 alpha:1.000];
    
    self.houseNameLabel.text = model.houseName;
    
    self.houseTypeLabel.text = model.houseType;
    self.houseTypeLabel.textColor = [UIColor grayColor];
    
    self.sizeLabel.textColor = [UIColor redColor];
    self.sizeLabel.text = [NSString stringWithFormat:@"￥%@",model.price];
    
}
@end
