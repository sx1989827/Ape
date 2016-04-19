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

//    UIView *tableHeaderView = [UIView alloc] initWithFrame:
//    _tableView.tableHeaderView = tableHeaderView;

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
