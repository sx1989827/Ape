//
//  ew.h
//  HorseRiding
//
//  Created by 孙昕 on 16/2/2.
//  Copyright © 2016年 孙昕. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extensin)
- (NSString *) md5;
- (NSString *) trim;
- (BOOL) isEmpty;
- (NSDictionary *) parseJson;
- (BOOL)isMobileNumber;
//验证手机
+(BOOL)checkMoblieNumber:(NSString *)number;

//验证姓名
+(BOOL)checkName:(NSString *)name;

//验证身份证号
+(BOOL)checkIdCardNo:(NSString *)idCard;

//验证价格
+(BOOL)checkPrice:(NSString *)price;

//验证银行卡
+(BOOL)checkBankCardId:(NSString *)bankCardId;

//验证密码
+(BOOL)checkPassword:(NSString *)password;

/**将@"1"转"1:00-2:00"*/
+ (NSString *)formatTimeWithHourByOneHour:(NSString *)time_str;

/**获取"2016-01-03"的"3",或者"2016-01-22"的"22"*/
+ (NSString *)subStringDayFromDateStringByZeroOrNot:(NSString *)dateString;

/**时间戳改成日期字符串*/
+ (NSString *)formatToDateStrWithTimestamp:(NSString *)timestamp;

/**日期+时间转换成时间戳*/
+ (NSString *)analyseToTimeStampWithTime:(NSString *)time andDate:(NSString *)date_str;

@end
