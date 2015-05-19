//
//  TYFSingleObject.m
//  TYFJiaXue
//
//  Created by 田雨飞 on 15/5/8.
//  Copyright (c) 2015年 TianYuFei. All rights reserved.
//

#import "TYFSingleObject.h"

@implementation TYFSingleObject
+(TYFSingleObject*)shareObject
{
    static  TYFSingleObject * sinObj;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sinObj = [[TYFSingleObject alloc] init];
    });
    return sinObj;
}


@end
