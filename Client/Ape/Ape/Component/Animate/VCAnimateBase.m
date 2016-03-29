//
//  VCAnimateBase.m
//  demotest
//
//  Created by 孙昕 on 16/2/22.
//  Copyright © 2016年 孙昕. All rights reserved.
//

#import "VCAnimateBase.h"
@interface VCAnimateBase()<UIViewControllerAnimatedTransitioning>

@end
@implementation VCAnimateBase
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    if([self respondsToSelector:@selector(animateDuration:)])
    {
        self.interval=[self animateDuration:transitionContext];
    }
    return self.interval;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    [self animateTransition:transitionContext];
    
}

@end
