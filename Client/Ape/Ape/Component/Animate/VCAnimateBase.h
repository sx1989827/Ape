//
//  VCAnimateBase.h
//  demotest
//
//  Created by 孙昕 on 16/2/22.
//  Copyright © 2016年 孙昕. All rights reserved.
//

#import <UIKit/UIKit.h>
enum PRESENTTYPE {PRESENT,DISSMIS};
@interface VCAnimateBase : NSObject
@property (assign,nonatomic) BOOL bNavigation;
@property (assign,nonatomic) UINavigationControllerOperation type;
@property (assign,nonatomic) UIModalPresentationStyle modalStyle;
@property (assign,nonatomic) enum PRESENTTYPE presentType;
@property (weak,nonatomic) UIViewController* fromVC;
@property (weak,nonatomic) UIViewController* toVC;
@property (assign,nonatomic) NSTimeInterval interval;
-(NSTimeInterval)animateDuration:(id <UIViewControllerContextTransitioning>)context;
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)context;
@end
