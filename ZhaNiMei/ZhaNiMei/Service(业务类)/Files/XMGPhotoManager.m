//
//  XMGPhotoManager.m
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/22.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import "XMGPhotoManager.h"
#import <Photos/Photos.h>

@implementation XMGPhotoManager

+ (void)savePhoto:(UIImage *)image toCollection:(NSString *)title completionHandler:(void (^)(BOOL, NSError *))completionHandler {
    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
        //创建一个请求,把一个图片存储到相册
        //1.把图片存到系统相册
        //2.存图片之前,先在相册中给它创建一个占位对象,存储完成后,占位对象引用到真实的图片
        PHAssetChangeRequest *createAssetRequest = [PHAssetChangeRequest creationRequestForAssetFromImage:image];
        
        //创建一个自定义的相册,并且生成一个相册请求对象.
        PHAssetCollection *collection = [self searchCollection:title];
        
        PHAssetCollectionChangeRequest *albumChangeRequest;
        
        if (collection) {
            albumChangeRequest = [PHAssetCollectionChangeRequest changeRequestForAssetCollection:collection];
        }else {
            albumChangeRequest = [PHAssetCollectionChangeRequest creationRequestForAssetCollectionWithTitle:title];
        }
        
        //通过相片请求对象,获得存储的图片的占位对象
        PHObjectPlaceholder *assetPlaceholder = [createAssetRequest placeholderForCreatedAsset];
        
        //把占位对象作为参数,实现引用存储图片到相册
        [albumChangeRequest addAssets:@[assetPlaceholder]];
        
    } completionHandler:completionHandler];
}

+ (void)savePhoto322:(UIImage *)image toCollection:(NSString *)title completionHandler:(void (^)(BOOL, NSError *))completionHandler {
    
    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
        //创建一个请求,把一个图片存储到相册
        //1.把图片存到系统相册
        //2.存图片前,现在相册中给他创建一个占位对象,存储完成后,占位对象引用到真实的图片
        PHAssetChangeRequest *createAssetRequest = [PHAssetCreationRequest creationRequestForAssetFromImage:image];
        
        //创建一个自定义的相册,并且生成一个相册请求对象
        PHAssetCollection *collection = [self searchCollection:title];
        
        PHAssetCollectionChangeRequest *albumChangeRequest;
        
        if (collection) {
            albumChangeRequest = [PHAssetCollectionChangeRequest changeRequestForAssetCollection:collection];
        }else {
            albumChangeRequest = [PHAssetCollectionChangeRequest creationRequestForAssetCollectionWithTitle:title];
        }
        
        //通过相片请求对象,获得存储的图片的占位对象
        PHObjectPlaceholder *assetPlaceholder = [createAssetRequest placeholderForCreatedAsset];
        
        //把占位对象作为参数,实现引用存储图片到相册
        [albumChangeRequest addAssets:@[assetPlaceholder]];
        //end
    } completionHandler:^(BOOL success, NSError *error) {
        
        if (completionHandler) {
            completionHandler(success,error);
        }
    } ];
}

//查询相册
+ (PHAssetCollection *)searchCollection:(NSString *)title {
    PHFetchResult *result = [PHAssetCollection
                             fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum
                             subtype:PHAssetCollectionSubtypeAlbumRegular
                             options:nil];
    
    for (PHAssetCollection *collection in result) {
        
        if ([collection.localizedTitle isEqualToString:title]) {
            return collection;
        }
    }
    return nil;
}
@end
