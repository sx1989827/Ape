//
//  BaseVM.h
//  HorseRiding
//
//  Created by 孙昕 on 16/2/22.
//  Copyright © 2016年 LHCX. All rights reserved.
//

#import <UIKit/UIKit.h>
enum SHOWVCTYPE {PUSH,PRESENT};
@interface BaseVM : NSObject
@property (weak,nonatomic) UIViewController *fromVC;
@property (weak,nonatomic) UIViewController *toVC;
@property (weak,nonatomic) UINavigationController *nav;
@property (assign,nonatomic) enum SHOWVCTYPE showVcType;
@end
