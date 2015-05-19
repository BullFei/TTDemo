//
//  RequestTool.h
//  YouQuLai
//
//  Created by gaocaixin on 15/4/14.
//  Copyright (c) 2015年 GCX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestTool : NSObject

// 请求titleList
+ (void)requestTitleWithURL:(NSString*)url ListSuccess:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

// 请求url数据
+ (void)requestWithURL:(NSString *)urlStr Success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;
+ (void)removeRequestWithURL:(NSString *)urlStr Success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;
@end
