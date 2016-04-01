//
//  Util.h
//  HorseRiding
//
//  Created by 孙昕 on 16/2/2.
//  Copyright © 2016年 孙昕. All rights reserved.
//

#import <UIKit/UIKit.h>
extern NSString *serverUrl;

#define APPFRAME [[UIScreen mainScreen] applicationFrame]
#define SCREENFRAME ([[UIScreen mainScreen] bounds])
#define SCREEN_WIDTH (SCREENFRAME.size.width)
#define SCREEN_HEIGHT (SCREENFRAME.size.height)
#define NAV_HEIGHT    64
#define SCREEN_HEIGHT_NONAV (SCREEN_HEIGHT - NAV_HEIGHT)

#define WR4_7 [UIScreen mainScreen].bounds.size.width/375.0
#define HR4_7 [UIScreen mainScreen].bounds.size.height/667.0

#define IPHONE_4    SCREEN_HEIGHT == 480.0f
#define IPHONE_5    SCREEN_HEIGHT == 568.0f
#define IPHONE_6    SCREEN_HEIGHT == 667.0f
#define IPHONE_6P   SCREEN_HEIGHT == 736.0f
#define IPAD        (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#define kRandomColor kColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
#define kColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define kColorRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#define kLightBlue kColor(38, 128, 255)

#define isIos7Later [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0


#ifdef DEBUG
#define DLog( s, ... ) NSLog( @"<%@:%d> %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__,  [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#else
#define DLog( s, ...)
#endif