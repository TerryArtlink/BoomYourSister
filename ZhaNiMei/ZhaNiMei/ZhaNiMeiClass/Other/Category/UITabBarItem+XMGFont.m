//
//  UITabBarItem+XMGFont.m
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/12.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import "UITabBarItem+XMGFont.h"

@implementation UITabBarItem (XMGFont)

- (void)setAttributesFont:(UIFont *)font {
    //创建字典属性
    NSMutableDictionary *attribu = [NSMutableDictionary dictionary];
    
    attribu[NSFontAttributeName] = font;
    
    //设置字体,字体不分状态,直接使用 UIControllStateNormal
    [self setTitleTextAttributes:attribu forState:UIControlStateNormal];
}

@end
