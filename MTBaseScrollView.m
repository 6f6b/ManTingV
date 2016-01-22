//
//  MTBaseScrollView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/14.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MTBaseScrollView.h"

@interface MTBaseScrollView()<UIScrollViewDelegate>
@end
@implementation MTBaseScrollView
- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.delegate = self;
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillChangeFrame:) name:UIKeyboardDidChangeFrameNotification object:nil];
    }
    return self;
}

- (AFHTTPSessionManagerForMT *)manager{
    if (nil == _manager) {
        _manager = [AFHTTPSessionManagerForMT manager];
        _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    }
    return _manager;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (scrollView.contentOffset.y<=-50) {
        NSLog(@"刷新");
    }
}

- (void)setValueWith:(id)data{
}

//- (void)keyBoardWillChangeFrame:(NSNotification *)notif{
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillChangeFrame:) name:UIKeyboardDidChangeFrameNotification object:nil];
//    
//    NSLog(@"改变");
//    NSDictionary *userInfo = notif.userInfo;
//    double duration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
//    CGRect beginFrame = [userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
//    CGRect endFrame = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
//    
//    
//    CGFloat changeY = beginFrame.origin.y-endFrame.origin.y;
//    NSLog(@"change %f-----%@",changeY,self);
//    [UIView animateWithDuration:duration animations:^{
//        CGSize size = self.contentSize;
//        size.height = size.height+changeY;
//        self.contentSize = size;
//    }];
//}
@end
