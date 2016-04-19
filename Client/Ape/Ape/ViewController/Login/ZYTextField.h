//
//  ZYTextField.h
//  Ape
//
//  Created by Geminy on 16/3/29.
//  Copyright © 2016年 Geminy. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ZYTextField : UITextField

@property (strong, nonatomic) UIView *line;

- (void)setLineColor:(UIColor *)color;
@end
