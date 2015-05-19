//
//  ZPublic.h
//  beyou(self)
//
//  Created by qianfeng on 15-4-24.
//  Copyright (c) 2015年 Z. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZPublic : NSObject

+(NSTimeInterval)NowTo1970;



+(NSString *)getUserID;

+ (NSString *)getMd5_32Bit_String:(NSString *)srcString isUppercase:(BOOL)isUppercase;

+ (BOOL) validatePhoneNum: (NSString *) candidate;

+(void)pushLoginViewController: (void (^ )(void))block;

+(UIColor *)mainThemeColor;

@end
