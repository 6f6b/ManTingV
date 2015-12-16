//
//  ResortFacilitiesView.m
//  test
//
//  Created by LiuFeng on 15/12/11.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ResortFacilitiesView.h"

@interface ResortFacilitiesView ()
@end
@implementation ResortFacilitiesView

- (void)setValue{
    for(int i=0;i<10;i++){
        CGFloat X = (self.frame.size.width/4)*(i%4);
        CGFloat Y = i/4*30;
        CGFloat W = self.frame.size.width/4;
        CGFloat H = 30;
    
        UILabel *label = [[UILabel alloc] init];
        label.backgroundColor = [UIColor redColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"空调";
        label.frame = CGRectMake(X, Y, W, H);
        [self addSubview:label];
        
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, CGRectGetMaxY(label.frame));
    }
}

@end
