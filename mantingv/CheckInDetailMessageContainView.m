//
//  CheckInDetailMessageContainView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/22.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "CheckInDetailMessageContainView.h"
#import "CheckInDetailBaseViewWithRightStepper.h"
#import "CheckInDetailBaseViewWithRightTextFeild.h"

@interface CheckInDetailMessageContainView ()
@property (nonatomic,weak) CheckInDetailBaseViewWithRightStepper *numberOfPeopleCheckIn;
@property (nonatomic,weak) CheckInDetailBaseViewWithRightTextFeild *contactPerson;
@property (nonatomic,weak) CheckInDetailBaseViewWithRightTextFeild *forReceiveMessage;
//@property (nonatomic,weak) UILabel *managementFeeLabel;
@property (nonatomic,weak) UILabel *managementFee;
@end
@implementation CheckInDetailMessageContainView

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    UIView *superView = self;
    
    [self.numberOfPeopleCheckIn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView);
        make.left.equalTo(superView);
        make.right.equalTo(superView);
        
        make.height.equalTo(@50);
    }];
    
    [self.contactPerson mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.numberOfPeopleCheckIn.mas_bottom);
        make.left.equalTo(superView);
        make.right.equalTo(superView);
        
        make.height.equalTo(self.numberOfPeopleCheckIn);
    }];
    
    [self.forReceiveMessage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contactPerson.mas_bottom);
        make.left.equalTo(superView);
        make.right.equalTo(superView);
        
        make.height.equalTo(self.contactPerson);
    }];
    
    
    [self.managementFeeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.forReceiveMessage.mas_bottom);
        
        make.right.equalTo(self.managementFee.mas_left);
        
        make.bottom.equalTo(superView);
    }];
    
    [self.managementFee mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.forReceiveMessage.mas_bottom);
        make.right.equalTo(superView).with.offset(-10);
        make.bottom.equalTo(superView);
    }];

}

- (CheckInDetailBaseViewWithRightStepper *)numberOfPeopleCheckIn{
    if (nil == _numberOfPeopleCheckIn) {
        CheckInDetailBaseViewWithRightStepper *numberOfPeopleCheckIn = [[CheckInDetailBaseViewWithRightStepper alloc] init];
        numberOfPeopleCheckIn.leftLabel.text = @"入住人数";
        numberOfPeopleCheckIn.rightLabel.text = @"";
        numberOfPeopleCheckIn.backgroundColor = [UIColor whiteColor];
        [self addSubview:numberOfPeopleCheckIn];
        _numberOfPeopleCheckIn = numberOfPeopleCheckIn;
    }
    return _numberOfPeopleCheckIn;
}

- (CheckInDetailBaseViewWithRightTextFeild *)contactPerson{
    if (nil == _contactPerson) {
        CheckInDetailBaseViewWithRightTextFeild *contactPerson = [[CheckInDetailBaseViewWithRightTextFeild alloc] init];
        contactPerson.leftLabel.text = @"联系人";
        contactPerson.rightTextFeild.placeholder = @"姓名";
        contactPerson.backgroundColor = [UIColor whiteColor];
        [self addSubview:contactPerson];
        _contactPerson = contactPerson;
    }
    return _contactPerson;
}

- (CheckInDetailBaseViewWithRightTextFeild *)forReceiveMessage{
    if (nil == _forReceiveMessage) {
        CheckInDetailBaseViewWithRightTextFeild *forReceiveMessage = [[CheckInDetailBaseViewWithRightTextFeild alloc] init];
        forReceiveMessage.leftLabel.text = @"联系电话";
        forReceiveMessage.rightTextFeild.placeholder = @"用于接收通知";
        forReceiveMessage.backgroundColor = [UIColor whiteColor];
        [self addSubview:forReceiveMessage];
        _forReceiveMessage = forReceiveMessage;
    }
    return _forReceiveMessage;
}

- (UILabel *)managementFeeLabel{
    if (nil == _managementFeeLabel) {
        UILabel *managementFeeLabel = [[UILabel alloc] init];
        managementFeeLabel.text = @"管理费用：";
        managementFeeLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:managementFeeLabel];
        _managementFeeLabel = managementFeeLabel;
    }
    return _managementFeeLabel;
}

- (UILabel *)managementFee{
    if (nil == _managementFee) {
        UILabel *managementFee = [[UILabel alloc] init];
        managementFee.textColor = [UIColor redColor];
        managementFee.textAlignment = NSTextAlignmentCenter;
        managementFee.text = @"0.0";
        [self addSubview:managementFee];
        _managementFee = managementFee;
    }
    return _managementFee;
}


- (void)setValueWith:(id)data{
}

@end
