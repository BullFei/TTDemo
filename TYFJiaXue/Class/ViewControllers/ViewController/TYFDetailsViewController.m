//
//  TYFDetailsViewController.m
//  TYFJiaXue
//
//  Created by 田雨飞 on 15/5/8.
//  Copyright (c) 2015年 TianYuFei. All rights reserved.
//

#import "TYFDetailsViewController.h"
#import "RequestTool.h"
#import "TYFBoutiqueCell.h"
#import "TYFBoutiqueModel.h"
#import "MJRefresh.h"
#import "TYFPushDeatailViewController.h"


@interface TYFDetailsViewController ()<UITableViewDataSource,UITableViewDelegate,MJRefreshBaseViewDelegate>
@property(nonatomic,strong)NSMutableArray *dataArray;

@property (nonatomic, weak) MJRefreshFooterView *footer;
@property (nonatomic, weak) MJRefreshHeaderView *header;

@end

@implementation TYFDetailsViewController
{
    UITableView *_tableView;
}
static int a=20;
static int b=0;
static int k=1;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=IWColor(244, 244, 244);
    [self createTableView];
    [self setupRefreshView];
    [self customItem];
}
-(void)customItem
{
    //设置镂空色
    self.navigationController.navigationBar.tintColor=IWColor(241, 67, 118);
    self.navigationController.navigationBar.translucent=NO;
    //设置titleView
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 44)];
    label.textAlignment=NSTextAlignmentCenter;
    label.text=self.titleName;
    label.textColor=IWColor(241, 67, 118);
    self.navigationItem.titleView=label;
    //设置右按钮
    UIBarButtonItem * searchItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchController)];
    self.navigationItem.rightBarButtonItem=searchItem;
    UIButton *leftButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 28, 24)];
    [leftButton setBackgroundImage:[[UIImage imageNamed:@"md_back_hui.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:leftButton];
    [leftButton addTarget:self action:@selector(backBtn) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)backBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)searchController
{
    NSLog(@"搜索");
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
    
    // 2.上拉刷新(上拉加载更多数据)
    MJRefreshFooterView *footer = [MJRefreshFooterView footer];
    footer.scrollView = _tableView;
    footer.delegate = self;
    self.footer = footer;
    //    footer.beginRefreshingBlock = ^(MJRefreshBaseView *refreshView){
    //        IWLog(@"refreshing.....");
    //    };
    
    
}
- (void)dealloc
{
    // 释放内存
    [self.header free];
    [self.footer free];
}
/**
 *  刷新控件进入开始刷新状态的时候调用
 */
- (void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView
{
    if ([refreshView isKindOfClass:[MJRefreshFooterView class]]) { // 上拉刷新
        a+=20;
        b+=20;
        [self loadData];
        // 让刷新控件停止显示刷新状态
        [self.footer endRefreshing];
    } else { // 下拉刷新
        k=1;
        [_dataArray removeAllObjects];
        [self loadData];
        [self.header endRefreshing];
    }
}

-(void)loadData
{
    if (_dataArray==nil) {
        _dataArray=[[NSMutableArray alloc]init];
    }
    NSString *strUrl=[NSString stringWithFormat:self.url,a,b];
    [RequestTool requestTitleWithURL:strUrl ListSuccess:^(id responseObject) {
        for (NSDictionary *dict in responseObject[@"courses"]) {
            TYFBoutiqueModel *boutiqueModel=[[TYFBoutiqueModel alloc]init];
            [boutiqueModel setValuesForKeysWithDictionary:dict];
            [_dataArray addObject:boutiqueModel];
        }
        [_tableView reloadData];
    } failure:^(NSError *error) {
        NSLog(@"%@",error.localizedDescription);
    }];
}
-(void)createTableView
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(10, 0, WIDTH-20, HEIGHT-64) style:UITableViewStyleGrouped];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    //去除阴影线
    _tableView.separatorStyle =UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor=[UIColor clearColor];
    [self.view addSubview:_tableView];
    
}
#pragma  mark -tableView协议方法实现
//组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataArray.count;
}
//每一组的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
//复用cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TYFBoutiqueCell *cell=[TYFBoutiqueCell cellWithTableView:tableView];
    cell.boutiqueModel=_dataArray[indexPath.section];
    return cell;
    
}
//设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TYFPushDeatailViewController *pushdvc=[[TYFPushDeatailViewController alloc]init];
    TYFBoutiqueModel *model=_dataArray[indexPath.section];
    pushdvc.titleName=model.title;
    pushdvc.imageViewURL=model.bgUrl;
    pushdvc.priceNum=model.price;
    pushdvc._id=model._id;
    [[TYFSingleObject shareObject].nav pushViewController:pushdvc animated:YES];
    //返回的时候被选中cell取消选中状态
    TYFBoutiqueCell *cell=(TYFBoutiqueCell *)[_tableView cellForRowAtIndexPath:indexPath];
    cell.selected=NO;
}


@end
