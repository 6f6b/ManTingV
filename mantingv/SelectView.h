//
//  SelectView.h
//  mantingv
//
//  Created by LiuFeng on 15/12/18.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MTBaseView.h"

@protocol SeclectViewDelegate<NSObject>
- (void)selectView:(UIView *)selectView;
@end
@interface SelectView : MTBaseView
- (void)setValue;
@property (nonatomic,strong) id<SeclectViewDelegate> delegate;
@end
