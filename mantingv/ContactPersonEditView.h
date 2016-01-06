//
//  ContactPersonEditView.h
//  mantingv
//
//  Created by LiuFeng on 16/1/6.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "AddAdressContentViewWithTitle.h"
#import "EditViewWithTextFiled.h"

@interface ContactPersonEditView : AddAdressContentViewWithTitle
@property (nonatomic,weak) EditViewWithTextFiled *nameEditView;
@property (nonatomic,weak) EditViewWithTextFiled *phoneNumEditView;
@end
