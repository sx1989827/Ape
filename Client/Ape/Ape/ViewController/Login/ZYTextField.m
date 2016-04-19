//
//  ZYTextField.m
//  Ape
//
//  Created by Geminy on 16/3/29.
//  Copyright © 2016年 Geminy. All rights reserved.
//

#import "ZYTextField.h"

@implementation ZYTextField

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {

        _line = [[UIView alloc] init];
        _line.backgroundColor = [UIColor colorWithRed:200.0/255 green:200.0/255 blue:200.0/255 alpha:1];
        [self addSubview:_line];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    CGFloat w = self.frame.size.width;
    CGFloat h = 0.5;
    CGFloat x = 0;
    CGFloat y = self.frame.size.height - h;

    _line.frame =  CGRectMake(x, y, w, h);
}

- (void)setLineColor:(UIColor *)color
{
    _line.backgroundColor = color;
}

@end
