//
//  TYFClassityCell.h
//  TYFJiaXue
//
//  Created by 田雨飞 on 15/5/7.
//  Copyright (c) 2015年 TianYuFei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TYFClassityModel;
@interface TYFClassityCell : UITableViewCell

+(TYFClassityCell *)cellWithTableView:(UITableView *)tableView;
@property(nonatomic,strong)TYFClassityModel *classityModel;

@end
