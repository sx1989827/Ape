//
//  NSDate+HDExtension.h
//  HDecoration
//
//  Created by 联合创想 on 15/12/31.
//  Copyright © 2015年 HDecoration. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (HDExtension)

// 字符串转化为时间戳
+ (NSString *)timeStampIntoTimeString:(NSString *)time;


/**
 *  是否为今天
 */
+ (BOOL)isTodayWithStr:(NSString *)timeStr;

+ (NSString *)timeStampIntoAllTimeString:(NSString *)time;

- (BOOL)isToday;

- (NSDateComponents *)deltaWithNow;

@end
