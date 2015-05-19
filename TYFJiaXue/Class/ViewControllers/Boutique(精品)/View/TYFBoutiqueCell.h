//
//  TYFBoutiqueCell.h
//  TYFJiaXue
//
//  Created by 田雨飞 on 15/5/7.
//  Copyright (c) 2015年 TianYuFei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TYFBoutiqueModel;
@interface TYFBoutiqueCell : UITableViewCell

//设置星级
+(TYFBoutiqueCell *)cellWithTableView:(UITableView *)tableView;
@property(nonatomic,strong)TYFBoutiqueModel *boutiqueModel;

@end
