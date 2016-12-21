//
//  XMGTopicTopView.m
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/19.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import "XMGTopicTopView.h"
#import <UIImageView+WebCache.h>
#import "XMGTopicModel.h"
#import "NSDate+XMGDealTime.h"

@interface XMGTopicTopView ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *creatTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation XMGTopicTopView

- (void)setModel:(XMGTopicModel *)model {
    [super setModel:model];
    
    [self.iconView sd_setImageWithURL:model.profile_image.xmg_url];
    
    self.nameLabel.text = model.name;
    
    self.textLabel.text = model.text;
    
    self.creatTimeLabel.text = [self dealTime];
}

- (NSString *)dealTime {
    //2015-08-24 19:12:20
    NSString *creatTime = self.model.create_time; //@"2016-08-24 19:12:20"
    //日期格式
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    formatter.dateFormat = @"yyyy--MM--dd HH:mm:ss";
    
    NSDate *createDate = [formatter dateFromString:creatTime];
    
    //NSCalendar NSDateComponents
    if ([createDate isThisYear]) {
        if ([createDate isToday]) {
            NSDateComponents *comp = [createDate dealTime];
            
            //今天
            if (!comp.hour) {
                if (comp.minute < 1) {
                    creatTime = @"刚刚";
                }else {
                    //一分钟外 23分钟前
                    creatTime = [NSString stringWithFormat:@"%ld 分钟前", comp.minute];
                }
                //
            }else {
                creatTime = [NSString stringWithFormat:@"%ld 小时前",comp.hour];
            }
        }else if ([createDate isYesterToday]) {
            //昨天 19:12:20
            formatter.dateFormat = @"昨天 HH:mm:ss";
            creatTime = [formatter stringFromDate:createDate];
        }else {
            //08-24 19:12:20
            formatter.dateFormat = @"MM-dd HH:mm:ss";
            creatTime = [formatter stringFromDate:createDate];
        }
    }
    return creatTime;
}

@end
