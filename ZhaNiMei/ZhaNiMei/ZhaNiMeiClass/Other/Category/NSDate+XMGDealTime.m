//
//  NSDate+XMGDealTime.m
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/19.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import "NSDate+XMGDealTime.h"

@implementation NSDate (XMGDealTime)

- (BOOL)isThisYear {
    //实例一个日历类
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *nowComp = [calendar components:NSCalendarUnitYear fromDate:[NSDate date]];
    
    NSDateComponents *creatComp = [calendar components:NSCalendarUnitYear fromDate:self];
    
    return nowComp.year == creatComp.year;
}

- (BOOL)isToday {
    //实例一个日历类
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    return [calendar isDateInToday:self];
}

- (BOOL)isYesterToday {
    //实例一个日历类
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    return [calendar isDateInYesterday:self];
}

- (NSDateComponents *)dealTime {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    return [calendar components:NSCalendarUnitHour|NSCalendarUnitMinute fromDate:self toDate:[NSDate date] options:NSCalendarWrapComponents];
    
}
@end
