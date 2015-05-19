//
//  TYFCollectionCell.m
//  TYFJiaXue
//
//  Created by 田雨飞 on 15/5/16.
//  Copyright (c) 2015年 TianYuFei. All rights reserved.
//

#import "TYFCollectionCell.h"
#import "TYFCollectionModel.h"
#import "UIImageView+WebCache.h"

@interface TYFCollectionCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
@implementation TYFCollectionCell
+(id)cellWithConnectionView:(UICollectionView *)collectionView andIndexPath:(NSIndexPath *)indexPath
{
    //1.注册
    UINib * nib = [UINib nibWithNibName:@"TYFCollectionCell" bundle:nil];
    [collectionView registerNib:nib forCellWithReuseIdentifier:@"collectionCell"];
    //2.获得cell对象
    TYFCollectionCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    cell.backgroundColor=IWColor(244, 244, 244);
    return cell;
    
}
-(void)setCollectionModel:(TYFCollectionModel *)collectionModel
{
    _collectionModel=collectionModel;
    self.imageView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"rc_ic_pic_normal.png"]];
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:[collectionModel.iconUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    self.titleLabel.text=collectionModel.title;
}
@end
