//
//  TYFNewfeatureViewController.m
//  TYFWeiBo
//
//  Created by 田雨飞 on 15/4/8.
//  Copyright (c) 2015年 田雨飞. All rights reserved.
//

#import "TYFNewfeatureViewController.h"
#import "TYFRootViewController.h"
#define IWNewfeatureImageCount 3

@interface TYFNewfeatureViewController()<UIScrollViewDelegate>
@property(nonatomic,weak)UIPageControl *pageControl;
@end
@implementation TYFNewfeatureViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    //1.添加UISrollView
    [self setupScrollView];
    //2.添加pageControl
    [self setupPageControl];
}
/**
 *  添加pageControl
 */
-(void)setupPageControl
{
    //1.添加
    UIPageControl *pageControl=[[UIPageControl alloc]init];
    pageControl.numberOfPages=IWNewfeatureImageCount;
    CGFloat centerX=self.view.frame.size.width*0.5;
    CGFloat centerY=self.view.frame.size.height-30;
    pageControl.center=CGPointMake(centerX, centerY);
    pageControl.bounds=CGRectMake(0, 0, 100, 30);
    pageControl.userInteractionEnabled=NO;
    [self.view addSubview:pageControl];
    self.pageControl=pageControl;
    //设置原点颜色
    pageControl.currentPageIndicatorTintColor=IWColor(253, 98, 42);
    pageControl.pageIndicatorTintColor=IWColor(189, 189, 189);
    
}
/**
 *  添加UISrollView
 */
-(void)setupScrollView
{
    UIScrollView *scrollView=[[UIScrollView alloc]init];
    scrollView.frame=self.view.bounds;
    scrollView.delegate=self;
    [self.view addSubview:scrollView];
    
    //2.添加图片
    CGFloat imageW=scrollView.frame.size.width;
    CGFloat imageH=scrollView.frame.size.height;
    for (NSInteger index=0; index<IWNewfeatureImageCount; index++) {
        UIImageView *imageView=[[UIImageView alloc]init];
        //设置图片
        NSString *name=[NSString stringWithFormat:@"new"];
        imageView.image=[UIImage imageNamed:name];
        //设置frame
        CGFloat imageX=index*imageW;
        imageView.frame=CGRectMake(imageX, 0, imageW, imageH);
        [scrollView addSubview:imageView];
        UIImageView *imageHead=[[UIImageView alloc]initWithFrame:CGRectMake(imageX+(WIDTH-200)/2, HEIGHT*0.2, 200, 200)];
        imageHead.image=[UIImage imageNamed:[NSString stringWithFormat:@"guide_image%ld.png",(long)index+1]];
        [scrollView addSubview:imageHead];
        UIImageView *imageViewTitle=[[UIImageView alloc]initWithFrame:CGRectMake(imageX+(WIDTH-260)/2, CGRectGetMaxY(imageHead.frame)+10, 260,72)];
        imageViewTitle.image=[UIImage imageNamed:[NSString stringWithFormat:@"guide_title%ld.png",index+1]];
        [scrollView addSubview:imageViewTitle];
        imageViewTitle.userInteractionEnabled=YES;
        //在最后一个图片上面添加按钮
        if (index==IWNewfeatureImageCount-1) {
            [self setupLastImageView:imageView];
        }
    }
//    3.设置滚动内容的尺寸
    scrollView.contentSize=CGSizeMake(imageW*IWNewfeatureImageCount, 0);
    scrollView.showsHorizontalScrollIndicator=NO;
    scrollView.pagingEnabled=YES;
    scrollView.bounces=NO;
}

//将内容添加到最后一个图片
-(void)setupLastImageView:(UIImageView *)imageView
{
//    0.imageView默认是不可点击的 将其设置为能跟用户交互
    imageView.userInteractionEnabled=YES;
    //1.添加开始按钮
    UIButton *startButton=[[UIButton alloc]init];
    [startButton setBackgroundImage:[UIImage imageNamed:@"guide4_go_pressed.png"] forState:UIControlStateNormal];
    [startButton setBackgroundImage:[UIImage imageNamed:@"guide4_go.png"] forState:UIControlStateHighlighted];
    //2.设置frame
    CGFloat centerX=imageView.frame.size.width*0.5;
    CGFloat centerY=imageView.frame.size.height*0.75;
    startButton.center=CGPointMake(centerX, centerY);
    startButton.bounds=(CGRect){CGPointZero,startButton.currentBackgroundImage.size.width*0.3,startButton.currentBackgroundImage.size.height*0.3};
    [startButton addTarget:self action:@selector(startButton:) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:startButton];
}

-(void)startButton:(UIButton *)button
{
    //显示状态栏
    [UIApplication sharedApplication].statusBarHidden=NO;
    //切换窗口的根控制器
    TYFRootViewController *root=[[TYFRootViewController alloc]init];
    UINavigationController *nc=[[UINavigationController alloc]initWithRootViewController:root];
    self.view.window.rootViewController=nc;
}
#pragma mark -scroll代理方法
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    1.取出水平方向上滚动的距离
    CGFloat offsetX=scrollView.contentOffset.x;
    //2.求出页码
    double pageDouble=offsetX/scrollView.frame.size.width;
    int pageInt=(int)(pageDouble+0.5);
    self.pageControl.currentPage=pageInt;
}
@end











