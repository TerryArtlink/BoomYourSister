//
//  UIImage+XMGRender.m
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/12.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import "UIImage+XMGRender.h"

@implementation UIImage (XMGRender)

+ (instancetype)imageNamedWithRenderName:(NSString *)name {
    UIImage *image = [UIImage imageNamed:name];//
    
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

@end
