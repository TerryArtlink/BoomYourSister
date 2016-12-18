//
//  UIBarButtonItem+XMGitem.h
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/6.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (XMGitem)

//封装一个带高亮状态的UIBarButtonItem
/*
@param name 普通状态的图片
@param HightlightName 高亮状态图片
@param target 响应者
@param action 响应方法
@return UIBar 实例
*/

+ (instancetype)barButtonitemWithImageName:(NSString *)name HighlightName:(NSString *)highlightName target:(id)target action:(SEL)action;

+ (instancetype)barButtonitemWithImageName:(NSString *)name selectedName:(NSString *)selectedName target:(id)target action:(SEL)action;

@end
