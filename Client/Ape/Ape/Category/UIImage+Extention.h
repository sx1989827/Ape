//
//  UIImage+Extention.h
//  HDecoration
//
//  Created by GR on 15/12/28.
//  Copyright © 2015年 HDecoration. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extention)

/**
 *  返回一张自由拉伸的图片
 */
+ (UIImage *)resizedImageWithName:(NSString *)name;
+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top;
+ (UIImage *)imageWithColor:(UIColor *)color;

- (NSString *)base64;
@end
