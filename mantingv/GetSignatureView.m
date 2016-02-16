//
//  GetSignatureView.m
//  mantingv
//
//  Created by LiuFeng on 16/2/15.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "GetSignatureView.h"
@interface GetSignatureView ()
@property (nonatomic,strong) NSMutableArray *points;
@end


@implementation GetSignatureView
- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    self.lines = [[NSMutableArray alloc] init];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.points = [[NSMutableArray alloc] init];
    [self.lines addObject:self.points];
    
    CGPoint point = [[touches anyObject] locationInView:self];
    NSString *pointString = NSStringFromCGPoint(point);
    [self.points addObject:pointString];
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint point = [[[touches allObjects] firstObject] locationInView:self];
    NSString *pointString = NSStringFromCGPoint(point);
    [self.points addObject:pointString];
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint point = [[[touches allObjects] lastObject] locationInView:self];
    NSString *pointString = NSStringFromCGPoint(point);
    [self.points addObject:pointString];
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect{
    //获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 4);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    for(int i=0;i<self.lines.count;i++){
        NSArray *points = self.lines[i];
        
        for ( int j=0; j<points.count-1; j++) {
            if (points.count<=1) {
                break;
            }
            CGPoint startPoint = CGPointFromString(points[j]);
            CGPoint endPoint = CGPointFromString(points[j+1]);
            CGContextBeginPath(context);
            CGContextMoveToPoint(context, startPoint.x, startPoint.y);
            CGContextAddLineToPoint(context, endPoint.x, endPoint.y);
            CGContextStrokePath(context);
        }
    }
}


@end
