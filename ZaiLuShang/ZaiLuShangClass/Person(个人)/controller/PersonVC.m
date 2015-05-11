//
//  PersonVC.m
//  ChanYouJi
//
//  Created by gaocaixin on 15/5/7.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "PersonVC.h"

@interface PersonVC ()
@property (nonatomic ,weak) UITableView *tableView;
@end

@implementation PersonVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createTableView];
    
    [self createTitleView];
}

- (void)createTitleView
{

}
- (void)createTableView
{
    UITableView *table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:table];
    self.tableView = table;
    
    
}


@end
