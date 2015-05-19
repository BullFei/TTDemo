//
//  ZPublic.m
//  beyou(self)
//
//  Created by qianfeng on 15-4-24.
//  Copyright (c) 2015年 Z. All rights reserved.
//

#import "ZPublic.h"
#import <CommonCrypto/CommonDigest.h>
@implementation ZPublic

+(UIColor *)mainThemeColor;
{
    return [UIColor colorWithRed:0xcc/256.0 green:1 blue:1 alpha:1];

}


+ (BOOL) validatePhoneNum: (NSString *) candidate
{
    NSString *numRegex = @"[0-9]{11}";
    NSPredicate *numTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numRegex];
    return [numTest evaluateWithObject:candidate]&&[candidate hasPrefix:@"1"];
}


+ (NSString *)getMd5_32Bit_String:(NSString *)srcString isUppercase:(BOOL)isUppercase{
    const char *cStr = [srcString UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (int)strlen(cStr), digest );
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [result appendFormat:@"%02x", digest[i]];
    
    if (isUppercase) {
        return   [result uppercaseString];
    }else{
        return result;
    }
    
}


+(NSTimeInterval)NowTo1970;
{
    NSDate * date=[NSDate date];
    
    NSTimeInterval f=[date timeIntervalSince1970];
    return f;
}




+(NSString *)getUserID;
{
    NSUserDefaults * info=[NSUserDefaults standardUserDefaults];
    NSString * uid;
    if ([info objectForKey:@"uid"]) {
        uid=[info objectForKey:@"uid"];
    }else{
        uid=@"0";
    }
    return uid;
}

+(void)pushLoginViewController: (void (^ )(void))block
{
  
}
@end
