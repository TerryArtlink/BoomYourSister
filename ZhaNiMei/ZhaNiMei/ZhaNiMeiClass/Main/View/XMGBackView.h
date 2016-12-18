//
//  XMGBackView.h
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/10.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XMGBackView : UIView

+ (instancetype)backViewWithImageName:(NSString *)name HighlightName:(NSString *)HighlightName target:(id)target action:(SEL)action;

@end
