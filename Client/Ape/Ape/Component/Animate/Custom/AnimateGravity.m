//
//  AnimateGravity.m
//  HorseRiding
//
//  Created by 孙昕 on 16/3/4.
//  Copyright © 2016年 LHCX. All rights reserved.
//

#import "AnimateGravity.h"

@implementation AnimateGravity
-(void)animateTransition:(id<UIViewControllerContextTransitioning>)context
{
    UIView *containerView = [context containerView];
    [containerView addSubview:self.toVC.view];
    if(self.presentType==PRESENT)
    {
        CGRect frame=[context finalFrameForViewController:self.toVC];
        frame.origin.y=-frame.size.height;
        self.toVC.view.frame=frame;
        self.toVC.view.transform=CGAffineTransformMakeRotation(M_PI_2/4);
        NSTimeInterval duration = self.interval;
        [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:10 options:UIViewAnimationOptionCurveEaseIn animations:^{
            self.toVC.view.transform=CGAffineTransformIdentity;
            self.toVC.view.center=containerView.center;
        } completion:^(BOOL finished) {
            [context completeTransition:YES];
        }];
    }
}
@end
