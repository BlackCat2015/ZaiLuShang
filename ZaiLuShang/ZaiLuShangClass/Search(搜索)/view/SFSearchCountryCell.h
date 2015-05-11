//
//  SFSearchCountryCell.h
//  ZaiLuShang
//
//  Created by qianfeng on 15/5/11.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SFSearchDisplayModule;
@interface SFSearchCountryCell : UITableViewCell
@property (nonatomic,strong) SFSearchDisplayModule * displayModuleLeft;
@property (nonatomic,strong) SFSearchDisplayModule * displayModuleRight;
+(SFSearchCountryCell *)cellWithTableView:(UITableView *)tableView;
@end
