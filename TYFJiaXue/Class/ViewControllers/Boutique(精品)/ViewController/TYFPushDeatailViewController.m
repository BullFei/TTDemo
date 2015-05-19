//
//  TYFPushDeatailViewController.m
//  TYFJiaXue
//
//  Created by 田雨飞 on 15/5/11.
//  Copyright (c) 2015年 TianYuFei. All rights reserved.
//

#import "TYFPushDeatailViewController.h"
#import "MenuViewController.h"
#import "TYFCatalogViewController.h"
#import "TYFEvaluateViewController.h"
#import "TYFPushDeatailsViewController.h"
#import "UIImageView+WebCache.h"

@interface TYFPushDeatailViewController ()
@property(nonatomic,strong)MenuViewController *menuVCX;
@end

@implementation TYFPushDeatailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self customItem];
    [self createControllers];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [TYFPushSingleObject shareObject].nav = self.navigationController;
}
//-(void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:animated];
//    self.navigationController.navigationBar.translucent=NO;
//    self.navigationController.navigationBar.alpha=1;
//}
-(void)customItem
{
    //设置镂空色
    self.navigationController.navigationBar.tintColor=IWColor(241, 67, 118);
//    self.navigationController.navigationBar.translucent=YES;
    //设置titleView
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 44)];
    label.textAlignment=NSTextAlignmentCenter;
    label.text=self.titleName;
    label.textColor=IWColor(241, 67, 118);
    self.navigationItem.titleView=label;
//    self.navigationController.navigationBar.backgroundColor=[UIColor clearColor];
//    self.navigationController.navigationBar.alpha=0.9;
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
    [self.navigationController popToRootViewControllerAnimated:YES];
}
//查找页面
-(void)searchController
{
    NSLog(@"推出查找页面");
}

-(void)createControllers
{
    //详情
    TYFPushDeatailsViewController *pdvc=[[TYFPushDeatailsViewController alloc]init];
    //详情URL
    NSString *detailsUrl=[NSString stringWithFormat:@"http://course.jaxus.cn/api/course/%@",self._id];
    pdvc.detailsUrl=detailsUrl;
    //目录
    TYFCatalogViewController *cvc=[[TYFCatalogViewController alloc]init];
    //目录URL
    NSString *catalogUrl=[NSString stringWithFormat:@"http://course.jaxus.cn/api/course/%@/sections",self._id];
    cvc.catalogUrl=catalogUrl;
    //评价
    TYFEvaluateViewController *evc=[[TYFEvaluateViewController alloc]init];
    //评价URL
    NSString *evaluateUrl=[NSString stringWithFormat:@"http://course.jaxus.cn/api/course/%@/comment?end=20&start=0",self._id];
    evc.evaluateUrl=evaluateUrl;
    
    
#pragma mark-创建详情、目录、评价页面
    _menuVCX=[[MenuViewController alloc]initViewControllerWithTitleArray:@[@"详情",@"目录",@"评价"] vcArray:@[pdvc,cvc,evc] Frame:0];
    [self.view addSubview:_menuVCX.view];
    //下方的参加课程按钮
    UIButton *joinButton=[[UIButton alloc]initWithFrame:CGRectMake(0, HEIGHT-102, WIDTH, 38)];
    [joinButton addTarget:self action:@selector(joinButtonClick) forControlEvents:UIControlEventTouchUpInside];
    joinButton.backgroundColor=IWColor(241, 67, 118);
    [self.view addSubview:joinButton];
    UILabel *joinLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 0, WIDTH*0.7, 38)];
    joinLabel.text=@"参加该课程";
    joinLabel.textColor=[UIColor whiteColor];
    joinLabel.font=[UIFont systemFontOfSize:16];
    [joinButton addSubview:joinLabel];
    UILabel *priceLabel=[[UILabel alloc]initWithFrame:CGRectMake(WIDTH*0.8, 0, WIDTH*0.2, 38)];
//    if (self.priceNum==0) {
       priceLabel.text=[NSString stringWithFormat:@"免费"];
//    }else{
//        int a=self.priceNum%100;
//        int b=self.priceNum/100;
//        priceLabel.text=[NSString stringWithFormat:@"￥ %d.%d",b,a];
//    }
    
    priceLabel.textColor=[UIColor whiteColor];
    [joinButton addSubview:priceLabel];
    
}
-(void)joinButtonClick
{
    UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"登录功能正在开发，敬请期待" message:@"点击继续" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alter show];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

@end
