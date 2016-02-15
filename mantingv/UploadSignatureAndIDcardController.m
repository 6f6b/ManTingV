//
//  UploadSignatureAndIDcardController.m
//  mantingv
//
//  Created by LiuFeng on 16/2/15.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "UploadSignatureAndIDcardController.h"
#import "GetSignatureController.h"

@interface UploadSignatureAndIDcardController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollview;

@property (weak, nonatomic) IBOutlet UIView *tapToUploadIDcardView;
@property (weak, nonatomic) IBOutlet UIImageView *IDcardImageView;
@property (weak, nonatomic) IBOutlet UIImageView *signatureImageView;
@end

@implementation UploadSignatureAndIDcardController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.contentScrollview.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.000];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dealGetIDcardBtn)];
    [self.tapToUploadIDcardView addGestureRecognizer:tap];
    // Do any additional setup after loading the view from its nib.
}

//点击生成身份证
- (void)dealGetIDcardBtn{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.allowsEditing = YES;
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:imagePicker animated:YES completion:^{
            
        }];
        return;
    }
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:imagePicker animated:YES completion:^{
            
        }];
    }];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:imagePicker animated:YES completion:^{
            
        }];
    }];
    
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alertController addAction:action1];
    [alertController addAction:action2];
    [alertController addAction:action3];
    
    [self presentViewController:alertController animated:YES completion:^{
        
    }];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    
    self.IDcardImageView.image = image;
}

//点击生成签名
- (IBAction)dealGenerateSignatureBtn:(id)sender {
    GetSignatureController *getSignatureController = [[GetSignatureController alloc] init];
    getSignatureController.navigationItem.title = @"生成签名";
    [self.navigationController pushViewController:getSignatureController animated:YES];
}

//上传身份证和签名
- (IBAction)dealCommit:(id)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
