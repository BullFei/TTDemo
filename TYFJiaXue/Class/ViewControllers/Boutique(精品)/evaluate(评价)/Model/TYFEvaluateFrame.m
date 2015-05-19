//
//  TYFEvaluateFrame.m
//  TYFJiaXue
//
//  Created by 田雨飞 on 15/5/14.
//  Copyright (c) 2015年 TianYuFei. All rights reserved.
//

#import "TYFEvaluateFrame.h"
#import "TYFEvaluateModel.h"
#import "NSString+Extension.h"


@implementation TYFEvaluateFrame

-(void)setEvaluateModel:(TYFEvaluateModel *)evaluateModel
{
    _evaluateModel=evaluateModel;
    // 间距
    CGFloat padding = 10;
    //屏幕的宽度
    CGFloat screenW=[UIScreen mainScreen].bounds.size.width;
    //头像
    CGFloat iconX=padding;
    CGFloat iconY=padding;
    CGFloat iconW=40;
    CGFloat iconH=40;
    _iconF=CGRectMake(iconX, iconY, iconW, iconH);
    
    //昵称
    CGFloat usernameX=CGRectGetMaxY(_iconF)+padding;
    CGFloat usernameY=iconY;
    //昵称的最大尺寸
    CGSize usernameMaxSize=CGSizeMake(screenW-usernameX-padding-65, 18);
    _usernameF=(CGRect){{usernameX, usernameY},usernameMaxSize};
    //星级
    CGFloat starX=screenW-padding-65;
    CGFloat starY=usernameY;
    CGFloat starW=65;
    CGFloat starH=23;
    _starF=CGRectMake(starX, starY, starW, starH);
    //正文
    CGFloat contentX=usernameX;
    CGFloat contentY=CGRectGetMaxY(_usernameF)+5;
    // 文字计算的最大尺寸
    CGSize contentMaxSize=CGSizeMake(screenW-contentX-padding, MAXFLOAT);
    // 文字计算出来的真实尺寸(按钮内部label的尺寸)
    CGSize contentRealSize = [evaluateModel.content sizeWithFont:MJTextFont maxSize:contentMaxSize];
    _contentF=(CGRect){{contentX, contentY},contentRealSize};
    //时间
    CGFloat timeX=contentX;
    CGFloat timeY=CGRectGetMaxY(_contentF)+5;
    CGSize timeMaxSize=CGSizeMake(screenW-timeX, 18);
    _timeF=(CGRect){{timeX, timeY},timeMaxSize};
    
    //cell的高度
    _cellHeight=MAX(CGRectGetMaxY(_contentF),CGRectGetMaxY(_timeF))+5;
    
    
}
@end
