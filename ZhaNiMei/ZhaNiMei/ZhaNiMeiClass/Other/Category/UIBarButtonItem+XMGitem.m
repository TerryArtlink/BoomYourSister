//
//  UIBarButtonItem+XMGitem.m
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/6.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import "UIBarButtonItem+XMGitem.h"

@implementation UIBarButtonItem (XMGitem)

+ (instancetype)barButtonitemWithImageName:(NSString *)name HighlightName:(NSString *)highlightName target:(id)target action:(SEL)action {
    
    UIButton *gameBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [gameBtn setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    
    [gameBtn setImage:[UIImage imageNamed:highlightName] forState:UIControlStateHighlighted];
    
    [gameBtn sizeToFit];
    
    [gameBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    //通过View包装以解决超出范围响应bug
    UIView *contentView = [[UIView alloc] initWithFrame:gameBtn.bounds];
    
    [contentView addSubview:gameBtn];
    
    return [[self alloc] initWithCustomView:contentView];
    
}

+ (instancetype)barButtonitemWithImageName:(NSString *)name selectedName:(NSString *)selectedName target:(id)target action:(SEL)action {
    
    UIButton *gameBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [gameBtn setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    
    [gameBtn setImage:[UIImage imageNamed:selectedName] forState:UIControlStateSelected];
    
    [gameBtn sizeToFit];
    
    [gameBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    //通过view包装以解决超出范围响应bug
    UIView *contentView = [[UIView alloc] initWithFrame:gameBtn.bounds];
    
    [contentView addSubview:gameBtn];
    
    return [[self alloc] initWithCustomView:contentView];
    
}

@end
