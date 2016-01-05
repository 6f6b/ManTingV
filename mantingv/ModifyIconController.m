//
//  ModifyIconController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/17.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ModifyIconController.h"


@interface ModifyIconController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (nonatomic,copy) NSString *imageGuid;
@end

@implementation ModifyIconController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *urlWithOutGuid = [BASE_URL stringByAppendingString:@"/user/user_info/"];
    NSString *urlWithGuid = [urlWithOutGuid stringByAppendingString:[user objectForKey:USER_GUID]];
    [self.manager GET:urlWithGuid parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSDictionary *data = [dic objectForKey:@"data"];
        UserAccount *account = [UserAccount modelWithDictionary:data];
        [self.headImage lfSetImageWithURL:account.imageGuid];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (IBAction)modifyIcon:(id)sender {
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = sourceType;
    picker.allowsEditing = YES;
    picker.delegate = self;
    [self presentViewController:picker animated:YES completion:^{
        
    }];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
    
    NSString *url = [BASE_URL stringByAppendingString:@"/public/upload"];
    [KVNProgress showWithStatus:@"正在上传"];
    
    [self.manager POST:url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:imageData name:@"image" fileName:@"image.jpg" mimeType:@"image/jpeg"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        if ([[dic objectForKey:@"result"] isEqualToString:@"SUCCESS"]) {
            [KVNProgress dismiss];
            [KVNProgress showSuccessWithStatus:@"上传成功！"];
            NSString *imageGuid = [dic objectForKey:@"data"];
            self.imageGuid = imageGuid;
            [self.headImage lfSetImageWithURL:imageGuid];
            
            
            //加载个人信息
            [self loadPersonInformationFromServer];
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}

- (void)loadPersonInformationFromServer{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *guid = [user objectForKey:USER_GUID];
    
    NSString *urlWithOutGuid = [BASE_URL stringByAppendingString:@"/user/user_info/"];
    NSString *urlWithGuid = [urlWithOutGuid stringByAppendingString:guid];
    
    [self.manager GET:urlWithGuid parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSDictionary *data = [dic objectForKey:@"data"];
        [self refreshDataInServerWith:data];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];

}

- (void)refreshDataInServerWith:(id )data{
    UserAccount *userAccount = [UserAccount modelWithDictionary:data];
    [ZJModelTool createModelWithDictionary:data modelName:nil];
    NSMutableDictionary *dic = [userAccount mj_keyValues];
    [dic setValue:self.imageGuid forKey:@"image"];
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *userGuid = [user objectForKey:USER_GUID];
    [dic setValue:userGuid forKey:@"userGuid"];

    NSString *url = [BASE_URL stringByAppendingString:@"/user/update"];
    
    [dic removeObjectForKey:@"phoneNum"];
    [dic removeObjectForKey:@"imageGuid"];
    [dic removeObjectForKey:@"birthday"];
//    [dic removeObjectForKey:@"city"];
//    [dic removeObjectForKey:@"district"];
    [dic removeObjectForKey:@"email"];
    [dic removeObjectForKey:@"gender"];
    [dic removeObjectForKey:@"position"];
//    [dic removeObjectForKey:@"province"];
    [dic removeObjectForKey:@"username"];
    
    NSLog(@"%@",dic);
    [self.manager POST:url parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"--------->%@",dic);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
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
