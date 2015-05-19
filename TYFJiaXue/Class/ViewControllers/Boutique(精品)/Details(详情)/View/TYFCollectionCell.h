//
//  TYFCollectionCell.h
//  TYFJiaXue
//
//  Created by 田雨飞 on 15/5/16.
//  Copyright (c) 2015年 TianYuFei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TYFCollectionModel;
@interface TYFCollectionCell : UICollectionViewCell
/**创建一个可重用的cell对象*/
+(id)cellWithConnectionView:(UICollectionView *)collectionView andIndexPath:(NSIndexPath *)indexPath;

@property(nonatomic,strong)TYFCollectionModel *collectionModel;
@end
