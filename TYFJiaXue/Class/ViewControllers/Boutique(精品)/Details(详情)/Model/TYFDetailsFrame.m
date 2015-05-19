//
//  TYFDetailsFrame.m
//  TYFJiaXue
//
//  Created by 田雨飞 on 15/5/14.
//  Copyright (c) 2015年 TianYuFei. All rights reserved.
//

#import "TYFDetailsFrame.h"
#import "TYFDetailsModel.h"
#import "NSString+Extension.h"

@implementation TYFDetailsFrame

-(void)setDetailsModel:(TYFDetailsModel *)detailsModel
{
    _detailsModel=detailsModel;
    //间距
    CGFloat padding=10;
//    标题
    CGFloat titleX=padding;
    CGFloat titleY=padding;
    CGFloat titleW=WIDTH-padding;
    CGFloat titleH=40;
    _titleF=CGRectMake(titleX, titleY, titleW, titleH);
    //概括的最大尺寸
    CGFloat overviewX=padding;
    CGFloat overviewY=CGRectGetMaxY(_titleF)+padding;
    CGFloat overviewW=WIDTH-padding*3;
    //概括的最大尺寸
    CGSize overviewMaxSize=CGSizeMake(overviewW,MAXFLOAT);
    // 文字计算出来的真实尺寸(按钮内部label的尺寸)
    CGSize overviewRealSize = [detailsModel.overview sizeWithFont:MJTextFont maxSize:overviewMaxSize];
    _overviewTitleF=CGRectMake(overviewX, overviewY, overviewW,30);
    _overviewF=(CGRect){{overviewX,CGRectGetMaxY(_overviewTitleF)},overviewRealSize};
    //教学目标
    CGFloat goalX=padding;
    CGFloat goalY=CGRectGetMaxY(_overviewF)+padding;
    CGFloat goalW=WIDTH-padding*3;
    //教学目标的最 大尺寸
    CGSize goalMaxSize=CGSizeMake(goalW,MAXFLOAT);
    // 文字计算出来的真实尺寸(按钮内部label的尺寸)
    CGSize goalviewRealSize = [detailsModel.goal sizeWithFont:MJTextFont maxSize:goalMaxSize];
    _overviewTitleF=CGRectMake(overviewX, overviewY, overviewW,30);
    _goalTitleF=CGRectMake(goalX, goalY, goalW, 30);
     _goalF=(CGRect){{goalX,CGRectGetMaxY(_goalTitleF)},goalviewRealSize};
    
    //目标听众
    CGFloat listenerX=padding;
    CGFloat listenerY=CGRectGetMaxY(_goalF)+padding;
    CGFloat listenerW=320-padding*3;
    //教学目标的最大尺寸
    CGSize listenerMaxSize=CGSizeMake(listenerW,MAXFLOAT);
    // 文字计算出来的真实尺寸(按钮内部label的尺寸)
    CGSize listenerRealSize = [detailsModel.listener sizeWithFont:MJTextFont maxSize:listenerMaxSize];
    _listenerTitleF=CGRectMake(listenerX, listenerY, listenerW, 30);
    _listenerF=(CGRect){{listenerX,CGRectGetMaxY(_listenerTitleF)},listenerRealSize};

//    cell的高度
    _cellHeight=MAX(CGRectGetMaxY(_goalF),CGRectGetMaxY(_listenerF))+5;
    
}

@end
