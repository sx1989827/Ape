//
//  AnimatePhoto.m
//  HorseRiding
//
//  Created by 孙昕 on 16/3/1.
//  Copyright © 2016年 LHCX. All rights reserved.
//

#import "AnimatePhoto.h"

@implementation AnimatePhoto
-(void)animateTransition:(id<UIViewControllerContextTransitioning>)context
{
    UIView *containerView = [context containerView];
    [containerView addSubview:self.toVC.view];
    if(self.type==UINavigationControllerOperationPush)
    {
        CGRect frame=[context finalFrameForViewController:self.toVC];
        self.toVC.view.frame=frame;
        self.toVC.view.alpha=0;
        UIView *view=[self.fromVC valueForKey:@"viewPhoto"];
        view.hidden=YES;
        frame=[view convertRect:view.bounds toView:containerView];
        UIView *viewSnap=[view snapshotViewAfterScreenUpdates:NO];
        viewSnap.frame=frame;
        [containerView addSubview:viewSnap];
        UIView *viewCustom=[self.toVC valueForKey:@"infoView"];
        viewCustom=[viewCustom valueForKey:@"photoImg"];
        viewCustom.hidden=YES;
        CGRect toFrame=[viewCustom convertRect:viewCustom.bounds toView:containerView];
        NSTimeInterval duration = self.interval;
        [UIView animateWithDuration:duration animations:^{
            self.fromVC.view.alpha=0;
            self.toVC.view.alpha=1;
            viewSnap.frame=toFrame;
        } completion:^(BOOL finished) {
            [context completeTransition:YES];
            self.fromVC.view.alpha=1;
            view.hidden=NO;
            viewCustom.hidden=NO;
            [viewSnap removeFromSuperview];
        }];
    }
    else if(self.type==UINavigationControllerOperationPop)
    {
        [containerView sendSubviewToBack:self.toVC.view];
        CGRect frame=[context finalFrameForViewController:self.toVC];
        self.toVC.view.frame=frame;
        self.toVC.view.alpha=0;
        UIView *view=[self.toVC valueForKey:@"viewPhoto"];
        view.hidden=YES;
        CGRect toFrame=[view convertRect:view.bounds toView:containerView];
        UIView *viewCustom=[self.fromVC valueForKey:@"infoView"];
        viewCustom=[viewCustom valueForKey:@"photoImg"];
        viewCustom.hidden=YES;
        frame=[viewCustom convertRect:viewCustom.bounds toView:containerView];
        UIView *viewSnap=[viewCustom snapshotViewAfterScreenUpdates:NO];
        viewSnap.frame=frame;
        [containerView addSubview:viewSnap];
        NSTimeInterval duration = self.interval;
        [UIView animateWithDuration:duration animations:^{
            self.fromVC.view.alpha=0;
            self.toVC.view.alpha=1;
            viewSnap.frame=toFrame;
        } completion:^(BOOL finished) {
            [context completeTransition:!context.transitionWasCancelled];
            view.hidden=NO;
            viewCustom.hidden=NO;
            [viewSnap removeFromSuperview];
        }];
    }
}

@end
