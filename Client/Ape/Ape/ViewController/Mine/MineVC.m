//
//  MineVC.m
//  Ape
//
//  Created by Geminy on 16/3/31.
//  Copyright © 2016年 Geminy. All rights reserved.
//

#import "MineVC.h"
#import <LazyTableView.h>
#import "MineCell.h"
#import "UIViewController+Category.h"
#import "FavoritesVC.h"
#import "UIView+Category.h"
#import "UIColor+Category.h"
#import "Reactivecocoa.h"
#import "Masonry.h"

#define cell_h 50

@interface MineVC ()<LazyTableViewDelegate>
@property (weak, nonatomic) IBOutlet LazyTableView *tableView;
@end

@implementation MineVC

#pragma mark - life
- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUpTableview];
}

- (void)setUpTableview
{
    [_tableView setDelegateAndDataSource:self];

    UIView *tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.width *0.4)];
    _tableView.tableHeaderView = tableHeaderView;

    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [tableHeaderView addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(tableHeaderView);
    }];
    [loginBtn setTitle:@"点击登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor hexStringToColor:@"333333"] forState:UIControlStateNormal];
    [[loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        [self presentViewController:@"LoginVC" Param:nil];
    }];

    [_tableView registarCell:NSStringFromClass([MineCell class]) StrItem:nil];
    [_tableView addStaticCell:cell_h CellBlock:^(id cell) {
        MineCell *mineCell = cell;
        mineCell.imgName = @"info";
        mineCell.title = @"收藏";
        [mineCell showIndicator];
    } ClickBlock:^(id cell) {
        [self pushViewController:@"Favorites" Param:nil];
    }];

    [_tableView addStaticCell:cell_h CellBlock:^(id cell) {
        MineCell *mineCell = cell;
        mineCell.imgName = @"info";
        mineCell.title = @"消息";
        [mineCell showIndicator];
    } ClickBlock:^(id cell) {
        [self pushViewController:@"Favorites" Param:nil];
    }];

    [_tableView addStaticCell:cell_h CellBlock:^(id cell) {
        MineCell *mineCell = cell;
        mineCell.imgName = @"info";
        mineCell.title = @"私信";
        [mineCell showIndicator];
    } ClickBlock:^(id cell) {
        [self pushViewController:@"Favorites" Param:nil];
    }];

    [_tableView addStaticCell:cell_h CellBlock:^(id cell) {
        MineCell *mineCell = cell;
        mineCell.imgName = @"info";
        mineCell.title = @"足迹";
        [mineCell showIndicator];
    } ClickBlock:^(id cell) {
        [self pushViewController:@"Favorites" Param:nil];
    }];

    [_tableView addStaticCell:cell_h CellBlock:^(id cell) {
        MineCell *mineCell = cell;
        mineCell.imgName = @"info";
        mineCell.title = @"修改资料";
        [mineCell showIndicator];
    } ClickBlock:^(id cell) {
        [self pushViewController:@"Favorites" Param:nil];
    }];

    [_tableView addStaticCell:cell_h CellBlock:^(id cell) {
        MineCell *mineCell = cell;
        mineCell.imgName = @"info";
        mineCell.title = @"切换用户";
        [mineCell showIndicator];
    } ClickBlock:^(id cell) {
        [self pushViewController:@"Favorites" Param:nil];
    }];

    [_tableView reloadStatic];
}

@end
