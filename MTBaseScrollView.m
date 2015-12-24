//
//  MTBaseScrollView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/14.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MTBaseScrollView.h"

@implementation MTBaseScrollView
- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.manager = [AFHTTPSessionManager manager];
        self.manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    }
    return self;
}

- (void)setValueWith:(id)data{

}
@end
