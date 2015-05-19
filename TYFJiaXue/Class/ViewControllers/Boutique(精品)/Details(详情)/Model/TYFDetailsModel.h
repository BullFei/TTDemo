//
//  TYFDetailsModel.h
//  TYFJiaXue
//
//  Created by 田雨飞 on 15/5/14.
//  Copyright (c) 2015年 TianYuFei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TYFDetailsModel : NSObject
@property(nonatomic,copy)NSString *_id;
@property(nonatomic,copy)NSString *bgUrl;
@property(nonatomic,strong)NSNumber *enrollNum;
@property(nonatomic,copy)NSString *iconUrl;
//@property(nonatomic,copy)NSString *isBusiness;
@property(nonatomic,strong)NSNumber *length;
@property(nonatomic,strong)NSNumber *rate;
@property(nonatomic,strong)NSNumber *price;
@property(nonatomic,strong)NSNumber *size;
@property(nonatomic,strong)NSNumber *stat;

/**教学目标*/
@property(nonatomic,copy)NSString *goal;
/**目标听众*/
@property(nonatomic,copy)NSString *listener;
/**概括*/
@property(nonatomic,copy)NSString *overview;
/**标题*/
@property(nonatomic,copy)NSString *title;


@property(nonatomic,strong)NSNumber *totalLectures;
@end
