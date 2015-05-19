//
//  TYFEvaluateViewController.m
//  TYFJiaXue
//
//  Created by 田雨飞 on 15/5/11.
//  Copyright (c) 2015年 TianYuFei. All rights reserved.
//

#import "TYFEvaluateViewController.h"
#import "TYFEvaluateFrame.h"
#import "TYFEvaluateModel.h"
#import "TYFEvaluateCell.h"
#import "RequestTool.h"
#import "MJRefresh.h"

@interface TYFEvaluateViewController ()<UITableViewDataSource,UITableViewDelegate,MJRefreshBaseViewDelegate>
@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)NSNumber* commentNum;
@property (nonatomic, weak) MJRefreshHeaderView *header;

@end

@implementation TYFEvaluateViewController
{
    UITableView *_tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=IWColor(244, 244, 244);
    [self createView];
    [self setupRefreshView];
//    [self loadData];
    
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
    // 下拉刷新
    [_dataArray removeAllObjects];
    [self loadData];
    [self.header endRefreshing];
}
-(void)loadData
{
    [RequestTool requestTitleWithURL:self.evaluateUrl ListSuccess:^(id responseObject) {
        
        self.commentNum=responseObject[@"commentNum"];
//        NSLog(@"%@",responseObject[@"commentNum"]);
        for (NSDictionary *dict in responseObject[@"comments"]) {
            TYFEvaluateModel *evaluateModel=[[TYFEvaluateModel alloc]init];
            [evaluateModel setValuesForKeysWithDictionary:dict];
            //frame模型
            TYFEvaluateFrame *evaluateFrame=[[TYFEvaluateFrame alloc]init];
            evaluateFrame.evaluateModel=evaluateModel;
            [_dataArray addObject:evaluateFrame];
        }
        [_tableView reloadData];
        [self coutomsTabelViewHeader];
    } failure:^(NSError *error) {
         NSLog(@"%@",error.localizedDescription);
    }];
}
-(void)createView
{
    if (_dataArray==nil) {
        _dataArray=[[NSMutableArray alloc]init];
    }
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-64-38-38) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    // //去除阴影线
//    _tableView.separatorStyle =UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor=[UIColor clearColor];
    [self.view addSubview:_tableView];
}
-(void)coutomsTabelViewHeader
{
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 33)];
    _tableView.tableHeaderView=view;
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(15, 9, 65, 23)];
    [imageView setImage:[UIImage imageNamed:@"StarsForeground"]];
    [view addSubview:imageView];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(imageView.frame)+3,5, 50, 23)];
    label.textColor=[UIColor grayColor];
    label.font=[UIFont systemFontOfSize:13];
    label.text=[NSString stringWithFormat:@"(%d)",[self.commentNum intValue]];
    [view addSubview:label];
    UILabel *evaluationLabel=[[UILabel alloc]initWithFrame:CGRectMake(WIDTH-100, 5, 100, 23)];
    evaluationLabel.textColor=[UIColor grayColor];
    evaluationLabel.font=[UIFont systemFontOfSize:13];
    evaluationLabel.text=@"参与后可评价";
    [view addSubview:evaluationLabel];
    
}
#pragma mark-协议方法
//行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}
//复用cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //创建cell
    TYFEvaluateCell *cell=[TYFEvaluateCell cellWithTableView:tableView];
//    //给cell传递模型
    cell.evaluateFrame=_dataArray[indexPath.row];
//    //返回cell
    return cell;
}

//返回cell高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TYFEvaluateFrame *evaluateFrame=_dataArray[indexPath.row];
    return evaluateFrame.cellHeight;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
        //返回的时候被选中cell取消选中状态
    TYFEvaluateCell *cell=(TYFEvaluateCell *)[_tableView cellForRowAtIndexPath:indexPath];
    cell.selected=NO;
}

@end
