//
//  CheckInDetailMessageContainView.h
//  mantingv
//
//  Created by LiuFeng on 15/12/22.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MTBaseView.h"
#import "CheckInDetailBaseViewWithRightStepper.h"
#import "CheckInDetailBaseViewWithRightTextFeild.h"
@interface CheckInDetailMessageContainView : MTBaseView
@property (nonatomic,weak) UILabel *managementFeeLabel;

@property (nonatomic,weak) CheckInDetailBaseViewWithRightStepper *numberOfPeopleCheckIn;
@property (nonatomic,weak) CheckInDetailBaseViewWithRightTextFeild *contactPerson;
@property (nonatomic,weak) CheckInDetailBaseViewWithRightTextFeild *forReceiveMessage;
@end
