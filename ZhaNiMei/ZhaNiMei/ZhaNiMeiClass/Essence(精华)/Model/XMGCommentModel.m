//
//  XMGCommentModel.m
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/19.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import "XMGCommentModel.h"

@implementation XMGCommentModel

- (NSString *)allContent {
    return [NSString stringWithFormat:@"%@:%@", _user.username, _content];
}

@end
