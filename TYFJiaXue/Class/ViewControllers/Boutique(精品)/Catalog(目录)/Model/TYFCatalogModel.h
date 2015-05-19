//
//  TYFCatalogModel.h
//  TYFJiaXue
//
//  Created by 田雨飞 on 15/5/13.
//  Copyright (c) 2015年 TianYuFei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TYFCatalogModel : NSObject
@property(nonatomic,copy)NSString *_id;
@property(nonatomic,copy)NSString *length;
@property(nonatomic,assign)int listPrice;
@property(nonatomic,strong)NSNumber *preview;
@property(nonatomic,assign)int price;
@property(nonatomic,copy)NSString *rType;
@property(nonatomic,copy)NSString *size;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *videoId;
@property(nonatomic,copy)NSString *videoMd5;
@end
