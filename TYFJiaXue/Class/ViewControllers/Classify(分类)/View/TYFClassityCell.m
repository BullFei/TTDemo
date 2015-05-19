//
//  TYFClassityCell.m
//  TYFJiaXue
//
//  Created by 田雨飞 on 15/5/7.
//  Copyright (c) 2015年 TianYuFei. All rights reserved.
//

#import "TYFClassityCell.h"
#import "UIImageView+WebCache.h"
#import "TYFClassityModel.h"
@interface TYFClassityCell()

@property (weak, nonatomic) IBOutlet UIImageView *picImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end

@implementation TYFClassityCell


+(TYFClassityCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID=@"classityCell";
    TYFClassityCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"TYFClassityCell" owner:nil options:nil]lastObject];
    }
    return cell;
}
-(void)setClassityModel:(TYFClassityModel *)classityModel
{
    _classityModel=classityModel;
    [self.picImageView sd_setImageWithURL:[NSURL URLWithString:classityModel.iconUrl]];
    self.titleLabel.text=classityModel.name;
}

@end
