//
//  AFHTTPSessionManager+XMGManager.h
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/12.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface AFHTTPSessionManager (XMGManager)

//自己封装的网络请求者

//设置了接受text/html数据格式的JSON数据

+(instancetype)xmg_manager;

//自己基于AFN的GET请求进行封装的GET方法

- (NSURLSessionDataTask *)xmg_GET:(NSString *)URLString
                       parameters:(id)parameters
                         progress:(void (^)(NSProgress *))downloadProgress
                          success:(void (^)(NSURLSessionDataTask *, id))success
                          failure:(void (^)(NSURLSessionDataTask *, NSError *))failure;

@end
