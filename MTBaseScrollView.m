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
        //[self setValueWith:nil];
        NSLog(@"刷新");
    }
}

- (void)setValueWith:(id)data{

}
@end
