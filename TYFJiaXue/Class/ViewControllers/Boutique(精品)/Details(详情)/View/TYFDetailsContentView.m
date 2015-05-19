//
//  TYFDetailsContentView.m
//  TYFJiaXue
//
//  Created by 田雨飞 on 15/5/16.
//  Copyright (c) 2015年 TianYuFei. All rights reserved.
//

#import "TYFDetailsContentView.h"
#import "TYFCollectionCell.h"
#import "RequestTool.h"
#import "TYFCollectionModel.h"
#import "TYFPushDeatailViewController.h"
#import "UIImageView+WebCache.h"

@interface TYFDetailsContentView()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic,weak)UICollectionView * collectionView ;
@property(nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation TYFDetailsContentView
+(id)contentView
{
    return [[self alloc] initWithFrame:CGRectZero];
}

-(id)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        //创建子控件
        
        //创建布局对象
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
        //设置滚动方向
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        UICollectionView * collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        
        
        [self addSubview:collectionView];
        collectionView.dataSource = self;
        collectionView.delegate  = self;
        
        collectionView.pagingEnabled = YES;
        
        self.collectionView = collectionView;
        self.collectionView.backgroundColor=IWColor(244, 244, 244);
    }
    return self;
}
- (void)willMoveToSuperview:(UIView *)newSuperview
{
    self.frame = newSuperview.bounds;
    self.collectionView.frame = CGRectMake(0, 0, self.frame.size.width, 100);
    [self loadData];
}
-(void)loadData
{
    if (_dataArray==nil) {
        _dataArray=[[NSMutableArray alloc]init];
    }
    [RequestTool requestTitleWithURL:self.collectionUrl ListSuccess:^(id responseObject) {
        for (NSDictionary *dict in responseObject[@"relativeCourses"]) {
            TYFCollectionModel *collectionModel=[[TYFCollectionModel alloc]init];
            [collectionModel setValuesForKeysWithDictionary:dict];
            [_dataArray addObject:collectionModel];
        }
        [_collectionView reloadData];
    } failure:^(NSError *error) {
         NSLog(@"%@",error.localizedDescription);
    }];
}
#pragma mark 数据源方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    TYFCollectionCell * cell = [TYFCollectionCell cellWithConnectionView:collectionView andIndexPath:indexPath];
    //给cell传递模型
    cell.collectionModel=_dataArray[indexPath.row];
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
   return CGSizeMake(120, 100);
}
//设置水平滑动cell间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    TYFPushDeatailViewController *pushDvc=[[TYFPushDeatailViewController alloc]init];
    TYFCollectionModel *collectionModel=_dataArray[indexPath.row];
    pushDvc.titleName=collectionModel.title;
    pushDvc.imageViewURL=collectionModel.bgUrl;
    pushDvc.priceNum=[collectionModel.price intValue];
    pushDvc._id=collectionModel._id;
    [[TYFPushSingleObject shareObject].nav pushViewController:pushDvc animated:YES];
    [_delegate contentView:self andItemIndex:indexPath.item andModel:nil];
}
@end
