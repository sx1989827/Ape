//
//  VCAnimateDefine.h
//  demotest
//
//  Created by 孙昕 on 16/2/20.
//  Copyright © 2016年 孙昕. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VCAnimateBase.h"
@interface VCAnimateDefine : NSObject
+(id)aniFromVCInfo:(UINavigationControllerOperation)operation FromVC:(UIViewController*)fromVC ToVC:(UIViewController*)toVC;
+(id)aniFromPreVCInfo:(enum PRESENTTYPE)operation FromVC:(UIViewController*)fromVC ToVC:(UIViewController*)toVC;
@end
