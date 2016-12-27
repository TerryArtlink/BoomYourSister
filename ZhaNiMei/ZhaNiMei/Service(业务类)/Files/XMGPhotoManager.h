//
//  XMGPhotoManager.h
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/22.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PHAssetCollection;

//能存储图片到相册
@interface XMGPhotoManager : NSObject

/**
 存图片到相册
 
 @param image 存的图片
 @param title 相册标题
 @param completionHandler 存储完成,造作
 */
+ (void)savePhoto:(UIImage *)image toCollection:(NSString *)title completionHandler:(void(^)(BOOL success, NSError *error))completionHandler;
/**
 查询相册,根据相册名字
 
 @param title 相册名
 @return 查询到相册
 */
+ (PHAssetCollection *)searchCollection:(NSString *)title;


@end
