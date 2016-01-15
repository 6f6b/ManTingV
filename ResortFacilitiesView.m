//
//  ResortFacilitiesView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/18.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ResortFacilitiesView.h"

@implementation ResortFacilitiesView

- (void)setValueWith:(id)data{
    NSArray *arr = data;
    for(int i=0;i<arr.count;i++){
        CGFloat X = (self.frame.size.width/4)*(i%4);
        CGFloat Y = i/4*30;
        CGFloat W = self.frame.size.width/4;
        CGFloat H = 30;
        
        UILabel *label = [[UILabel alloc] init];
//        label.shadowColor = [UIColor greenColor];
//        label.shadowOffset = CGSizeMake(-1, -1);
        label.textColor = [UIColor grayColor];
        label.textAlignment = NSTextAlignmentCenter;
        NSDictionary *dic = arr[i];
        label.text = [dic objectForKey:@"name"];
        label.frame = CGRectMake(X, Y, W, H);
        [self addSubview:label];
        
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, CGRectGetMaxY(label.frame));
    }
}

@end
