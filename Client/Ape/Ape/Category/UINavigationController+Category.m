//
//  UINavigationController.m
//  HorseRiding
//
//  Created by 孙昕 on 16/3/2.
//  Copyright © 2016年 LHCX. All rights reserved.
//

#import "Hook.h"
#import "BaseVM.h"
#import <objc/runtime.h>
@implementation UINavigationController(VM)
+(void)load
{
    [Hook hookMethod:[UINavigationController class] OriginSelector:@selector(initWithRootViewController:) SwizzledSelector:@selector(myInitWithRootViewController:)];
}

- (instancetype)myInitWithRootViewController:(UIViewController *)rootViewController
{

    NSString *ToView=NSStringFromClass([rootViewController class]);
    NSString *strVM=[ToView substringWithRange:NSMakeRange(0, ToView.length-2)];
    strVM=[strVM stringByAppendingString:@"VM"];
    Class cls=NSClassFromString(strVM);
    if(cls!=0x0 && [self existVM:[rootViewController class]] && [rootViewController valueForKey:@"vm"]==nil)
    {
        BaseVM* vm=[[cls alloc] init];
        [rootViewController setValue:vm forKey:@"vm"];
    }

    return [self myInitWithRootViewController:rootViewController];
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
@end









