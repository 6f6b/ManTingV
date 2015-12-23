//
//  UIImageView+LF.h
//  mantingv
//
//  Created by LiuFeng on 15/12/23.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (LF)
- (void)lfSetImageWithURL:(NSString *)imageGuid;
- (void)lfSetImageWithURL:(NSString *)imageGuid placeholderImage:(UIImage *)placeholderImage;
@end
