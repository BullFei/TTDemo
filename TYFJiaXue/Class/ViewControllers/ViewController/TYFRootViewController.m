//
//  TYFRootViewController.m
//  TYFJiaXue
//
//  Created by 田雨飞 on 15/5/7.
//  Copyright (c) 2015年 TianYuFei. All rights reserved.
//

#import "TYFRootViewController.h"
#import "MenuViewController.h"
#import "TYFClassifyViewController.h"
#import "TYFBoutiqueViewController.h"
#import "TYFRankingViewController.h"

@interface TYFRootViewController ()
@property(nonatomic,strong)MenuViewController *menuVC;
@end

@implementation TYFRootViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    [self customItem];
    [self createControllers];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [TYFSingleObject shareObject].nav = self.navigationController;
}

-(void)createControllers
{
    //分类
    TYFClassifyViewController *cvc=[[TYFClassifyViewController alloc]init];
    //精品
    TYFBoutiqueViewController *bvc=[[TYFBoutiqueViewController alloc]init];
    //排行
    TYFRankingViewController *rvc=[[TYFRankingViewController alloc]init];
    _menuVC = [[MenuViewController alloc] initViewControllerWithTitleArray:@[@"分类",@"精品",@"排行"] vcArray:@[cvc, bvc,rvc] Frame:0];

    _menuVC.view.frame = CGRectMake(0, 0, self.view.frame.size.width, [UIScreen mainScreen].bounds.size.height);
    [self.view addSubview:_menuVC.view];
}
-(void)customItem
{
    //设置镂空色
    self.navigationController.navigationBar.tintColor=IWColor(241, 67, 118);
    self.navigationController.navigationBar.translucent=NO;
    //设置titleView
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 44)];
    label.textAlignment=NSTextAlignmentCenter;
    label.text=@"发现课程";
    label.textColor=IWColor(241, 67, 118);
    self.navigationItem.titleView=label;
    //设置右按钮
    UIBarButtonItem * searchItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchController)];
    self.navigationItem.rightBarButtonItem=searchItem;
    UIButton *leftButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 18)];
    [leftButton setBackgroundImage:[[UIImage imageNamed:@"ic_drawer.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:leftButton];
    [leftButton addTarget:self action:@selector(backBtn) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)backBtn
{
    NSLog(@"登录");
}
//查找页面
-(void)searchController
{
    NSLog(@"推出查找页面");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
