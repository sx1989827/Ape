//
//  AnimateTest.m
//  demotest
//
//  Created by 孙昕 on 16/2/19.
//  Copyright © 2016年 孙昕. All rights reserved.
//

#import "AnimateTest.h"
@interface AnimateTest()
{
    
}
@end
@implementation AnimateTest

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)context
{
    UIView *containerView = [context containerView];
    [containerView addSubview:self.toVC.view];
    if(self.presentType==PRESENT)
    {
        CGRect frame=[context finalFrameForViewController:self.toVC];
        self.toVC.view.frame=frame;
        self.toVC.view.alpha=0.5;
        NSTimeInterval duration = self.interval;
        [UIView animateWithDuration:duration animations:^{
            self.toVC.view.alpha=1;
            self.fromVC.view.alpha=0;
        } completion:^(BOOL finished) {
            [context completeTransition:YES];
            self.fromVC.view.alpha=1;
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








