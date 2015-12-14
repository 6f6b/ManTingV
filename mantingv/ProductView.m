//
//  ProductView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/6.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ProductView.h"

@implementation ProductView

//@property (nonatomic,weak) UILabel *titleLabel;
//@property (nonatomic,weak) UILabel *seeMoreLabel;
//@property (nonatomic,weak) UIImageView *backImage;
//@property (nonatomic,weak) UILabel *priceLabel;
//@property (nonatomic,weak) UILabel *locationLabel;
//@property (nonatomic,weak) UILabel *seeDetailLabel;
//@property (nonatomic,weak) UILabel *descriptionLabel;


- (void)willMoveToSuperview:(UIView *)newSuperview{
    CGFloat selfW = self.frame.size.width;
    CGFloat selfH = self.frame.size.height;
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.backgroundColor = [UIColor orangeColor];
    self.titleLabel = titleLabel;
    CGFloat titlelabelX = 10;
    CGFloat titlelabelY = 10;
    CGFloat titlelabelW = 20;
    CGFloat titlelabelH = 20;
    self.titleLabel.frame = CGRectMake(titlelabelX, titlelabelY, titlelabelW, titlelabelH);
    [self addSubview:self.titleLabel];
    
    
    UIImageView *backImage = [[UIImageView alloc] init];
    backImage.backgroundColor = [UIColor redColor];
    self.backImage = backImage;
    CGFloat backImageX = 10;
    CGFloat backImageY = CGRectGetMaxY(self.titleLabel.frame);
    CGFloat backImageW = selfW-20;
    CGFloat backImageH = selfH-backImageY-50;
    self.backImage.frame = CGRectMake(backImageX, backImageY, backImageW, backImageH);
    [self addSubview:self.backImage];
    
    UILabel *priceLabel = [[UILabel alloc] init];
    priceLabel.backgroundColor = [UIColor orangeColor];
    self.priceLabel = priceLabel;
    CGFloat priceLabelX = 10;
    CGFloat priceLabelY = CGRectGetMaxY(self.backImage.frame)-25;
    CGFloat priceLabelW = 20;
    CGFloat priceLabelH = 20;
    self.priceLabel.frame = CGRectMake(priceLabelX, priceLabelY, priceLabelW, priceLabelH);
    [self addSubview:priceLabel];
    
    UILabel *locationLabel = [[UILabel alloc] init];
    locationLabel.backgroundColor = [UIColor orangeColor];
    self.locationLabel = locationLabel;
    CGFloat locationLabelX = 10;
    CGFloat locationLabelY = CGRectGetMaxY(self.backImage.frame)+10;
    CGFloat locationLabelW = 20;
    CGFloat locationLabelH = 20;
    self.locationLabel.frame = CGRectMake(locationLabelX, locationLabelY, locationLabelW, locationLabelH);
    [self addSubview:locationLabel];
    
    UILabel *seeDetailLabel = [[UILabel alloc] init];
    seeDetailLabel.backgroundColor = [UIColor orangeColor];
    self.seeDetailLabel = seeDetailLabel;
    CGFloat seeDetailLabelX = selfW-100;
    CGFloat seeDetailLabelY = CGRectGetMaxY(self.backImage.frame)+10;
    CGFloat seeDetailLabelW = 20;
    CGFloat seeDetailLabelH = 20;
    self.seeDetailLabel.frame = CGRectMake(seeDetailLabelX, seeDetailLabelY, seeDetailLabelW, seeDetailLabelH);
    [self addSubview:seeDetailLabel];
    
    UILabel *sizeLabel = [[UILabel alloc] init];
    self.sizeLabel = sizeLabel;
    sizeLabel.backgroundColor = [UIColor greenColor];
    CGFloat sizeLabelX = 10;
    CGFloat sizeLabelY = CGRectGetMaxY(self.locationLabel.frame)+10;
    CGFloat sizeLabelW = 50;
    CGFloat sizeLabelH = 20;
    self.sizeLabel.frame = CGRectMake(sizeLabelX, sizeLabelY, sizeLabelW, sizeLabelH);
    [self addSubview:sizeLabel];
    
    
}

- (void)setValue:(id)value forModel:(MTModel *)model{
    self.titleLabel.text = @"漫庭";
    self.titleLabel.sizeToFit;
    
    
    self.priceLabel.text = @"10000/份起";
    self.priceLabel.sizeToFit;
    
    self.locationLabel.text = @"太湖东山天境 碧波庭";
    self.locationLabel.sizeToFit;
    
    self.seeDetailLabel.text = @"查看详情";
    self.seeDetailLabel.sizeToFit;
    
    self.sizeLabel.text = @"三居室";
    self.sizeLabel.sizeToFit;
}
@end
