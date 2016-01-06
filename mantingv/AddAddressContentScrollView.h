//
//  AddAddressContentScrollView.h
//  mantingv
//
//  Created by LiuFeng on 16/1/6.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "MTBaseScrollView.h"
#import "ContactPersonEditView.h"
#import "ContactAddressEditView.h"

@interface AddAddressContentScrollView : MTBaseScrollView
@property (nonatomic,weak) ContactPersonEditView *contactPersonEditView;
@property (nonatomic,weak) ContactAddressEditView *contactAddressEditView;
@property (nonatomic,weak) UITextField *addressForDetailTextFiled;
@end
