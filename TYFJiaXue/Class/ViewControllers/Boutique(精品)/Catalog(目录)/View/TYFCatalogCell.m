//
//  TYFCatalogCell.m
//  TYFJiaXue
//
//  Created by 田雨飞 on 15/5/13.
//  Copyright (c) 2015年 TianYuFei. All rights reserved.
//

#import "TYFCatalogCell.h"
#import "TYFCatalogModel.h"
@interface TYFCatalogCell()

@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end

@implementation TYFCatalogCell
+(TYFCatalogCell *)cellWithTableView:(UITableView *)tableView withNum:(NSIndexPath *)index
{
    static NSString *ID=@"catalogcell";
    TYFCatalogCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"TYFCatalogCell" owner:nil options:nil]lastObject];
    }
    cell.numLabel.text=[NSString stringWithFormat:@"%ld",(long)index.row+1];
    return cell;
}
-(void)setCatalogModel:(TYFCatalogModel *)catalogModel
{
    self.titleNameLabel.text=catalogModel.title;
    int s=[catalogModel.length intValue]%60;
    int m=[catalogModel.length intValue]/60;
    self.timeLabel.text=[NSString stringWithFormat:@"%.2d:%.2d",m,s];
}
@end
