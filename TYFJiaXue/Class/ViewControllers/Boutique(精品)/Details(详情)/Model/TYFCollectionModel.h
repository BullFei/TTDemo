//
//  TYFCollectionModel.h
//  TYFJiaXue
//
//  Created by 田雨飞 on 15/5/16.
//  Copyright (c) 2015年 TianYuFei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TYFCollectionModel : NSObject
@property(nonatomic,copy)NSString *_id;
@property(nonatomic,copy)NSString *bgUrl;
@property(nonatomic,strong)NSNumber *enrollNum;
@property(nonatomic,copy)NSString *iconUrl;
@property(nonatomic,strong)NSNumber *listPrice;
@property(nonatomic,strong)NSNumber *price;
@property(nonatomic,copy)NSString *providerName;
@property(nonatomic,strong)NSNumber *rate;
@property(nonatomic,copy)NSString *title;

@end
