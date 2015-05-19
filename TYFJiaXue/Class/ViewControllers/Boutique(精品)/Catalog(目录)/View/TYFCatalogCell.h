//
//  TYFCatalogCell.h
//  TYFJiaXue
//
//  Created by 田雨飞 on 15/5/13.
//  Copyright (c) 2015年 TianYuFei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TYFCatalogModel;
@interface TYFCatalogCell : UITableViewCell
+(TYFCatalogCell *)cellWithTableView:(UITableView *)tableView withNum:(NSIndexPath *)index;
@property(nonatomic,strong)TYFCatalogModel *catalogModel;
@property(nonatomic,strong)NSIndexPath *indexPath;
@end
