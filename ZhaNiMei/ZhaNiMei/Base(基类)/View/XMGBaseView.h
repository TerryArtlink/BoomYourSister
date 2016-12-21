//
//  XMGTopicModel.h
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/19.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XMGTopicModel;

@interface XMGBaseView : UIView

+ (instancetype)viewFromXib;

@property(nonatomic, strong) XMGTopicModel *model;

@end
