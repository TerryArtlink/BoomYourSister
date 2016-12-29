//
//  XMGTopicVoiceView.m
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/29.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import "XMGTopicVoiceView.h"
#import <UIImageView+WebCache.h>
#import "XMGTopicModel.h"

@interface XMGTopicVoiceView ()

@property (weak, nonatomic) IBOutlet UIImageView *picImageView;

@property (weak, nonatomic) IBOutlet UILabel *playTimeLabel;

@property (weak, nonatomic) IBOutlet UILabel *playCountLabel;


@end

@implementation XMGTopicVoiceView

-(void)setModel:(XMGTopicModel *)model {
    [super setModel:model];
    
    [self.picImageView sd_setImageWithURL:model.image0.xmg_url];
    
    self.playCountLabel.text = [NSString stringWithFormat:@"%@播放", model.playcount];
    
    CGFloat min = model.voicetime/60;
    CGFloat sec = model.voicetime%60;
    
    self.playTimeLabel.text = [NSString stringWithFormat:@"%02.f:%02.f", min, sec];

}


@end
