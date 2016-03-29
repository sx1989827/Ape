//
//  VCAnimateManager.m
//  demotest
//
//  Created by 孙昕 on 16/2/19.
//  Copyright © 2016年 孙昕. All rights reserved.
//

#import "VCAnimateManager.h"
#import "VCAnimateDefine.h"
#import "VCAnimateBase.h"
#import "UIViewController+Category.h"
#import "Util.h"
@interface VCAnimateManager()
{
    UIPercentDrivenInteractiveTransition *inter;
    __weak UINavigationController *nav;
}
@end
@implementation VCAnimateManager
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    nav=navigationController;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC
{
    VCAnimateBase* ani= [VCAnimateDefine aniFromVCInfo:operation FromVC:fromVC ToVC:toVC];
    ani.bNavigation=YES;
    ani.type=operation;
    ani.fromVC=fromVC;
    ani.toVC=toVC;
    return (id <UIViewControllerAnimatedTransitioning>)ani;
}

-(id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
{
    VCAnimateBase *ani= animationController;
    if([[ani.fromVC valueForKey:@"bInteractive"] boolValue])
    {
        return inter;
    }
    return nil;
}

+(instancetype)sharedObject
{
    static VCAnimateManager *obj=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        obj=[[VCAnimateManager alloc] init];
    });
    return obj;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    if([presented isKindOfClass:[UINavigationController class]])
    {
        ((UINavigationController*)presented).viewControllers[0].modalVC=source;
    }
    else
    {
        presented.modalVC=source;
    }
    VCAnimateBase* ani= [VCAnimateDefine aniFromPreVCInfo:PRESENT FromVC:source   ToVC:presented];
    ani.bNavigation=NO;
    ani.presentType=PRESENT;
    ani.fromVC=source;
    ani.toVC=presented;
    presented.modalPresentationStyle=ani.modalStyle;
    return (id <UIViewControllerAnimatedTransitioning>)ani;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    if([dismissed isKindOfClass:[UINavigationController class]])
    {
        dismissed=((UINavigationController*)dismissed).visibleViewController;
    }
    VCAnimateBase* ani= [VCAnimateDefine aniFromPreVCInfo:DISSMIS FromVC:dismissed   ToVC:dismissed.modalVC];
    ani.bNavigation=NO;
    ani.presentType=DISSMIS;
    ani.fromVC=dismissed;
    ani.toVC=dismissed.presentingViewController;
    return (id <UIViewControllerAnimatedTransitioning>)ani;
}

-(id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator
{
    VCAnimateBase *ani= animator;
    UIViewController *fromVC=ani.fromVC;
    if([fromVC isKindOfClass:[UINavigationController class]] && ani.presentType==DISSMIS)
    {
        fromVC=((UINavigationController*)fromVC).visibleViewController;
    }
    if([[fromVC valueForKey:@"bInteractive"] boolValue])
    {
        return inter;
    }
    return nil;
}

-(void)handleRec:(UIScreenEdgePanGestureRecognizer*)rec
{
    CGFloat progress = [rec translationInView:[UIApplication sharedApplication].keyWindow].x / (rec.view.bounds.size.width * 1.0);
    progress = MIN(1.0, MAX(0.0, progress));
    
    if (rec.state == UIGestureRecognizerStateBegan) {
        inter = [[UIPercentDrivenInteractiveTransition alloc] init];
        UIViewController *vc=[Util topViewController];
        if(vc.modalVC!=nil)
        {
            [vc.modalVC dismissViewControllerAnimated:YES completion:nil];
        }
        else
        {
            [nav popViewControllerAnimated:YES];
        }
    }
    else if (rec.state == UIGestureRecognizerStateChanged) {
        [inter updateInteractiveTransition:progress];
    }
    else if (rec.state == UIGestureRecognizerStateEnded || rec.state == UIGestureRecognizerStateCancelled) {
        if (progress > 0.5) {
            [inter finishInteractiveTransition];
        }
        else {
            [inter cancelInteractiveTransition];
        }
        
        inter = nil;
    }
}
@end









