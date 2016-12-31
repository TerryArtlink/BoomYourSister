//
//  XMGCategoryModel.h
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/31.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMGCategoryModel : NSObject
//
@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *id;
@property(nonatomic, strong) NSMutableArray *alreadyLoadArr;
@property(nonatomic, assign) NSInteger page;
@property(nonatomic, assign) NSInteger total_page;

@end
