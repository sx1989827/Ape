//
//  VCAnimateDefine.m
//  demotest
//
//  Created by 孙昕 on 16/2/20.
//  Copyright © 2016年 孙昕. All rights reserved.
//

#import "VCAnimateDefine.h"
static NSArray *g_arrVC;
@implementation VCAnimateDefine
+(void)load
{
    g_arrVC=@[
            @{
                @"type":@(PRESENT),
                @"fromVC":@"StudyVC",
                @"toVC":@"CoachListVC",
                @"ani":@"AnimatePushPop",
                @"time":@(0.6),
                @"style":@(UIModalPresentationFullScreen)
            },
            @{
                @"type":@(DISSMIS),
                @"fromVC":@"CoachListVC",
                @"toVC":@"StudyVC",
                @"ani":@"AnimateTest",
                @"time":@(0.6),
                @"style":@(UIModalPresentationFullScreen)
                },
            @{
                @"type":@(UINavigationControllerOperationPush),
                @"fromVC":@"CoachListVC",
                @"toVC":@"CoachDetailVC",
                @"ani":@"AnimatePhoto",
                @"time":@(0.6)
                },
            @{
                @"type":@(UINavigationControllerOperationPop),
                @"fromVC":@"CoachDetailVC",
                @"toVC":@"CoachListVC",
                @"ani":@"AnimatePhoto",
                @"time":@(0.6)
                },
            @{
                @"type":@(PRESENT),
                @"fromVC":@"MainVC",
                @"toVC":@"*",
                @"ani":@"AnimateGravity",
                @"time":@(1)
                }
            ];
}

+(id)aniFromVCInfo:(UINavigationControllerOperation)operation FromVC:(UIViewController*)fromVC ToVC:(UIViewController*)toVC
{
    NSString* strFrom=NSStringFromClass([fromVC class]);
    NSString *strTo=NSStringFromClass([toVC class]);
    NSDictionary *dicFromTo,*dicFrom,*dicDefault;
    for(NSDictionary *dic in g_arrVC)
    {
        if([dic[@"type"] integerValue]==operation)
        {
            if([dic[@"fromVC"] isEqualToString:strFrom] && [dic[@"toVC"] isEqualToString:strTo])
            {
                dicFromTo=dic;
            }
            else if([dic[@"fromVC"] isEqualToString:strFrom] && [dic[@"toVC"] isEqualToString:@"*"])
            {
                dicFrom=dic;
            }
            else if([dic[@"fromVC"] isEqualToString:@"*"] && [dic[@"toVC"] isEqualToString:@"*"])
            {
                dicDefault=dic;
            }
        }
    }
    VCAnimateBase *ani;
    if(dicFromTo)
    {
        Class cls=NSClassFromString(dicFromTo[@"ani"]);
        ani=[[cls alloc] init];
        ani.interval=[dicFromTo[@"time"] doubleValue];
    }
    else if(dicFrom)
    {
        Class cls=NSClassFromString(dicFrom[@"ani"]);
        ani=[[cls alloc] init];
        ani.interval=[dicFrom[@"time"] doubleValue];
    }
    else if(dicDefault)
    {
        Class cls=NSClassFromString(dicDefault[@"ani"]);
        ani=[[cls alloc] init];
        ani.interval=[dicDefault[@"time"] doubleValue];
    }
    else
    {
        ani=nil;
    }
    return ani;
}

+(id)aniFromPreVCInfo:(enum PRESENTTYPE)operation FromVC:(UIViewController*)fromVC ToVC:(UIViewController*)toVC
{
    if([toVC isKindOfClass:[UINavigationController class]] && operation==PRESENT)
    {
        toVC=((UINavigationController*)toVC).viewControllers[0];
    }
    else if([fromVC isKindOfClass:[UINavigationController class]] && operation==DISSMIS)
    {
        fromVC=((UINavigationController*)fromVC).visibleViewController;
    }
    NSString* strFrom=NSStringFromClass([fromVC class]);
    NSString *strTo=NSStringFromClass([toVC class]);
    NSDictionary *dicFromTo,*dicFrom,*dicDefault;
    for(NSDictionary *dic in g_arrVC)
    {
        if([dic[@"type"] integerValue]==operation)
        {
            if([dic[@"fromVC"] isEqualToString:strFrom] && [dic[@"toVC"] isEqualToString:strTo])
            {
                dicFromTo=dic;
            }
            else if([dic[@"fromVC"] isEqualToString:strFrom] && [dic[@"toVC"] isEqualToString:@"*"])
            {
                dicFrom=dic;
            }
            else if([dic[@"fromVC"] isEqualToString:@"*"] && [dic[@"toVC"] isEqualToString:@"*"])
            {
                dicDefault=dic;
            }
        }
    }
    VCAnimateBase *ani;
    if(dicFromTo)
    {
        Class cls=NSClassFromString(dicFromTo[@"ani"]);
        ani=[[cls alloc] init];
        ani.interval=[dicFromTo[@"time"] doubleValue];
        ani.modalStyle=[dicFromTo[@"style"] integerValue];
    }
    else if(dicFrom)
    {
        Class cls=NSClassFromString(dicFrom[@"ani"]);
        ani=[[cls alloc] init];
        ani.interval=[dicFrom[@"time"] doubleValue];
        ani.modalStyle=[dicFromTo[@"style"] integerValue];
    }
    else if(dicDefault)
    {
        Class cls=NSClassFromString(dicDefault[@"ani"]);
        ani=[[cls alloc] init];
        ani.interval=[dicDefault[@"time"] doubleValue];
        ani.modalStyle=[dicFromTo[@"style"] integerValue];
    }
    else
    {
        ani=nil;
    }
    return ani;
}

@end












