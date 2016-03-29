//
//  ew.m
//  HorseRiding
//
//  Created by 孙昕 on 16/2/2.
//  Copyright © 2016年 孙昕. All rights reserved.
//

#import "NSString+Category.h"
#include <sys/types.h>
#include <sys/sysctl.h>
#import <CommonCrypto/CommonDigest.h>
@implementation NSString (Extensin)
- (NSString *) md5{
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result ); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

- (NSString *) trim
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (BOOL) isEmpty
{
    return self.length == 0;
}

- (NSDictionary *) parseJson
{
    NSData *da= [self dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    NSDictionary *data = [NSJSONSerialization JSONObjectWithData:da options:NSJSONReadingMutableLeaves error:&error];
    return data;
}

-(BOOL)isMobileNumber{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188,1705
     * 联通：130,131,132,152,155,156,185,186,1709
     * 电信：133,1349,153,180,189,1700
     */
    NSString * MOBILE = @"^1\\d{10}$";
    
    // 移动
    //    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d|705)\\d{7}$";
    
    // 联通
    //    NSString * CU = @"^1((3[0-2]|5[256]|8[56])\\d|709)\\d{7}$";
    
    // 电信
    //    NSString * CT = @"^1((33|53|8[09])\\d|349|700)\\d{7}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    return [regextestmobile evaluateWithObject:self];
}

//检查电话号码是否合法
+(BOOL)checkPhoneNumInput:(NSString *)number
{
    NSString * MOBILE = @"^[0-9]{8,20}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    BOOL res1 = [regextestmobile evaluateWithObject:number];
    
    if (res1)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

//验证手机
+(BOOL)checkMoblieNumber:(NSString *)number
{
    NSString * MOBILE = @"^1[0-9][0-9]\\d{8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    BOOL res1 = [regextestmobile evaluateWithObject:number];
    if (res1)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

//验证姓名
+(BOOL)checkName:(NSString *)name
{
    NSString * Name = @"[a-zA-Z\u4e00-\u9fa5][a-zA-Z\u4e00-\u9fa5]+";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", Name];
    BOOL res1 = [regextestmobile evaluateWithObject:name];
    
    if (res1)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

//验证身份证号
+(BOOL)checkIdCardNo:(NSString *)idCardNo
{
    NSString * IdCardNo = @"^(\\d{15}$|^\\d{18}$|^\\d{17}(\\d|X|x))$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", IdCardNo];
    BOOL res1 = [regextestmobile evaluateWithObject:idCardNo];
    
    if (res1)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

//验证价格
+(BOOL)checkPrice:(NSString *)price
{
    NSString * Price = @"^(([0-9]+\\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\\.[0-9]+)|([0-9]*[1-9][0-9]*))$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", Price];
    BOOL res1 = [regextestmobile evaluateWithObject:price];
    
    if (res1)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

//验证银行卡
+(BOOL)checkBankCardId:(NSString *)bankCardId
{
    NSString * BankCardId = @"^\\d{8,}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", BankCardId];
    BOOL res1 = [regextestmobile evaluateWithObject:bankCardId];
    
    if (res1)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

//验证密码
+(BOOL)checkPassword:(NSString *)password
{
    NSString * Password = @"[\\w\\W]{6,16}";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", Password];
    BOOL res1 = [regextestmobile evaluateWithObject:password];
    
    if (res1)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

+ (NSString *)formatTimeWithHourByOneHour:(NSString *)time_str
{
    int time_int = [time_str intValue]; //如果time_str=@"1",则返回1
    int nTime_int = time_int + 1;       //2
    NSString *nTime_str = [NSString stringWithFormat:@"%@",@(nTime_int)]; //@"2"
    NSString *date_str = [time_str stringByAppendingString:@":00"];       //@"1:00"
    NSString *nDate_str = [nTime_str stringByAppendingString:@":00"];     //@"2:00"
    NSString *appendDate_str = [NSString stringWithFormat:@"%@-%@",date_str,nDate_str];//@"1:00-2:00"
    return appendDate_str;
}

+ (NSString *)subStringDayFromDateStringByZeroOrNot:(NSString *)dateString
{
    if (dateString.length > 2) {
        NSString *day = [dateString substringFromIndex:dateString.length - 2];
        if ([day intValue] >= 10) {
            return day;
        } else {
            return [day substringFromIndex:1];
        }
    } else {
        return dateString;
    }
}

+ (NSString *)formatToDateStrWithTimestamp:(NSString *)timestamp
{
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[timestamp doubleValue]*0.001];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"M月dd日  HH:mm"];
    return [formatter stringFromDate:confromTimesp];
}

+ (NSString *)analyseToTimeStampWithTime:(NSString *)time andDate:(NSString *)date_str
{
    NSString *time_str = [time stringByAppendingString:@":00"];
    time_str = [[NSString stringWithFormat:@"%@ ",date_str] stringByAppendingString:time_str];

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm"];

    NSDate* date = [dateFormatter dateFromString:time_str];
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]];

    return timeSp;
}
@end
