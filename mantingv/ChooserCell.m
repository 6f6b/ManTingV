//
//  ChooserCell.m
//  mantingv
//
//  Created by LiuFeng on 15/12/14.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ChooserCell.h"
#import "ChooserView.h"

@implementation ChooserCell

- (void)awakeFromNib {
    //创建条件选择器
    NSArray *buttonTitles = @[@"选择目的地",@"选择价格",@"选择主题"];
    ChooserView *chooserView = [ChooserView shareChooserViewWith:CGPointMake(0, 0)];
    [chooserView setTitlesOfButtonWith:buttonTitles];
    [chooserView setDataArraysWith:@[@[@"11",@"21",@"31",@"5"],@[@"12",@"22",@"32"],@[@"13",@"23",@"33"]]];
    [chooserView setClickedAction:^(NSInteger indexOfDataAndButtons, NSIndexPath *indexPath) {
        
    }];
    [self.contentView addSubview:chooserView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
