//
//  ContactAddressEditView.h
//  mantingv
//
//  Created by LiuFeng on 16/1/6.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "AddAdressContentViewWithTitle.h"
#import "EditViewWithButton.h"

@interface ContactAddressEditView : AddAdressContentViewWithTitle
@property (nonatomic,weak) EditViewWithButton *proviceEditView;
@property (nonatomic,weak) EditViewWithButton *cityEditView;
@property (nonatomic,weak) EditViewWithButton *countyEditView;
@end
