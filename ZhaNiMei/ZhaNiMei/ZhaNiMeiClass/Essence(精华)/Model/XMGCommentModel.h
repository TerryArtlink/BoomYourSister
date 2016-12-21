//
//  XMGCommentModel.h
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/19.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMGUserModel.h"

@interface XMGCommentModel : NSObject
//voiceuri voicetime cmt_type content user

//用户模型
@property(nonatomic, strong) XMGUserModel *user;

//语音地址
@property(nonatomic, strong) NSString *voiceuri;

//语音时间
@property(nonatomic, strong)NSString *voicetime;

//评论类型
@property(nonatomic, assign)NSInteger cmt_type;

//评论内容
@property(nonatomic, strong)NSString *content;

//all评论内容
@property(nonatomic, strong)NSString *allContent;
//

@end
