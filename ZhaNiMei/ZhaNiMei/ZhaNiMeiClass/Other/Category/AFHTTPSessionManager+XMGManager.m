//
//  AFHTTPSessionManager+XMGManager.m
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/12.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import "AFHTTPSessionManager+XMGManager.h"

@implementation AFHTTPSessionManager (XMGManager)
+(instancetype)xmg_manager {
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html", nil];
    
    return mgr;
}

- (NSURLSessionDataTask *)xmg_GET:(NSString *)URLString
                       parameters:(id)parameters
                         progress:(void (^)(NSProgress *_Nonnull))downloadProgress
                          success:(void (^)(NSURLSessionDataTask *_Nonnull, id _Nullable))success
                          failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError *_Nonnull))failure {
    
    return [self GET:URLString parameters:parameters progress:downloadProgress success:success failure:failure];
    
}
@end
