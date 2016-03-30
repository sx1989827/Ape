//
//  UINavigationBar+ClearColor.m
//  HDecoration
//
//  Created by GR on 15/12/28.
//  Copyright © 2015年 HDecoration. All rights reserved.
//

#import "UINavigationBar+ClearColor.h"
#import "UIImage+Extention.h"
#import "UIColor+Category.h"
@implementation UINavigationBar (ClearColor)

- (void)clearColor {
    
    UIImage *image = [UIImage imageWithColor:[UIColor colorWithWhite:0.5 alpha:0.0]];
    [self setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    self.shadowImage = image;
    
    [self setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    self.shadowImage = [[UIImage alloc] init];
    
}
- (void)setUniteStyle {
    
    UIImage *grayImage = [UIImage imageWithColor:[UIColor hexStringToColor:@"#fafafa"]];
    UIImage *shadowImage = [UIImage imageWithColor:[UIColor hexStringToColor:@"#e5e5e5"]];
    [self setBackgroundImage:grayImage forBarMetrics:UIBarMetricsDefault];
    self.shadowImage = shadowImage;
}

- (void)setTitleColor:(UIColor *)color {
    
    NSDictionary *dic = @{NSForegroundColorAttributeName :color};
    NSMutableDictionary *attris = [self.titleTextAttributes mutableCopy];
    [attris addEntriesFromDictionary:dic];
    self.titleTextAttributes = [attris copy];
}

- (void)setTitleFont:(UIFont *)font {
    
    NSDictionary *dic = @{NSFontAttributeName :font};
    NSMutableDictionary *attris = [self.titleTextAttributes mutableCopy];
    [attris addEntriesFromDictionary:dic];
    self.titleTextAttributes = [attris copy];
}

- (void)clearTitleAttributes {
    
    NSDictionary *dic = [NSDictionary dictionary];
    self.titleTextAttributes = [dic copy];
}


@end
