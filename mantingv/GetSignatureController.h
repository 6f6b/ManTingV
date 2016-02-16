//
//  GetSignatureController.h
//  mantingv
//
//  Created by LiuFeng on 16/2/15.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "MTController.h"
@protocol GetSignatureControllerDelegate <NSObject>
- (void)getSignatureImage:(UIImage *)signatureImage;
@end
@interface GetSignatureController : MTController
@property (nonatomic,weak) id <GetSignatureControllerDelegate> delegate;
@end
