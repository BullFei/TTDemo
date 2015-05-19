//
//  TYFBoutiqueCell.m
//  TYFJiaXue
//
//  Created by 田雨飞 on 15/5/7.
//  Copyright (c) 2015年 TianYuFei. All rights reserved.
//

#import "TYFBoutiqueCell.h"
#import "UIImageView+WebCache.h"
#import "TYFBoutiqueModel.h"


@interface TYFBoutiqueCell()
@property (weak, nonatomic) IBOutlet UIImageView *picImageView;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *providerNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *enrollNum;
@property (weak, nonatomic) IBOutlet UIView *starView;

@end
@implementation TYFBoutiqueCell
{
    //背景视图
    UIImageView *_backgroudView;
    //前景视图
    UIImageView *_foregroundView;
}

+(TYFBoutiqueCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID=@"boutiqueCell";
    TYFBoutiqueCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"TYFBoutiqueCell" owner:nil options:nil]lastObject];
    }
    return cell;
}
-(void)setBoutiqueModel:(TYFBoutiqueModel *)boutiqueModel
{
    _boutiqueModel=boutiqueModel;
    self.picImageView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"rc_ic_pic_hover1.png"]];
    [self.picImageView sd_setImageWithURL:[NSURL URLWithString:[boutiqueModel.iconUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    
    if (boutiqueModel.price==0) {
        self.priceLabel.text=@"免费";
    }else{
        int a=boutiqueModel.price%100;
        int b=boutiqueModel.price/100;
        
        self.priceLabel.text=[NSString stringWithFormat:@"%d.%d",b,a];
    }
    [_backgroudView removeFromSuperview];
    [_foregroundView removeFromSuperview];
    self.providerNameLabel.text=boutiqueModel.providerName;
    self.titleLabel.text=boutiqueModel.title;
    self.titleLabel.numberOfLines=0;
    self.enrollNum.text=[NSString stringWithFormat:@"%d",boutiqueModel.enrollNum];
    [self createView];
    CGRect frame=_backgroudView.frame;
    frame.size.width=frame.size.width*boutiqueModel.rate/5.0f;
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
@end
