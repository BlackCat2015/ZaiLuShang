//
//  PersonVC.m
//  ChanYouJi
//
//  Created by gaocaixin on 15/5/7.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "PersonVC.h"

@interface PersonVC ()

@end

@implementation PersonVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createTitleView];
}

- (void)createTitleView
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, HEIGHT_STA, CGW(self.view), HEIGHT_NAV)];
    view.backgroundColor = CXColorP(150, 150, 150, 0.2);
    view.userInteractionEnabled = YES;
    [self.view addSubview:view];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGW(self.view), CGH(view))];
    label.text = @"未登录";
    label.center = view.center;
    label.textColor = [UIColor whiteColor];
    [view addSubview:label];
}

@end
