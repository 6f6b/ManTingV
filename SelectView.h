//
//  SelectView.h
//  test
//
//  Created by LiuFeng on 15/12/11.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SeclectViewDelegate<NSObject>
- (void)selectView:(UIView *)selectView;
@end
@interface SelectView : UIView
- (void)setValue;
@property (nonatomic,strong) id<SeclectViewDelegate> delegate;
@end
