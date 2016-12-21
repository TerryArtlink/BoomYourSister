//
//  XMGTopicViewModel.h
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/21.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XMGTopicModel;

@interface XMGTopicViewModel : NSObject

//
@property(nonatomic, strong) XMGTopicModel *model;

//顶部视图的view
@property(nonatomic, assign)CGRect topViewFrame;

//cell高度
@property(nonatomic, assign)CGFloat cellHeight;

//中间视图的frame
@property(nonatomic, assign)CGRect midViewFrame;

//评论的view
@property(nonatomic, assign)CGRect commentFrame;

@property(nonatomic, assign)CGRect bottomViewFrame;

@end
