
//
//  XMGTopicModel.m
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/19.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import "XMGTopicModel.h"
#import <MJExtension.h>
#import "XMGCommentModel.h"

@implementation XMGTopicModel

- (void)setTop_cmt:(NSArray *)top_cmt {
    if (top_cmt.count) {
        self.hotComment = top_cmt.firstObject;
    }
    _top_cmt = top_cmt;
}

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"top_cmt": @"XMGCommentModel"};
}

@end
