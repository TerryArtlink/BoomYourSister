//
//  XMGTopicCommentView.m
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/29.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import "XMGTopicCommentView.h"
#import "XMGTopicModel.h"
#import "XMGCommentModel.h"

@interface XMGTopicCommentView ()

@property (weak, nonatomic) IBOutlet UILabel *contextLabel;

@property (weak, nonatomic) IBOutlet UILabel *userLabel;

@property (weak, nonatomic) IBOutlet UIButton *voiceTimeLabel;

@property (weak, nonatomic) IBOutlet UIView *voiceCommentV;

@end

@implementation XMGTopicCommentView

-(void)awakeFromNib {
    [super awakeFromNib];
    
    self.autoresizingMask = UIViewAutoresizingNone;
}

-(void)setModel:(XMGTopicModel *)model {
    [super setModel:model];
    
    if (model.hotComment.cmt_type == TopicMidTypeMusic) { //语音评论
        
        self.contextLabel.hidden = YES;
        _voiceCommentV.hidden = NO;
        self.userLabel.text = model.hotComment.user.username;
        
        NSString *title = [NSString stringWithFormat:@"%@'", model.hotComment.voicetime];
        
        [self.voiceTimeLabel setTitle:title forState:UIControlStateNormal];
    }else {
        _contextLabel.text = model.hotComment.allContent;
        self.contextLabel.hidden = NO;
        _voiceCommentV.hidden = YES;
    }
}






@end








