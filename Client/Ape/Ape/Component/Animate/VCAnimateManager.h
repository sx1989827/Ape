//
//  VCAnimateManager.h
//  demotest
//
//  Created by 孙昕 on 16/2/19.
//  Copyright © 2016年 孙昕. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCAnimateManager : NSObject<UINavigationControllerDelegate,UIGestureRecognizerDelegate,UIViewControllerTransitioningDelegate>
+(instancetype)sharedObject;
@end
