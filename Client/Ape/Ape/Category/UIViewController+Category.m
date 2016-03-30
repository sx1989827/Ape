//
//  UIViewController.m
//  HorseRiding
//
//  Created by 孙昕 on 16/2/2.
//  Copyright © 2016年 孙昕. All rights reserved.
//

#import "UIViewController+Category.h"
#import "UIView+Category.h"
#import "BaseVM.h"
#import <objc/runtime.h>
#import "VCAnimateManager.h"
#import "Hook.h"
static const char g_charModalVC;
@implementation UIViewController (HorseRiding)
-(UIViewController*)pushViewController:(NSString *)ToView Param:(NSDictionary *)param
{
    Class cls=NSClassFromString(ToView);
    id viewController=[[[cls class] alloc] init];
    BaseVM *vm;
    if(param!=nil)
    {
        for(NSString *key in param)
        {
            id obj=param[key];
            [viewController setValue:obj forKey:key];
            if([key isEqualToString:@"vm"])
            {
                vm=obj;
            }
        }
    }
    if(vm==nil)
    {
        NSString *strVM=[ToView substringWithRange:NSMakeRange(0, ToView.length-2)];
        strVM=[strVM stringByAppendingString:@"VM"];
        Class cls=NSClassFromString(strVM);
        if(cls!=0x0 && [self existVM:[viewController class]])
        {
            vm=[[cls alloc] init];
            [viewController setValue:vm forKey:@"vm"];
        }
    }
    if(vm!=nil)
    {
        vm.fromVC=self;
        vm.toVC=viewController;
        vm.nav=self.navigationController;
        vm.showVcType=PUSH;
    }
    ((UIViewController*)viewController).hidesBottomBarWhenPushed=YES;
    self.navigationController.delegate=[VCAnimateManager sharedObject];
    [self.navigationController pushViewController:viewController animated:YES];
    return viewController;
}

-(UIViewController*)presentViewController:(NSString *)ToView Param:(NSDictionary*)param
{
    Class cls=NSClassFromString(ToView);
    UIViewController* viewController=[[[cls class] alloc] init];
    BaseVM *vm;
    if(param!=nil)
    {
        for(NSString *key in param)
        {
            id obj=param[key];
            [viewController setValue:obj forKey:key];
            if([key isEqualToString:@"vm"])
            {
                vm=obj;
            }
        }
    }
    if(vm==nil)
    {
        NSString *strVM=[ToView substringWithRange:NSMakeRange(0, ToView.length-2)];
        strVM=[strVM stringByAppendingString:@"VM"];
        Class cls=NSClassFromString(strVM);
        if(cls!=0x0 && [self existVM:[viewController class]])
        {
            vm=[[cls alloc] init];
            [viewController setValue:vm forKey:@"vm"];
        }
    }
    UINavigationController *nav=[[UINavigationController alloc] initWithRootViewController:viewController];
    if(vm!=nil)
    {
        vm.fromVC=self;
        vm.toVC=viewController;
        vm.nav=nav;
        vm.showVcType=PRESENT;
    }
    nav.transitioningDelegate=[VCAnimateManager sharedObject];
    [self presentViewController:nav animated:YES completion:nil];
    return viewController;
}

-(void)dismiss
{
    UIImage *img=[[UIApplication sharedApplication].keyWindow imageCache];
    UIImageView *view=[[UIImageView alloc] initWithImage:img];
    view.frame=[UIScreen mainScreen].bounds;
    view.layer.zPosition=FLT_MAX;
    [[UIApplication sharedApplication].keyWindow addSubview:view];
    [UIView transitionWithView:[UIApplication sharedApplication].keyWindow duration:1 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        view.alpha=0;
    } completion:^(BOOL finished) {
        [view removeFromSuperview];
    }];
}

-(void)flipToView:(UIView*)view
{
    UIImage *img=[[UIApplication sharedApplication].keyWindow imageCache];
    UIImageView *v=[[UIImageView alloc] initWithImage:img];
    v.frame=[UIScreen mainScreen].bounds;
    v.layer.zPosition=FLT_MAX;
    [[UIApplication sharedApplication].keyWindow addSubview:v];
    [UIView transitionFromView:v toView:view duration:1 options:UIViewAnimationOptionTransitionFlipFromRight completion:^(BOOL finished) {
        [v removeFromSuperview];
    }];
}


-(BOOL)existVM:(Class)cls
{
    unsigned int ivarsCnt = 0;
    Ivar *ivars = class_copyIvarList(cls, &ivarsCnt);
    for (const Ivar *p = ivars; p < ivars + ivarsCnt; ++p)
    {
        Ivar const ivar = *p;
        NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
        if([key isEqualToString:@"vm"] || [key isEqualToString:@"_vm"])
        {
            return YES;
        }
        
    }
    return NO;
}

+(void)load
{
    [Hook hookMethod:[UIViewController class] OriginSelector:@selector(addChildViewController:) SwizzledSelector:@selector(myAddChildViewController:)];
}

- (void)myAddChildViewController:(UIViewController *)childController
{
    NSString *ToView=NSStringFromClass([childController class]);
    NSString *strVM=[ToView substringWithRange:NSMakeRange(0, ToView.length-2)];
    strVM=[strVM stringByAppendingString:@"VM"];
    Class cls=NSClassFromString(strVM);
    if(cls!=0x0 && [self existVM:[childController class]])
    {
        BaseVM* vm=[[cls alloc] init];
        [childController setValue:vm forKey:@"vm"];
    }
   [self myAddChildViewController:childController];
}

-(void)setModalVC:(UIViewController *)modalVC
{
    objc_setAssociatedObject(self, &g_charModalVC, modalVC, OBJC_ASSOCIATION_ASSIGN);
}

-(UIViewController*)modalVC
{
    return  objc_getAssociatedObject(self, &g_charModalVC);
}
@end






