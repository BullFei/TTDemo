//
//  TYFDetailsCell.h
//  TYFJiaXue
//
//  Created by 田雨飞 on 15/5/14.
//  Copyright (c) 2015年 TianYuFei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TYFDetailsFrame;
@interface TYFDetailsCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property(nonatomic,strong)TYFDetailsFrame *detailsFrame;
@end
