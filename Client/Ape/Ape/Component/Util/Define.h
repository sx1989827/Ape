//
//  Util.h
//  HorseRiding
//
//  Created by 孙昕 on 16/2/2.
//  Copyright © 2016年 孙昕. All rights reserved.
//

#import <UIKit/UIKit.h>
extern NSString *serverUrl;
extern NSString *serverSignUp;
extern NSString *msgWebViewGoBack;
extern NSString *msgRefreshWebView;
extern NSString * goToSignUp;
extern NSString * changeCoachNoti;
extern NSString * scrollToCurrentLocation;


extern int userState;
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
//颜色常量
#define KBlueColor ([UIColor colorWithRed:0.0588 green:0.5059 blue:1 alpha:1])
#define KGrayColor ([UIColor colorWithRed:0.9373 green:0.9373 blue:0.9569 alpha:1])
#define KRedColor  [UIColor colorWithRed:0.9098 green:0.3451 blue:0.2627 alpha:1]
#define kGrayLineColor [UIColor colorWithRed:0.9255 green:0.9255 blue:0.9255 alpha:1]
#define kCoverColor [UIColor colorWithRed:0 green:0 blue:0 alpha:0.32]
#define kLightGrayColor [UIColor hexStringToColor:@"#9b9b9b"]
#define kDarkGrayColor [UIColor hexStringToColor:@"#343434"]
#define kContentViewColor [UIColor hexStringToColor:@"#f6f6f6"]

#define kOrangeColor [UIColor hexStringToColor:@"#ff8903"]
#define kBlackColor [UIColor hexStringToColor:@"#5d5d5d"]
#define kBlackColor2 [UIColor hexStringToColor:@"#333333"]
#define kGrayColor2  [UIColor hexStringToColor:@"#9e9e9e"]

//
#define HLTRandomColor HLTColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
#define kColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define HLTHeightMatch(Height)   (Height)*(SCREEN_HEIGHT - 64)/(603)
#define HLTWidthMatch(Width)   (Width)*(SCREEN_WIDTH)/375

#define kColorRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

// 随机色
#define ZYRandomColor ZYColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

#define isIos7Later [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0


#ifdef DEBUG
#define DLog( s, ... ) NSLog( @"<%@:%d> %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__,  [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#else
#define DLog( s, ...)
#endif