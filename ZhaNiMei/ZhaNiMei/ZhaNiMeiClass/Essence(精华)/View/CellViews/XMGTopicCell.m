//
//  XMGTopicCell.m
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/19.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import "XMGTopicCell.h"
#import "XMGTopicTopView.h"
#import "XMGTopicModel.h"
#import "XMGTopicViewModel.h"

#import "XMGTopicPictureView.h"
#import "XMGTopicVideoView.h"
#import "XMGTopicVoiceView.h"
#import "XMGTopicCommentView.h"
#import "XMGTopicBottomView.h"

//私有扩展
@interface XMGTopicCell ()

@property (nonatomic, weak) XMGTopicTopView *topView;
@property (nonatomic, weak) XMGTopicPictureView *topicPictureView;
@property (nonatomic, weak) XMGTopicVideoView *topicVideoView;
@property (nonatomic, weak) XMGTopicVoiceView *topicVoiceView;
@property (nonatomic, weak) XMGTopicCommentView *topicCommentView;
@property (nonatomic, weak) XMGTopicBottomView *topicBottomView;

@end

@implementation XMGTopicCell

- (void)awakeFromNib {
    [super awakeFromNib];
    //层次写在这里
    // Initialization code
}

//cell 通过注册来到, 不会调用这个方法
-(instancetype)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]) {
    }
    return self;
}

-(void)setViewModel:(XMGTopicViewModel *)viewModel {
    _viewModel = viewModel;
    //给顶部视图赋值
    self.topView.model = viewModel.model;
    self.topView.frame = viewModel.topViewFrame;
    
    //给图片View赋值
    self.topicPictureView.model = viewModel.model;
    self.topicPictureView.frame = viewModel.midViewFrame;
    
    //给VideoView赋值
    self.topicVideoView.model = viewModel.model;
    self.topicVideoView.frame = viewModel.midViewFrame;
    
    //给VoiceView赋值
    self.topicVoiceView.model = viewModel.model;
    self.topicVoiceView.frame = viewModel.midViewFrame;
    
    //给commentView赋值
    self.topicCommentView.model = viewModel.model;
    self.topicCommentView.frame = viewModel.commentFrame;
    
    //给bottomView赋值
    self.topicBottomView.model = viewModel.model;
    self.topicBottomView.frame = viewModel.bottomViewFrame;
    
    
    //控制视图是否显示
    XMGTopicModel *model = viewModel.model;
    if (model.type == TopicMidTypePicture) {
        self.topicPictureView.hidden = NO;
        self.topicVideoView.hidden = YES;
        self.topicVoiceView.hidden = YES;
    }else if (model.type == TopicMidTypeVideo) {
        self.topicPictureView.hidden = YES;
        self.topicVideoView.hidden = NO;
        self.topicVoiceView.hidden = YES;
    }else if (model.type == TopicMidTypeMusic) {
        self.topicPictureView.hidden = YES;
        self.topicVideoView.hidden = YES;
        self.topicVoiceView.hidden = NO;
    }else {
        self.topicPictureView.hidden = YES;
        self.topicVideoView.hidden = YES;
        self.topicVoiceView.hidden = YES;
    }
    
    if (model.hotComment) {
        self.topicCommentView.hidden = NO;
    }else {
        self.topicCommentView.hidden = YES;
    }
}

//cell 通过注册来到 这个方法
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //设置cell背景
        UIImageView *bacView = [[UIImageView alloc] initWithFrame:self.bounds];
        UIImage *image = [UIImage imageNamed:@"mainCellBackground"];
        image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
        bacView.image = image;
        
        [self setBackgroundView:bacView];
        
        
        //1.添加topView
        XMGTopicTopView *topView = [XMGTopicTopView viewFromXib];
        self.topView = topView;
        [self.contentView addSubview:topView];
        
        //添加midView --> 图片,视频,音乐
        //一次性全部添加进去
        //图片视图
        XMGTopicPictureView *topicPictureView = [XMGTopicPictureView viewFromXib];
        self.topicPictureView = topicPictureView;
        [self.contentView addSubview:topicPictureView];
        
        //视频视图
        XMGTopicVideoView *topicVideoView = [XMGTopicVideoView viewFromXib];
        self.topicVideoView = topicVideoView;
        [self.contentView addSubview:topicVideoView];
        
        //声音视图
        XMGTopicVoiceView *topicVoiceView = [XMGTopicVoiceView viewFromXib];
        self.topicVoiceView = topicVoiceView;
        [self.contentView addSubview:topicVoiceView];
        
        
        //添加评论view
        //声音视图
        XMGTopicCommentView *topicCommentView = [XMGTopicCommentView viewFromXib];
        self.topicCommentView = topicCommentView;
        [self.contentView addSubview:topicCommentView];
        
        //添加底部View
        XMGTopicBottomView *topicBottomView = [XMGTopicBottomView viewFromXib];
        self.topicBottomView = topicBottomView;
        [self.contentView addSubview:topicBottomView];
        
    }
    return self;
}




-(void)setFrame:(CGRect)frame {
    frame.size.height -= 10;
    frame.origin.y += 10;
    [super setFrame:frame];
}

@end































