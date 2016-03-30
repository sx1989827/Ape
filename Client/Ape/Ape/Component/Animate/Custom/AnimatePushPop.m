//
//  AnimatePushPop.m
//  HorseRiding
//
//  Created by 孙昕 on 16/3/3.
//  Copyright © 2016年 LHCX. All rights reserved.
//

#import "AnimatePushPop.h"

@implementation AnimatePushPop
-(void)animateTransition:(id<UIViewControllerContextTransitioning>)context
{
    UIView *containerView = [context containerView];
    [containerView addSubview:self.toVC.view];
    if(self.presentType==PRESENT)
    {
        CGRect frame=[context finalFrameForViewController:self.toVC];
        self.toVC.view.frame=frame;
        self.toVC.view.alpha=0;
        self.toVC.view.transform=CGAffineTransformMakeRotation(M_PI_2);
        self.toVC.view.center=CGPointMake([UIScreen mainScreen].bounds.size.width+[UIScreen mainScreen].bounds.size.height/2, [UIScreen mainScreen].bounds.size.height-[UIScreen mainScreen].bounds.size.width/2);
        NSTimeInterval duration = self.interval;
        [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:10 options:UIViewAnimationOptionCurveEaseIn animations:^{
            self.toVC.view.alpha=1;
            self.toVC.view.transform=CGAffineTransformIdentity;
            self.toVC.view.center=containerView.center;
        } completion:^(BOOL finished) {
             [context completeTransition:YES];
        }];
    }
    else if(self.presentType==DISSMIS)
    {
        self.toVC.view.alpha=0;
        //[containerView sendSubviewToBack:self.toVC.view];
        NSTimeInterval duration = self.interval;
        [UIView animateWithDuration:duration animations:^{
            self.toVC.view.alpha=1;
            //self.fromVC.view.alpha=0;
        } completion:^(BOOL finished) {
            [context completeTransition:!context.transitionWasCancelled];
            self.fromVC.view.alpha=1;
        }];
    }
}

@end
