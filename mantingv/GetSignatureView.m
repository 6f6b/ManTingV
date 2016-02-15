//
//  GetSignatureView.m
//  mantingv
//
//  Created by LiuFeng on 16/2/15.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "GetSignatureView.h"
@interface GetSignatureView ()
@end


@implementation GetSignatureView
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint point = [[touches anyObject] locationInView:self];
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint point = [[[touches allObjects] lastObject] locationInView:self];
    NSLog(@"%@",NSStringFromCGPoint(point));
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

- (void)drawRect:(CGRect)rect{
    NSLog(@"OHSHIT");
}
@end
