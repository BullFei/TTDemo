//
//  TYFPushSingleObject.m
//  TYFJiaXue
//
//  Created by 田雨飞 on 15/5/11.
//  Copyright (c) 2015年 TianYuFei. All rights reserved.
//

#import "TYFPushSingleObject.h"

@implementation TYFPushSingleObject
+(TYFPushSingleObject *)shareObject
{
    static TYFPushSingleObject *sinObj;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        sinObj=[[TYFPushSingleObject alloc]init];
    });
    return sinObj;
}
@end
