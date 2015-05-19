//
//  TYFEvaluateFrame.h
//  TYFJiaXue
//
//  Created by 田雨飞 on 15/5/14.
//  Copyright (c) 2015年 TianYuFei. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TYFEvaluateModel;
@interface TYFEvaluateFrame : NSObject
/**头像的Frame*/
@property (nonatomic, assign, readonly) CGRect iconF;
/**昵称的Frame*/
@property(nonatomic,assign,readonly)CGRect usernameF;
/**正文的Frame*/
@property (nonatomic, assign, readonly) CGRect contentF;
/**星级的Frame*/
@property(nonatomic,assign,readonly)CGRect starF;
/**时间的Frame*/
@property (nonatomic, assign, readonly) CGRect timeF;
/**
 *  cell的高度
 */
@property (nonatomic, assign, readonly) CGFloat cellHeight;
/**
 *  数据模型
 */
@property (nonatomic, strong) TYFEvaluateModel *evaluateModel;

@end
