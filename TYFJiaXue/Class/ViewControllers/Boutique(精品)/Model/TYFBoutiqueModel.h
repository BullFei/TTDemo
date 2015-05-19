//
//  TYFBoutiqueModel.h
//  TYFJiaXue
//
//  Created by 田雨飞 on 15/5/7.
//  Copyright (c) 2015年 TianYuFei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TYFBoutiqueModel : NSObject
@property(nonatomic,copy)NSString *_id;
@property(nonatomic,copy)NSString *bgUrl;
@property(nonatomic,assign)int enrollNum;
@property(nonatomic,copy)NSString *iconUrl;
@property(nonatomic,assign)int price;
@property(nonatomic,copy)NSString *providerName;
@property(nonatomic,assign)CGFloat rate;
@property(nonatomic,copy)NSString *title;
@end
