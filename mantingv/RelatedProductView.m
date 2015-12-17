//
//  RelatedProductView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/17.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "RelatedProductView.h"

@implementation RelatedProductView

- (void)setValueWithModel:(MTModel *)model{
    [self.buyButton setTitle:@"立即预订" forState:UIControlStateNormal];
}
- (void)dealBuyBtn{
    NSLog(@"oh shit");
}

- (UILabel *)priceLabel{
    return nil;
}

- (UILabel *)surplusLabel{
    return nil;
}
@end
