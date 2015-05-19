//
//  TYFEvaluateModel.h
//  TYFJiaXue
//
//  Created by 田雨飞 on 15/5/14.
//  Copyright (c) 2015年 TianYuFei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TYFEvaluateModel : NSObject


@property(nonatomic,copy)NSString *_id;
@property(nonatomic,copy)NSString *avatarUrl;
@property(nonatomic,assign)CGFloat rate;
@property(nonatomic,copy)NSString *userId;


/**昵称*/
@property(nonatomic,copy)NSString *username;
/**正文*/
@property(nonatomic,copy)NSString *content;
/**时间*/
@property(nonatomic,strong)NSNumber *time;
@end
