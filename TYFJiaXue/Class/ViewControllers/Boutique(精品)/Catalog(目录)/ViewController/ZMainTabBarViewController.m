//
//  ZMainTabBarViewController.m
//  childVideo
//
//  Created by qianfeng on 15-5-6.
//  Copyright (c) 2015年 Z. All rights reserved.
//

#import "ZMainTabBarViewController.h"

@interface ZMainTabBarViewController ()

@end

@implementation ZMainTabBarViewController



+(instancetype)shareMainController;
{
    static ZMainTabBarViewController * mainTabBarController=nil;
    static dispatch_once_t tocken;
    dispatch_once(&tocken, ^{
        mainTabBarController=[[ZMainTabBarViewController alloc]init];
    });
    
    return mainTabBarController;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(BOOL)shouldAutorotate
{
    return NO;
}



@end
