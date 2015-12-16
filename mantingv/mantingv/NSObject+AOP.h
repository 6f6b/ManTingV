//
//  NSObject+AOP.h
//  test
//
//  Created by LiuFeng on 15/12/10.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSObject (AOP)
- (void)exchangeMethodWithNewMethod:(SEL)newMothod oldMethod:(SEL)oldMethod;
@end
