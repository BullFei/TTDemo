//
//  TYFClassifyViewController.m
//  TYFJiaXue
//
//  Created by 田雨飞 on 15/5/7.
//  Copyright (c) 2015年 TianYuFei. All rights reserved.
//

#import "TYFClassifyViewController.h"
#import "TYFDetailsViewController.h"
#import "RequestTool.h"
#import "TYFClassityModel.h"
#import "TYFClassityCell.h"
#import "MJRefresh.h"

@interface TYFClassifyViewController ()<UITableViewDataSource,UITableViewDelegate,MJRefreshBaseViewDelegate>
{
    UITableView *_tableView;
}
@property(nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic, weak) MJRefreshHeaderView *header;
@end

@implementation TYFClassifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=IWColor(244, 244, 244);
    // 0.集成刷新控件
    [self createTableView];
    [self setupRefreshView];
}

-(void)setupRefreshView
{
    // 1.下拉刷新
    MJRefreshHeaderView *header = [MJRefreshHeaderView header];
    header.scrollView = _tableView;
    header.delegate = self;
    // 自动进入刷新状态
    [header beginRefreshing];
    self.header = header;
}
- (void)dealloc
{
    // 释放内存
    [self.header free];
}
/**
 *  刷新控件进入开始刷新状态的时候调用
 */
- (void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView
{
    if ([refreshView isKindOfClass:[MJRefreshFooterView class]]) { // 上拉刷新
//        [self loadData];
        
    } else { // 下拉刷新
        [_dataArray removeAllObjects];
        [self loadData];
        // 让刷新控件停止显示刷新状态
        [self.header endRefreshing];
    }
}
-(void)loadData
{
    if (_dataArray==nil) {
        _dataArray=[[NSMutableArray alloc]init];
    }
    
    [RequestTool requestTitleWithURL:ClassitfyURL ListSuccess:^(id responseObject) {
        for (NSDictionary *dict in responseObject[@"subcategories"]){
            TYFClassityModel *classityModel=[[TYFClassityModel alloc]init];
            [classityModel setValuesForKeysWithDictionary:dict];
            [_dataArray addObject:classityModel];
        }
        [_tableView reloadData];
    } failure:^(NSError *error) {
        NSLog(@"%@",error.localizedDescription);
    }];

}
-(void)createTableView
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-64-38) style:UITableViewStylePlain];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    //去除阴影线
    _tableView.separatorStyle =UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor=[UIColor clearColor];
    [self.view addSubview:_tableView];
}
#pragma mark -tableView协议方法
//每一组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}
//复用cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TYFClassityCell *cell=[TYFClassityCell cellWithTableView:tableView];
    cell.classityModel=_dataArray[indexPath.row];
    return cell;
}
//设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TYFDetailsViewController *vc=[[TYFDetailsViewController alloc]init];
    TYFClassityModel *classityModel=_dataArray[indexPath.row];
    vc.url=[NSString stringWithFormat:@"%@%@%@",@"http://course.jaxus.cn/api/category/",classityModel._id,@"/courses?channel=appstore&end=%d&freeCourse=0&platform=2&start=%d"];
    vc.titleName=classityModel.name;
    [[TYFSingleObject shareObject].nav pushViewController:vc animated:YES];
    //返回的时候被选中cell取消选中状态
    TYFClassityCell *cell=(TYFClassityCell *)[_tableView cellForRowAtIndexPath:indexPath];
    cell.selected=NO;
}
@end
