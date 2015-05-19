//
//  TYFDetailsCell.m
//  TYFJiaXue
//
//  Created by 田雨飞 on 15/5/14.
//  Copyright (c) 2015年 TianYuFei. All rights reserved.
//

#import "TYFDetailsCell.h"
#import "TYFDetailsModel.h"
#import "TYFDetailsFrame.h"

@interface TYFDetailsCell()
/**教学目标*/
@property(nonatomic,weak)UILabel *goalTitleLabel;
@property(nonatomic,weak)UILabel *goalLabel;
/**目标听众*/
@property(nonatomic,weak)UILabel *listenerTitleLabel;
@property(nonatomic,weak)UILabel *listenerLabel;
/**概括的Frame*/
@property(nonatomic,weak)UILabel *overviewTitleLabel;
@property(nonatomic,weak)UILabel *overviewLabel;
/**标题的Frame*/

@property(nonatomic,weak)UILabel *titleLabel;

@end

@implementation TYFDetailsCell

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID=@"evaluate";
    TYFDetailsCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell=[[TYFDetailsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //子控件的创建和初始化
        /**标题的Frame*/
        UILabel *titleLabel=[[UILabel alloc]init];
        titleLabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:14];
        titleLabel.textColor=[UIColor blackColor];
        [self.contentView addSubview:titleLabel];
        self.titleLabel=titleLabel;
        /**教学目标*/
        UILabel *goalTitleLabel=[[UILabel alloc]init];
        goalTitleLabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:13];
        goalTitleLabel.textColor=[UIColor blackColor];
        [self.contentView addSubview:goalTitleLabel];
        self.goalTitleLabel=goalTitleLabel;
        UILabel *goalLabel=[[UILabel alloc]init];
        goalLabel.numberOfLines=0;
        goalLabel.font=MJTextFont;
        goalLabel.textColor=[UIColor grayColor];
        [self.contentView addSubview:goalLabel];
        self.goalLabel=goalLabel;
        
        /**目标听众*/
        UILabel *listenerTitleLabel=[[UILabel alloc]init];
        listenerTitleLabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:13];
        listenerTitleLabel.textColor=[UIColor blackColor];
        [self.contentView addSubview:listenerTitleLabel];
        self.listenerTitleLabel=listenerTitleLabel;
        UILabel *listenerLabel=[[UILabel alloc]init];
        listenerLabel.font=MJTextFont;
        listenerLabel.numberOfLines=0;
        listenerLabel.textColor=[UIColor grayColor];
        [self.contentView addSubview:listenerLabel];
        self.listenerLabel=listenerLabel;
        /**概括的Frame*/
        UILabel *overviewTitleLabel=[[UILabel alloc]init];
        overviewTitleLabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:13];
        overviewTitleLabel.textColor=[UIColor blackColor];
        [self.contentView addSubview:overviewTitleLabel];
        self.overviewTitleLabel=overviewTitleLabel;
        UILabel *overviewLabel=[[UILabel alloc]init];
        overviewLabel.font=MJTextFont;
        overviewLabel.numberOfLines=0;
        overviewLabel.textColor=[UIColor grayColor];
        [self.contentView addSubview:overviewLabel];
        self.overviewLabel=overviewLabel;
       
    }
    return self;
}
/**
 *  计算文字尺寸
 *
 *  @param text    需要计算尺寸的文字
 *  @param font    文字的字体
 *  @param maxSize 文字的最大尺寸
 */
- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}
-(void)setDetailsFrame:(TYFDetailsFrame *)detailsFrame
{
    _detailsFrame=detailsFrame;
    //1.设置数据
    [self settingData];
    //2.设置frame
    [self settingFrame];
}
-(void)settingData
{
    TYFDetailsModel *detailsModel=self.detailsFrame.detailsModel;
    /**标题的Frame*/
    self.titleLabel.text=detailsModel.title;
    /**教学目标*/
    self.goalTitleLabel.text=@"教学目标:";
    self.goalLabel.text=detailsModel.goal;
    /**目标听众*/
    self.listenerTitleLabel.text=@"目标听众:";
    self.listenerLabel.text=detailsModel.listener;
    /**概括的Frame*/
    self.overviewTitleLabel.text=@"概括:";
    self.overviewLabel.text=detailsModel.overview;
    
}
-(void)settingFrame
{
    /**标题的Frame*/
    self.titleLabel.frame=self.detailsFrame.titleF;
    /**教学目标*/
    self.goalTitleLabel.frame=self.detailsFrame.goalTitleF;
    self.goalLabel.frame=self.detailsFrame.goalF;
    /**目标听众*/
    self.listenerTitleLabel.frame=self.detailsFrame.listenerTitleF;
    self.listenerLabel.frame=self.detailsFrame.listenerF;
    /**概括的Frame*/
    self.overviewTitleLabel.frame=self.detailsFrame.overviewTitleF;
    self.overviewLabel.frame=self.detailsFrame.overviewF;
}
@end
