//
//  UIImageView+LF.m
//  mantingv
//
//  Created by LiuFeng on 15/12/23.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "UIImageView+LF.h"
#import "UIImageView+WebCache.h"
#import "UIKit+AFNetworking.h"

@implementation UIImageView (LF)
- (void)lfSetImageWithURL:(NSString *)imageGuid{
    NSInteger W = (NSInteger)self.frame.size.width;
    NSInteger H = (NSInteger)self.frame.size.height;

    if (0 == W) {
        W = 375;
    }
    if (0 == H) {
        H =375;
    }
    
    NSString *urlString = [BASE_URL stringByAppendingString:[NSString stringWithFormat:@"/public/img/%@/%lu/%lu",imageGuid,W,H]];
    NSURL *url = [NSURL URLWithString:urlString];
    [self sd_setImageWithURL:url];
}

- (void)lfSetImageWithURL:(NSString *)imageGuid placeholderImage:(UIImage *)placeholderImage{
    NSInteger W = (NSInteger)self.frame.size.width;
    NSInteger H = (NSInteger)self.frame.size.height;
    
    NSString *urlString = [BASE_URL stringByAppendingString:[NSString stringWithFormat:@"/public/img/%@/%lu/%lu",imageGuid,W,H]];
    NSURL *url = [NSURL URLWithString:urlString];
    [self sd_setImageWithURL:url placeholderImage:placeholderImage];
}
@end
