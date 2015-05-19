//
//  TYFEvaluateCell.m
//  TYFJiaXue
//
//  Created by 田雨飞 on 15/5/14.
//  Copyright (c) 2015年 TianYuFei. All rights reserved.
//

#import "TYFEvaluateCell.h"
#import "TYFEvaluateModel.h"
#import "TYFEvaluateFrame.h"
#import "UIImage+Extension.h"
#import "UIImageView+WebCache.h"

@interface TYFEvaluateCell()
/**头像*/
@property(nonatomic,weak)UIImageView *iconView;
/**昵称*/
@property(nonatomic,weak)UILabel *usernameLabel;
/**正文*/
@property(nonatomic,weak)UILabel *contentLabel;
/**星级*/
@property(nonatomic,weak)UIView *starView;
/**时间*/
@property(nonatomic,weak)UILabel *timeLabel;
@end
@implementation TYFEvaluateCell
{
    //背景视图
    UIImageView *_backgroudView;
    //前景视图
    UIImageView *_foregroundView;
}
+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID=@"evaluate";
    TYFEvaluateCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell=[[TYFEvaluateCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //子控件的创建和初始化
        /**头像*/
        UIImageView *iconView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 40, 40)];
        iconView.layer.cornerRadius=iconView.frame.size.width/2;
        iconView.layer.masksToBounds=YES;
        iconView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"default_avatar22.png"]];
        [self.contentView addSubview:iconView];
        self.iconView=iconView;
        /**昵称*/
        UILabel *usernameLabel=[[UILabel alloc]init];
        usernameLabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:14];
        usernameLabel.textColor=[UIColor blackColor];
        [self.contentView addSubview:usernameLabel];
        self.usernameLabel=usernameLabel;
        /**正文*/
        UILabel *contentLabel=[[UILabel alloc]init];
        contentLabel.font=MJTextFont;
        contentLabel.numberOfLines=0;
        contentLabel.textColor=[UIColor blackColor];
        [self.contentView addSubview:contentLabel];
        self.contentLabel=contentLabel;
        /**星级*/
        UIView *starView=[[UIView alloc]init];
        starView.backgroundColor=[UIColor redColor];
        [self.contentView addSubview:starView];
        self.starView=starView;
        /**时间*/
        UILabel *timeLabel=[[UILabel alloc]init];
        timeLabel.font=[UIFont systemFontOfSize:11];
        timeLabel.textColor=[UIColor grayColor];
        [self.contentView addSubview:timeLabel];
        self.timeLabel=timeLabel;
    }
    return self;
}

-(void)setEvaluateFrame:(TYFEvaluateFrame *)evaluateFrame
{
    _evaluateFrame=evaluateFrame;
    [_backgroudView removeFromSuperview];
    [_foregroundView removeFromSuperview];
    //1.设置数据
    [self settingData];
    //2.设置frame
    [self settingFrame];
    [self createView];
    CGRect frame=_backgroudView.frame;
    frame.size.width=frame.size.width*evaluateFrame.evaluateModel.rate/5.0f;
    _foregroundView.frame=frame;
}
-(void)createView
{
    _backgroudView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 65, 23)];
    _backgroudView.contentMode=UIViewContentModeLeft;
    _backgroudView.image=[UIImage imageNamed:@"StarsBackground"];
    _foregroundView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 65, 23)];
    _foregroundView.contentMode=UIViewContentModeLeft;
    _foregroundView.image=[UIImage imageNamed:@"StarsForeground"];
    //裁剪属性为YES
    _foregroundView.clipsToBounds=YES;
    [self.starView addSubview:_backgroudView];
    [self.starView addSubview:_foregroundView];
    //当前视图设置透明色
    self.starView.backgroundColor=[UIColor whiteColor];
}
-(void)setStar:(CGFloat)star
{
    CGRect frame=_backgroudView.frame;
    frame.size.width=frame.size.width*star/5.0f;
    _foregroundView.frame=frame;
}
-(void)settingData
{
    TYFEvaluateModel *evaluateModel=self.evaluateFrame.evaluateModel;
    /**头像*/
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:[evaluateModel.avatarUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];

    /**昵称*/
    self.usernameLabel.text=evaluateModel.username;
    /**正文*/
    self.contentLabel.text=evaluateModel.content;
    /**时间*/
    self.timeLabel.text=[NSString stringWithFormat:@"%lld",[evaluateModel.time longLongValue]];
    NSTimeInterval time=[evaluateModel.time longLongValue];
    NSDateFormatter *df=[[NSDateFormatter alloc]init];
    [df setDateFormat:@"yyyy-MM-dd"];
    NSDate *date=[NSDate dateWithTimeIntervalSince1970:time/1000];
    NSString *created=[df stringFromDate:date];
    self.timeLabel.text=[NSString stringWithFormat:@"%@",created];
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
-(void)settingFrame
{
    //头像
    self.iconView.frame=self.evaluateFrame.iconF;
    //昵称
    self.usernameLabel.frame=self.evaluateFrame.usernameF;
    //正文
    self.contentLabel.frame=self.evaluateFrame.contentF;
    //时间
    self.timeLabel.frame=self.evaluateFrame.timeF;
    /**星级*/
    self.starView.frame=self.evaluateFrame.starF;
}


@end
