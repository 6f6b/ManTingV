//
//  GetSignatureController.m
//  mantingv
//
//  Created by LiuFeng on 16/2/15.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//
#import "GetSignatureView.h"
#import "GetSignatureController.h"

@interface GetSignatureController ()

@property (weak, nonatomic) IBOutlet GetSignatureView *signatureView;
@end

@implementation GetSignatureController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.000];
    // Do any additional setup after loading the view from its nib.
}

/**
 *  撤销修改
 *
 *  @param sender <#sender description#>
 */
- (IBAction)revokeBtn:(id)sender {
    [self.signatureView.lines removeLastObject];
    [self.signatureView setNeedsDisplay];
}

/**
 *  保存签名
 *
 *  @param sender <#sender description#>
 */
- (IBAction)saveBtn:(id)sender {
    [[self.signatureView subviews] makeObjectsPerformSelector:@selector(setAlpha:)];
    UIGraphicsBeginImageContext(self.signatureView.bounds.size);
    [self.signatureView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    UIImageWriteToSavedPhotosAlbum(image, self, nil, nil);
    UIGraphicsEndImageContext();
    
    for (UIView *view in [self.signatureView subviews]) {
        [view setAlpha:1];
    }
    [self.delegate getSignatureImage:image];
    [self.navigationController popViewControllerAnimated:YES];
}

/**
 *  清除签名
 *
 *  @param sender <#sender description#>
 */
- (IBAction)cleanBtn:(id)sender {
    [self.signatureView.lines removeAllObjects];
    [self.signatureView setNeedsDisplay];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
