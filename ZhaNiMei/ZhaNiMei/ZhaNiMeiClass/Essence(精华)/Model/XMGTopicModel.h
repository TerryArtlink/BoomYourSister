//
//  XMGTopicModel.h
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/19.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import <Foundation/Foundation.h>
@class XMGCommentModel;
//1为全部(默认) 10为图片 29为段子 31为音频 41为视频

@interface XMGTopicModel : NSObject

//profile_image create_time name text
//
@property(nonatomic, strong)NSString *profile_image;

//
@property(nonatomic, strong)NSString *create_time;

//
@property(nonatomic, strong)NSString *name;

//
@property(nonatomic, strong)NSString *text;

//image0 height width is_gif
//
@property(nonatomic, strong)NSString *image0;
@property(nonatomic, strong)NSString *image1;
@property(nonatomic, strong)NSString *image2;

#pragma mark 图片属性

//图片的高度
@property(nonatomic, assign)CGFloat height;

//图片宽度
@property(nonatomic, assign)CGFloat width;

//是否动图
@property(nonatomic, assign) BOOL is_gif;
@property(nonatomic, assign) NSInteger type;

//是否是大图
@property(nonatomic, assign) BOOL is_bigPic;


#pragma mark vieo属性
//videoUri videoTime playCount
@property(nonatomic, strong)NSString *videouri;
@property(nonatomic, assign)NSInteger *videotime;//属性
@property(nonatomic, strong)NSString *playcount;

#pragma mark voice 属性
//voiceuri voicetime
@property(nonatomic, assign)NSInteger voicetime;
@property(nonatomic, strong)NSString *voiceuri;

#pragma mark 最热评论
//top_cmt
//评论数组
@property(nonatomic, strong) NSArray *top_cmt;
//
@property(nonatomic, strong) XMGCommentModel *hotComment;
#pragma mark ----------
#pragma mark Methods 顶部视图的数据

//ding cai comment repost
@property(nonatomic, assign)NSInteger ding;
@property(nonatomic, assign)NSInteger cai;
@property(nonatomic, assign)NSInteger comment;
@property(nonatomic, assign)NSInteger repost;

@end
