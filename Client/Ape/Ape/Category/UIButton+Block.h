//
//  UIButton+Block.h
//  VeryZhunEx
//
//  Created by Cain Goodbye on 14-1-16.
//  Copyright (c) 2014年 Cain Goodbye. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Block)

- (void)addAction:(void(^)(UIButton *button))block forControlEvents:(UIControlEvents) controlEvents;
@property (strong,nonatomic) NSString *text;
@end
