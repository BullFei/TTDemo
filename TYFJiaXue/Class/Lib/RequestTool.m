//
//  RequestTool.m
//  YouQuLai
//
//  Created by gaocaixin on 15/4/14.
//  Copyright (c) 2015年 GCX. All rights reserved.
//

#import "RequestTool.h"
//#import "AFNTool.h"
#import "AFNetworking.h"
#import "MyMD5.h"

@implementation RequestTool
// 请求频道标题
+ (void)requestTitleWithURL:(NSString*)url ListSuccess:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{

    [self requestWithURL:url Success:^(id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)removeRequestWithURL:(NSString *)urlStr Success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    NSFileManager *manager = [NSFileManager defaultManager];
    // 文件路径
    NSString *cachePath = [NSHomeDirectory() stringByAppendingString:@"/Library/Caches/"];
    NSString *tempUrlStr = [MyMD5 md5:urlStr];
    NSString *filePath = [NSString stringWithFormat:@"%@%@", cachePath, tempUrlStr];
//    NSLog(@"%@", filePath);
//     删除原有
        [manager removeItemAtPath:filePath error:nil];
}
+ (void)requestWithURL:(NSString *)urlStr Success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    NSFileManager *manager = [NSFileManager defaultManager];
    // 文件路径
    NSString *cachePath = [NSHomeDirectory() stringByAppendingString:@"/Library/Caches/"];
    NSString *tempUrlStr = [MyMD5 md5:urlStr];
    NSString *filePath = [NSString stringWithFormat:@"%@%@", cachePath, tempUrlStr];
//    NSLog(@"%@", filePath); 
    // 删除原有
//    [manager removeItemAtPath:filePath error:nil];
    if (![manager fileExistsAtPath:filePath]) {
        // 文件不存在
        // 下载数据
        NSURL *url = [NSURL URLWithString:urlStr];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
        operation.inputStream = [NSInputStream inputStreamWithURL:url];
        operation.outputStream  = [NSOutputStream outputStreamToFileAtPath:filePath append:NO];
        
        // 成功
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            if (success) {
                NSData *data = [NSData dataWithContentsOfFile:filePath];
                NSJSONSerialization *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//                NSLog(@"%@", json);
                success(json);
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            if (failure) {
                failure(error);
            }
        }];
        
        [operation start];
    } else {
        // 文件存在
        if (success) {
            NSData *data = [NSData dataWithContentsOfFile:filePath];
            NSJSONSerialization *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//            NSLog(@"%@", json);
            success(json);
        }
    }

}


- (void)downloadFileURL:(NSString *)aUrl savePath:(NSString *)aSavePath fileName:(NSString *)aFileName tag:(NSInteger)aTag
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    //检查本地文件是否已存在
    NSString *fileName = [NSString stringWithFormat:@"%@/%@", aSavePath, aFileName];
    
    //检查附件是否存在
    if ([fileManager fileExistsAtPath:fileName]) {
        NSData *audioData = [NSData dataWithContentsOfFile:fileName];
    }else{
        //创建附件存储目录
        if (![fileManager fileExistsAtPath:aSavePath]) {
            [fileManager createDirectoryAtPath:aSavePath withIntermediateDirectories:YES attributes:nil error:nil];
        }
        
        //下载附件
        NSURL *url = [[NSURL alloc] initWithString:aUrl];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
        operation.inputStream   = [NSInputStream inputStreamWithURL:url];
        operation.outputStream  = [NSOutputStream outputStreamToFileAtPath:fileName append:NO];
        
        //下载进度控制
        /*
         [operation setDownloadProgressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead) {
         NSLog(@"is download：%f", (float)totalBytesRead/totalBytesExpectedToRead);
         }];
         */
        
        //已完成下载
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            NSData *audioData = [NSData dataWithContentsOfFile:fileName];
            //设置下载数据到res字典对象中并用代理返回下载数据NSData
//            [self requestFinished:[NSDictionary dictionaryWithObject:audioData forKey:@"res"] tag:aTag];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            //下载失败
//            [self requestFailed:aTag];
        }];
        
        [operation start];
    }
}


@end
