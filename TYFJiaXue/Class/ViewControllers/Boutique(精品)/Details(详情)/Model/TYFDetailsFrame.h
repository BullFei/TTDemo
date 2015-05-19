//
//  TYFDetailsFrame.h
//  TYFJiaXue
//
//  Created by 田雨飞 on 15/5/14.
//  Copyright (c) 2015年 TianYuFei. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TYFDetailsModel;
@interface TYFDetailsFrame : NSObject
/**教学目标的Frame*/
 @property(nonatomic, assign, readonly)CGRect goalTitleF;
@property(nonatomic, assign, readonly)CGRect goalF;
/**目标听众的Frame*/
@property(nonatomic, assign, readonly)CGRect listenerTitleF;
@property(nonatomic, assign, readonly)CGRect listenerF;
/**概括的Frame*/
@property(nonatomic, assign, readonly)CGRect overviewTitleF;
@property(nonatomic, assign, readonly)CGRect overviewF;
/**标题的Frame*/

 @property(nonatomic, assign, readonly)CGRect titleF;
/**
 *  cell的高度
 */
@property (nonatomic, assign, readonly) CGFloat cellHeight;

/**
 *  数据模型
 */
@property (nonatomic, strong) TYFDetailsModel *detailsModel;
@end
