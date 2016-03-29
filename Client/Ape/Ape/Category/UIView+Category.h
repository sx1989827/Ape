//
//  UIView+Category.h
//  VeryZhunInsider
//
//  Created by Cain Goodbye on 13-10-17.
//  Copyright (c) 2013年 Cain Goodbye. All rights reserved.
//

@import UIKit;

@interface UIView (Category)
@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
@property (nonatomic) CGPoint origin;
@property (nonatomic) CGSize size;
@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;
@property (nonatomic,assign) BOOL bAdaptFont;

/**
 *	@brief	获取传递UIView或者其subviews是Class的
 */
- (UIView *)descendantOrSelfWithClass:(Class) cls;

/**
 *	@brief	获取View所属的view controller
 */
- (UIViewController *)viewController;

- (UINavigationController *)navigationController;

/**
 *	@brief	长度、宽度按百分比缩放
 */
- (void)resizeToPrecent:(float) precent;

- (void)removeAllSubviews;
-(UIImage*)imageCache;
@end
