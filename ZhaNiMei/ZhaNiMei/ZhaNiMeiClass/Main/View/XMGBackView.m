//
//  XMGBackView.m
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/10.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import "XMGBackView.h"

@implementation XMGBackView


+ (instancetype)backViewWithImageName:(NSString *)name HighlightName:(NSString *)HighlightName target:(id)target action:(SEL)action {
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [backBtn setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    
    [backBtn setImage:[UIImage imageNamed:HighlightName] forState:UIControlStateHighlighted];
    
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    
    [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [backBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    
    [backBtn sizeToFit];
    
    [backBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    //通过view包装以解决超出范围响应的bug
    XMGBackView *backView = [[XMGBackView alloc] initWithFrame:backBtn.bounds];
    
    [backBtn addSubview:backBtn];
    
    return backView;
    
}

@end
