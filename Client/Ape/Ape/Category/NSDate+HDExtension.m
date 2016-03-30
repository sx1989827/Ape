//
//  NSDate+HDExtension.m
//  HDecoration
//
//  Created by 联合创想 on 15/12/31.
//  Copyright © 2015年 HDecoration. All rights reserved.
//

#import "NSDate+HDExtension.h"

@implementation NSDate (HDExtension)

// 字符串转化为时间戳（小时分钟）
+ (NSString *)timeStampIntoTimeString:(NSString *)time
{
    NSTimeInterval  interval = [time doubleValue]/1000.0;
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm"];
    NSString *dateString = [dateFormatter stringFromDate:date];
    dateString = [dateString substringFromIndex:10];
    return  dateString;
}

+ (NSString *)timeStampIntoAllTimeString:(NSString *)time
{
    NSTimeInterval  interval = [time doubleValue]/1000.0;
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm"];
    NSString *dateString = [dateFormatter stringFromDate:date];
    return  dateString;
}

/**
 *  是否为今天
 */
+ (BOOL)isTodayWithStr:(NSString *)timeStr
{
    NSDate * nowDate = [NSDate date];
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"MM-dd";
    NSString * nowStr = [fmt stringFromDate:nowDate];
    return [timeStr isEqualToString:nowStr];
}

/**
 *  是否为今天
 */
- (BOOL)isToday
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitDay | NSCalendarUnitMonth |  NSCalendarUnitYear;
    
    // 1.获得当前时间的年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    
    // 2.获得self的年月日
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    return
    (selfCmps.year == nowCmps.year) &&
    (selfCmps.month == nowCmps.month) &&
    (selfCmps.day == nowCmps.day);
}

- (NSDateComponents *)deltaWithNow
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    return [calendar components:unit fromDate:self toDate:[NSDate date] options:0];
}

@end
