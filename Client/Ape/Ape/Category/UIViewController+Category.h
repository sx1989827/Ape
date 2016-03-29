//
//  UIViewController.h
//  HorseRiding
//
//  Created by 孙昕 on 16/2/2.
//  Copyright © 2016年 孙昕. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController(HorseRiding)
-(UIViewController*)pushViewController:(NSString *)ToView Param:(NSDictionary*)param;
-(UIViewController*)presentViewController:(NSString *)ToView Param:(NSDictionary*)param;
-(void)dismiss;
-(void)flipToView:(UIView*)view;
@property (weak,nonatomic) UIViewController* modalVC;
@end
