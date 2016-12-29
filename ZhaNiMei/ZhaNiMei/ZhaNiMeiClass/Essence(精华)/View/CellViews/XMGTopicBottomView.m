//
//  XMGTopicBottomView.m
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/29.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import "XMGTopicBottomView.h"
#import "XMGTopicModel.h"

@interface XMGTopicBottomView ()

@property (weak, nonatomic) IBOutlet UIButton *dingBtn;

@property (weak, nonatomic) IBOutlet UIButton *caiBtn;

@property (weak, nonatomic) IBOutlet UIButton *shareBtn;

@property (weak, nonatomic) IBOutlet UIButton *commentBtn;




@end

@implementation XMGTopicBottomView

-(void)setModel:(XMGTopicModel *)model {
    [super setModel:model];
    
    [self setBtnTitleForButton:_dingBtn number:model.ding];
    [self setBtnTitleForButton:_caiBtn number:model.cai];
    [self setBtnTitleForButton:_shareBtn number:model.repost];
    [self setBtnTitleForButton:_commentBtn number:model.comment];
    
   
}

//设置按钮的标题
-(void)setBtnTitleForButton:(UIButton *)btn number:(NSInteger)number {
    NSString *title = [NSString stringWithFormat:@"%zd", number];
    if (number > 10000) {
        CGFloat count = number/10000.0;
        
        title = [NSString stringWithFormat:@"%.1f万", count];
    }
    [btn setTitle:title forState:UIControlStateNormal];
}



@end












