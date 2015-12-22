//
//  LFStepper.h
//  TEST
//
//  Created by LiuFeng on 15/12/22.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LFStepper : UIView
@property (nonatomic,assign) NSInteger value;

+ (instancetype)lfStepperWithFrame:(CGRect)frame;
@end
