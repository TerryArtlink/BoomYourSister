//
//  NSString+XMGURL.m
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/12.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import "NSString+XMGURL.h"

@implementation NSString (XMGURL)

- (NSURL *)xmg_url {
    return [NSURL URLWithString:self];
}

@end
