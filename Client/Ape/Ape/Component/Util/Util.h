//
//  Util.h
//  HorseRiding
//
//  Created by 孙昕 on 16/2/2.
//  Copyright © 2016年 孙昕. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking.h>
@interface Util : NSObject
+ (NSString *)timeStampIntoTimeString:(NSString *)time;
+ (NSString *)computeTimeWithStampStr:(NSString *)time;
//创建指定字窜的Label
+(UILabel*)UILabelWithText:(NSString*)text fontSize:(int)fontSize;
+(UILabel*)UILabelWithText:(NSString*)text boldFontSize:(int)fontSize;
+(UIButton*)buttonWithTitle:(NSString*)title frame:(CGRect)rect;

//获取字符窜大小
+(CGSize)getSizeWithText:(NSString*)text fontSize:(int)fontSize;
+(CGSize)getSizeWithText:(NSString*)text font:(UIFont*)font;
+(CGSize)getSizeWithText:(NSString*)text boldfontSize:(int)fontSize;
+(CGSize)sizeWithString:(NSString*) string  font:(UIFont*)font size:(CGSize)size;
+(CGSize)sizeWithString:(NSString*) string  attribute:(NSDictionary*)attribute size:(CGSize)size;
+(float)heightForTextViewSize:(CGSize)size  WithText: (NSString *) strText font:(UIFont*)font;

//获取NSAttributed字符窜大小
+(CGSize)sizeWithString:(NSAttributedString*) attrStr size:(CGSize)size;
+ (NSString *)timeStampIntoTimeString:(NSString *)time withFormatter:(NSString *)formatter;
//将时间转化成字符串
+(NSString*)formatter:(NSString*) formattter FromeDate:(NSDate*)date;

+(NSString*)formatter:(NSString*) formattter FromTime:(double)time;

//字符串转化
+(NSString*)check:(NSObject*)data;

//校检NSNumber
+(NSNumber*)checkNumber:(NSNumber*)num;
//校检NSData
+(NSData*)checkData:(NSData*)value;

+ (UIFont *)systemFont:(CGFloat)fontsize;
+ (UIFont *)boldFont:(CGFloat)fontsize;

//电话
+(BOOL)call:(NSString *)phoneNumber;

+(NSString*)clearSpaces:(NSString*)str;

//隐藏键盘
+(void)hidenKeyBoard;
//提示弹出
+(void)showTipAlertWithMsg:(NSString*)msg;

+(void)showErrorAlertWithMsg:(NSString*)msg;


+(BOOL)isValidateEmail:(NSString *)email;

//匹配是否为中文字符
+(BOOL)checkChinese:(NSString *)number;

//验证手机
+(BOOL)checkMoblieNumber:(NSString *)number;

//验证身份证号
+(BOOL)checkIdCardNo:(NSString *)idCardNo;

//验证姓名
+(BOOL)checkName:(NSString *)name;

/**
 *  获取软件版本
 */
+ (NSString *)softwareVersion;

/**
 *  创建一条分割线
 */
+ (CALayer *)line:(CGRect)frame color:(UIColor *)color;
+ (CALayer *)dashLine:(CGRect)frame color:(UIColor *)color;
+ (void)callWithPhoneNumber:(NSString * )phoneNum;
+ (void)sendMesWithPhoneNumber:(NSString *)phoneNum;
+ (void) getWithUrl:(NSString *)urlStr withParams:(NSDictionary *)params SuccessBlock:(void (^)(NSDictionary* dic))blockSucess FailBlock:(void (^)(NSError *error))blockFail ShowHud:(BOOL)bHud;
+ (void) postWithUrl:(NSString *)urlStr withParams:(NSDictionary *)params SuccessBlock:(void (^)(NSDictionary* dic))blockSucess FailBlock:(void (^)(NSError *error))blockFail ShowHud:(BOOL)bHud;
+ (void) postWithUrl:(NSString *)urlStr withParams:(NSDictionary *)params BodyBlock:(void (^)(id<AFMultipartFormData> formData))blockBody SuccessBlock:(void (^)(NSDictionary* dic))blockSucess FailBlock:(void (^)(NSError *error))blockFail ShowHud:(BOOL)bHud;
+ (void) putWithUrl:(NSString *)urlStr withParams:(NSDictionary *)params SuccessBlock:(void (^)(NSDictionary* dic))blockSucess FailBlock:(void (^)(NSError *error))blockFail ShowHud:(BOOL)bHud;
+ (void) deleteWithUrl:(NSString *)urlStr withParams:(NSDictionary *)params SuccessBlock:(void (^)(NSDictionary* dic))blockSucess FailBlock:(void (^)(NSError *error))blockFail ShowHud:(BOOL)bHud;

+(UIViewController*)topViewController;
@end
