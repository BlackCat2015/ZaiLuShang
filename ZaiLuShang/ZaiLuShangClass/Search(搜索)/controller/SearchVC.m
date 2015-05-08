//
//  SearchVC.m
//  ChanYouJi
//
//  Created by gaocaixin on 15/5/7.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//bbtb

#import "SearchVC.h"
#import "RequestTool.h"
#import "SFSearchModel.h"
#import "SFLinkTitleList.h"
#import "SFTactick.h"
#import "SFTactickBanners.h"
#import "SFSearchDisplayModule.h"
#define  TITLE_TYPE 88 //标题
#define  TACTICK_TYPE 99 //攻略
#define  OTHER_TYPE 18 //其他
#define SEARCH_MAIN_URL @"http://app6.117go.com/demo27/php/interestAction.php?submit=getDiscoverHome&length=20&vc=anzhuo&vd=a1c9d9b8a69b4bf4&token=5aa634ad2fd021650587afa999fdd184&v=a6.1.0"
@interface SearchVC ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView * _tableView;
}
@property (nonatomic,strong)NSMutableArray * dataArray;
@end

@implementation SearchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTableView];
    [self loadData];
}
#pragma mark -创建tableview
-(void)createTableView
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-49) style:UITableViewStyleGrouped];
    [self.view addSubview:_tableView];
    _tableView.delegate =self;
    _tableView.dataSource = self;
}
#pragma mark -加载数据
-(void)loadData
{
    if (nil==_dataArray) {
        _dataArray = [[NSMutableArray alloc]init];
    }
    [RequestTool GET:SEARCH_MAIN_URL parameters:nil success:^(id responseObject) {
        NSArray * tempArray =responseObject[@"obj"][@"list"];
        for (NSDictionary * dic in tempArray) {
            SFSearchModel * searchModel = [[SFSearchModel alloc]init];
            [searchModel setValuesForKeysWithDictionary:dic];
            //list 数据
            NSArray * tempList = dic[@"list"];
            //临时数组
            NSMutableArray * mulList = [[NSMutableArray alloc]init];
            if (TITLE_TYPE ==[dic[@"type"] integerValue]) {
                //标题
                
                for (NSDictionary * listDic  in tempList) {
                    SFLinkTitleList * linkTitleList = [[SFLinkTitleList alloc]init];
                    [linkTitleList setValuesForKeysWithDictionary:listDic];
                    [mulList addObject:linkTitleList];
                }
                searchModel.listArray =mulList;
                
            }else if(TACTICK_TYPE ==[dic[@"type"] integerValue]){
                //攻略
                for (NSDictionary * listDic  in tempList) {
                    SFTactick * tractic = [[SFTactick alloc]init];
                    [tractic setValuesForKeysWithDictionary:listDic];
                    NSDictionary * tempBanners = listDic[@"banners"];
                    SFTactickBanners * banners = [[SFTactickBanners alloc]init];
                    [banners setValuesForKeysWithDictionary:tempBanners];
                    [mulList addObject:tractic];
                }
                searchModel.listArray =mulList;
            }else if(OTHER_TYPE ==[dic[@"type"] integerValue]){
                //其他
                for (NSDictionary * listDic  in tempList) {
                    SFSearchDisplayModule * sdm = [[SFSearchDisplayModule alloc]init];
                    [sdm setValuesForKeysWithDictionary:listDic];
                    [mulList addObject:listDic];
                }
                searchModel.listArray =mulList;
            }
            [_dataArray addObject:searchModel];
            [_tableView reloadData];
        }
    } failure:^(NSError *error) {
        NSLog(@"%@",error.localizedDescription);
    }];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

@end
