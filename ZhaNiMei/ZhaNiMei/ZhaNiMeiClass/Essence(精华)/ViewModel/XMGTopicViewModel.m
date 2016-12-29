
//
//  XMGTopicViewModel.m
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/21.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import "XMGTopicViewModel.h"
#import "XMGTopicModel.h"
#import "XMGCommentModel.h"

@implementation XMGTopicViewModel

- (void)setModel:(XMGTopicModel *)model {
    _model = model;
    
    //计算cell的高度
    //计算topView的高度
    CGFloat margin = 10;
    CGFloat originalY = 55;
    CGFloat textW = XMGScreenW - 2 * margin;
    CGFloat textH = [model.text sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:CGSizeMake(textW, CGFLOAT_MAX)].height;
    
    
    
    CGFloat topViewX = 0;
    CGFloat topViewY = 0;
    CGFloat topViewW = XMGScreenW;
    CGFloat topViewH = originalY + textH;
    CGRect topViewFrame = CGRectMake(topViewX, topViewY, topViewW, topViewH);
    
    CGFloat cellHeight = CGRectGetMaxY(topViewFrame) + margin;
    _cellHeight = cellHeight;
    _topViewFrame = topViewFrame;
    //midView
    if (model.type != TopicMidTypeText) { //非段子
        CGFloat h = textW/model.width * model.height;
        
        if (h > XMGScreenH && !model.is_gif) {
            model.is_bigPic = YES;
            h = 300;
        }
        CGFloat midViewX = margin;
        CGFloat midViewY = cellHeight;
        CGFloat midViewW = textW;
        CGFloat midViewH = h;
        
        CGRect midViewFrame = CGRectMake(midViewX, midViewY, midViewW, midViewH);
        
        _midViewFrame = midViewFrame;
        
        _cellHeight = CGRectGetMaxY(midViewFrame) + margin;
    }
    
    if (model.hotComment) {
        //comment
        CGFloat commentViewX = margin;
        CGFloat commentViewY = _cellHeight;
        CGFloat commentViewW = XMGScreenW - 2*margin;
        CGFloat commentViewH = 42;
        
        if (model.hotComment.cmt_type == TopicMidTypeText) {
            
            commentViewH = [model.hotComment.allContent sizeWithFont:[UIFont systemFontOfSize:17] constrainedToSize:CGSizeMake(textW, CGFLOAT_MAX)].height + 21;
        }
        
        CGRect commentFrame = CGRectMake(commentViewX, commentViewY, commentViewW, commentViewH);
        
        _commentFrame = commentFrame;
        
        _cellHeight = CGRectGetMaxY(commentFrame) + margin;
    }
    
    //bottom
    CGRect bottomViewFrame = CGRectMake(0, _cellHeight, XMGScreenW, 35);
    
    _bottomViewFrame = bottomViewFrame;
    
    _cellHeight += 35;
}

@end
