//
//  TYFSlideModel.h
//  TYFJiaXue
//
//  Created by 田雨飞 on 15/5/8.
//  Copyright (c) 2015年 TianYuFei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TYFSlideModel : NSObject
@property(nonatomic,copy)NSString *_id;
@property(nonatomic,assign)int aType;
@property(nonatomic,copy)NSString *advId;
@property(nonatomic,copy)NSString *bgUrl;
@property(nonatomic,assign)int enrollNum;
@property(nonatomic,copy)NSString *iconUrl;
@property(nonatomic,copy)NSString *imageUrl;
@property(nonatomic,assign)int listPrice;
@property(nonatomic,copy)NSString *providerName;
@property(nonatomic,assign)int rate;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,assign)int price;
@end
