//
//  TYFPushSingleObject.h
//  TYFJiaXue
//
//  Created by 田雨飞 on 15/5/11.
//  Copyright (c) 2015年 TianYuFei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TYFPushSingleObject : NSObject
+(TYFPushSingleObject *)shareObject;

@property(nonatomic, strong) UINavigationController *nav;
@end
