//
//  XMGTopicVideoView.m
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/29.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import "XMGTopicVideoView.h"
#import <UIImageView+WebCache.h>
#import "XMGTopicModel.h"

@interface XMGTopicVideoView ()

@property (weak, nonatomic) IBOutlet UIImageView *picImageView;

@property (weak, nonatomic) IBOutlet UILabel *playCountLabel;

@property (weak, nonatomic) IBOutlet UILabel *playTimeLabel;


@end

@implementation XMGTopicVideoView

-(void)setModel:(XMGTopicModel *)model {
    [super setModel:model];
    
    [self.picImageView sd_setImageWithURL:model.image0.xmg_url];
    
    self.playCountLabel.text = [NSString stringWithFormat:@"%@播放",model.playcount];
    
    CGFloat min = model.videotime/60;
    CGFloat sec = model.videotime%60;
    
    self.playTimeLabel.text = [NSString stringWithFormat:@"%02.f:%02.f", min,sec];
    
    
}

@end
