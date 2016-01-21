//
//  LeaveWordView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/15.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "LeaveWordView.h"

@interface LeaveWordView ()<UITextFieldDelegate>
@property (nonatomic,weak) UILabel *leaveWordLabel;
@property (nonatomic,weak) UITextField *leaveWordTextField;
@end
@implementation LeaveWordView

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    UIView *superView = self;
    
    [self.leaveWordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //位于 父视图 竖直中心
        make.centerY.equalTo(superView);
        
        //距 父视图 左侧 5
        make.left.equalTo(superView).with.offset(5);
    }];
    
    
    [self.leaveWordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        //位于 父视图 竖直中心
        make.centerY.equalTo(superView);
        
        //距 self.leaveWordLabel 右侧 5
        make.left.equalTo(self.leaveWordLabel.mas_right).with.offset(5);
        
        make.width.equalTo(@200);
    }];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillChangeFrame:) name:UIKeyboardDidChangeFrameNotification object:nil];
}

- (UILabel *)leaveWordLabel{
    if (nil == _leaveWordLabel) {
        UILabel *leaveWordLabel = [[UILabel alloc] init];
        leaveWordLabel.text = @"给卖家留言：";
        [self addSubview:leaveWordLabel];
        _leaveWordLabel = leaveWordLabel;
    }
    return _leaveWordLabel;
}

- (UITextField *)leaveWordTextField{
    if (nil == _leaveWordTextField) {
        UITextField *leaveWordTextField = [[UITextField alloc] init];
        leaveWordTextField.delegate = self;
        leaveWordTextField.placeholder = @"请输入留言";
        [self addSubview:leaveWordTextField];
        _leaveWordTextField = leaveWordTextField;
    }
    return _leaveWordTextField;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.leaveWordTextField resignFirstResponder];
    return YES;
}

//- (void)keyBoardWillChangeFrame:(NSNotification *)notif{
//    
//    NSLog(@"改变");
//    NSDictionary *userInfo = notif.userInfo;
//    double duration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
//    CGRect beginFrame = [userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
//    CGRect endFrame = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
//    
//    
//    CGFloat changeY = beginFrame.origin.y-endFrame.origin.y;
//    [UIView animateWithDuration:duration animations:^{
//        UIScrollView *scrollView = (UIScrollView *)self.superview;
//        
//        CGSize size = scrollView.contentSize;
//        size.height = size.height+changeY;
//        scrollView.contentSize = size;
//    }];
//}

@end
