//
//  NSDate+XMGDealTime.h
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/19.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (XMGDealTime)

- (BOOL)isThisYear;
- (BOOL)isToday;
- (BOOL)isYesterToday;
- (NSDateComponents *)dealTime;

@end
