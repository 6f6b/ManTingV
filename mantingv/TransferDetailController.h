//
//  TransferDetailController.h
//  mantingv
//
//  Created by LiuFeng on 15/12/21.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "INeedBaseController.h"
#import "AssignmentDTOModel.h"

@interface TransferDetailController : INeedBaseController
@property (nonatomic,copy) NSString *assignmentGuid;
@property (nonatomic,weak) AssignmentDTOModel *assignmentDTOModel;
@end
