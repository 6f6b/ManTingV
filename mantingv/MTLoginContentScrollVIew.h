//
//  MTLoginContentScrollVIew.h
//  mantingv
//
//  Created by LiuFeng on 15/12/16.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MTBaseScrollView.h"
#import "MTLoginModule.h"
#import "MTRegisterPreview.h"
@interface MTLoginContentScrollVIew : MTBaseScrollView
@property (nonatomic,weak) UIImageView *backImage;
@property (nonatomic,weak) MTLoginModule *loginModule;
@property (nonatomic,weak) MTRegisterPreview *registerPreview;
@end
