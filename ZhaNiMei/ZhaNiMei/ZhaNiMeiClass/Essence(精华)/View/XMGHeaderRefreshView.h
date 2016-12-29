//
//  XMGHeaderRefreshView.h
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/29.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XMGHeaderRefreshView : UIView

+(instancetype)viewFromXib;

@property(nonatomic, assign) BOOL isAllAppear; //属性

@property(nonatomic, assign) BOOL isLoading;

@end
