//
//  UIButton+Block.m
//  VeryZhunEx
//
//  Created by Cain Goodbye on 14-1-16.
//  Copyright (c) 2014年 Cain Goodbye. All rights reserved.
//

#import "UIButton+Block.h"
#import <objc/message.h>
static NSString * const keyButton = @"com.button.key";

@implementation UIButton (Block)

- (void)btnEvent
{
    void (^block)(UIButton *button) = objc_getAssociatedObject(self, (__bridge const void *)(keyButton));
    block(self);
}

- (void)addAction:(void(^)(UIButton *))block forControlEvents:(UIControlEvents) controlEvents
{
    if (block) {
        objc_setAssociatedObject(self, (__bridge const void *)(keyButton), block, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [self addTarget:self action:@selector(btnEvent) forControlEvents:controlEvents];
    }
}


-(NSString*)text
{
    NSString *str=[self titleForState:UIControlStateNormal];
    if(str==nil)
    {
        str=@"";
    }
    return str;
}

-(void)setText:(NSString *)text
{
    [self setTitle:text forState:UIControlStateNormal];
}

@end
