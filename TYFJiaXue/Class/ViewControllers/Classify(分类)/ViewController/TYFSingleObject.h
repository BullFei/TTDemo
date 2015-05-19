//
//  TYFSingleObject.h
//  TYFJiaXue
//
//  Created by 田雨飞 on 15/5/8.
//  Copyright (c) 2015年 TianYuFei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TYFSingleObject : NSObject
+(TYFSingleObject*)shareObject;

@property(nonatomic, strong) UINavigationController *nav;
@end
