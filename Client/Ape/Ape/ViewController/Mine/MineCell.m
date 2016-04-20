//
//  MineCell.m
//  Ape
//
//  Created by Geminy on 16/3/31.
//  Copyright © 2016年 Geminy. All rights reserved.
//

#import "MineCell.h"

@interface MineCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgV;
@property (weak, nonatomic) IBOutlet UILabel *titleLb;

@end

@implementation MineCell

- (void)setImgName:(NSString *)imgName
{
    _imgName = imgName;
    _imgV.image = [UIImage imageNamed:imgName];
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    _titleLb.text = title;
}

- (void)showIndicator
{
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

@end

