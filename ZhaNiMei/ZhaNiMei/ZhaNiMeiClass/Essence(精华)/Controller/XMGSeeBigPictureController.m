//
//  XMGSeeBigPictureController.m
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/22.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import "XMGSeeBigPictureController.h"
#import "XMGTopicModel.h"
#import <SDImageCache.h>
#import <UIImageView+WebCache.h>
#import <SVProgressHUD.h>
#import <Photos/Photos.h>
#import "XMGPhotoManager.h"

#define collectionTitle @"百思不得姐"

@interface XMGSeeBigPictureController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *saveBtn;

@property (weak, nonatomic) IBOutlet UIButton *backBtn;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

//属性
@property (nonatomic, weak) UIImageView *imageV;

@end

@implementation XMGSeeBigPictureController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //大图片,从顶上开始
    //小图片,放在中间
    _scrollView.delegate = self;
    
    CGFloat imageH = XMGScreenW * _model.height / _model.width;
    
    UIImage *image = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:self.model.image1];
    if (image) {
        _saveBtn.enabled = YES;
    }
    
    UIImageView *imageV = [[UIImageView alloc] init];
    self.imageV = imageV;
    [imageV sd_setImageWithURL:self.model.image0.xmg_url placeholderImage:image completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (image) {
            _saveBtn.enabled = YES;
        }
    }];
    
    imageV.frame = CGRectMake(0, 0, XMGScreenW, imageH);
    
    [_scrollView addSubview:imageV];
    
    if (imageH > XMGScreenH) {
        _scrollView.contentSize = CGSizeMake(0, imageH);
        _scrollView.minimumZoomScale = 1.0;
        _scrollView.maximumZoomScale = 2.0;
    }else {
        imageV.center = CGPointMake(XMGScreenW * 0.5, XMGScreenH * 0.5);
    }
}

#pragma mark - ScrollView代理
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageV;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)saveBtnClick:(id)sender {
    //判断用户权限
    /* 
     PHAuthorizationStatusNotDetermined = 0,    //未决定  PHAuthorizationStatusRestricted,         // 家长控制状态       PHAuthorizationStatusDenied,        //拒绝
     PHAuthorizationStatusAuthorized     // 允许授权
     */
    
    PHAuthorizationStatus stutas = [PHPhotoLibrary authorizationStatus];
    
    if (stutas == PHAuthorizationStatusAuthorized) { //允许
        //保存相片到相册
        [XMGPhotoManager savePhoto:_imageV toCollection:collectionTitle completionHandler:^(BOOL success, NSError *error) {
            if (success) {
                [SVProgressHUD showSuccessWithStatus:@"图片保存成功"];
            }else {
                [SVProgressHUD showErrorWithStatus:@"图片保存失败,是不是该换手机了?"];
            }
        }];
    }else if (stutas == PHAuthorizationStatusNotDetermined) { //未决定
        
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            if (status == PHAuthorizationStatusAuthorized) {
                //保存相片到相册
                [XMGPhotoManager savePhoto:_imageV toCollection:collectionTitle completionHandler:^(BOOL success, NSError *error) {
                    if (success) {
                        [SVProgressHUD showSuccessWithStatus:@"图片保存成功"];
                    }else {
                        [SVProgressHUD showErrorWithStatus:@"图片保存失败了,是不是该换手机了?"];
                    }
                }];
            }
        }];
        
    }else { //拒绝
        if ([[UIApplication sharedApplication] canOpenURL:UIApplicationOpenSettingsURLString.xmg_url]) {
            [[UIApplication sharedApplication] openURL:UIApplicationOpenSettingsURLString.xmg_url];
        }
    }
}





- (IBAction)backAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
