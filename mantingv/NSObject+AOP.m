//
//  NSObject+AOP.m
//  test
//
//  Created by LiuFeng on 15/12/10.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "NSObject+AOP.h"

@implementation NSObject (AOP)
- (void)exchangeMethodWithNewMethod:(SEL)newMothod oldMethod:(SEL)oldMethod{
    //保证只在整个程序中只做一次交换操作
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method new = class_getInstanceMethod([self class], newMothod);
        Method old = class_getInstanceMethod([self class], oldMethod);
    
        method_exchangeImplementations(new, old);
    });
    

}
@end
