//
//  Util.m
//  HorseRiding
//
//  Created by 孙昕 on 16/2/2.
//  Copyright © 2016年 孙昕. All rights reserved.
//

#import "Util.h"
#import "Define.h"
#import "NSString+Category.h"
#import "NSObject+Category.h"
#import "HudView.h"

@implementation Util

+ (NSString *)timeStampIntoTimeString:(NSString *)time
{
    NSTimeInterval  interval = [time doubleValue]/1000.0;
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
      dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSString *dateString = [dateFormatter stringFromDate:date];
    return  dateString;
}

+ (NSString *)timeStampIntoTimeString:(NSString *)time withFormatter:(NSString *)formatter
{
    NSTimeInterval  interval = [time doubleValue]/1000.0;
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    [dateFormatter setDateFormat:formatter];
    NSString *dateString = [dateFormatter stringFromDate:date];
    return  dateString;
}

+ (NSString *)computeTimeWithStampStr:(NSString *)time
{
    NSTimeInterval interval = [time doubleValue]/1000.0;
    
    NSInteger miniters = (NSInteger)interval/60;
    NSInteger hours = (NSInteger)miniters/60;
    NSInteger minius = (NSInteger)miniters%60;
    
    return [NSString stringWithFormat:@"%zd小时%zd分",hours,minius];
    
}

+(NSString*)formatter:(NSString*) formattter FromeDate:(NSDate*)date
{
    NSString *returnValue;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    [dateFormatter setDateFormat:formattter];
    returnValue = [dateFormatter stringFromDate:date];
    return returnValue;
}

+(BOOL)isValidateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",emailRegex];
    return [emailTest evaluateWithObject:email];
}

+(NSString*)formatter:(NSString*) formattter FromTime:(double)time
{
    NSString *returnValue=[NSString string];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formattter];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time/1000];
    if (time==0)
    {
        date=[NSDate date];
    }
    returnValue = [dateFormatter stringFromDate:date];
    return returnValue;
}

//检查名字是否合法
+(BOOL)checkNameInput:(NSString *)number
{
    NSString * name = @"^([\u4E00-\u9FA5]+|[a-zA-Z]+)$";
    NSPredicate *regextestaccount = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", name];
    BOOL res1 = [regextestaccount evaluateWithObject:number];
    
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
    NSString * MOBILE = @"^1[3|4|5|7|8][0-9]\\d{8}$";
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

//检查是不是中文
+(BOOL)checkChinese:(NSString *)number
{
    NSString * name = @"[\u4e00-\u9fa5]";
    NSPredicate *regextestaccount = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", name];
    BOOL res1 = [regextestaccount evaluateWithObject:number];
    
    if (res1)
    {
        return YES;
    }
    else
    {
        return NO;
    }
    
}


//检查密码是否合法
+(BOOL)checkPasswordInput:(NSString *)password
{
    NSString * regex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,100}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:password];
    return isMatch;
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
//获取字符串的size
+(CGSize)getSizeWithText:(NSString*)text fontSize:(int)fontSize
{
    CGSize size=[text sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]}];
    return size;
}

//获取字符串的size
+(CGSize)getSizeWithText:(NSString*)text font:(UIFont*)font
{
    CGSize size=[text sizeWithAttributes:@{NSFontAttributeName: font}];
    return size;
}

+(CGSize)getSizeWithText:(NSString*)text boldfontSize:(int)fontSize
{
    CGSize size=[text sizeWithAttributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:fontSize]}];
    return size;
}

//创建指定字窜的Label
+(UILabel*)UILabelWithText:(NSString*)text boldFontSize:(int)fontSize
{
    
    CGSize size=[text sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]}];
    UILabel* Label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    Label.text=text;
    Label.backgroundColor=[UIColor clearColor];
    Label.font=[UIFont boldSystemFontOfSize:fontSize];
    return Label;
}

//获取字符窜大小
+(CGSize)sizeWithString:(NSString*) string  font:(UIFont*)font size:(CGSize)size
{
    
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:2];
    
    NSDictionary *attribute = @{NSFontAttributeName: font, NSParagraphStyleAttributeName:paragraphStyle};
    CGSize textSize = [string boundingRectWithSize:size
                                           options:\
                       NSStringDrawingTruncatesLastVisibleLine |
                       NSStringDrawingUsesLineFragmentOrigin |
                       NSStringDrawingUsesFontLeading
                                        attributes:attribute
                                           context:nil].size;
    return textSize;
}

//获取字符窜大小
+(CGSize)sizeWithString:(NSString*) string  attribute:(NSDictionary*)attribute size:(CGSize)size
{
    CGSize textSize = [string boundingRectWithSize:size
                                           options:\
                       NSStringDrawingTruncatesLastVisibleLine |
                       NSStringDrawingUsesLineFragmentOrigin |
                       NSStringDrawingUsesFontLeading
                                        attributes:attribute
                                           context:nil].size;
    return textSize;
}

//获取NSAttributed字符窜大小
+(CGSize)sizeWithString:(NSAttributedString*) attrStr size:(CGSize)size
{
    CGSize textSize = [attrStr boundingRectWithSize:size
                                            options:\
                       NSStringDrawingTruncatesLastVisibleLine |
                       NSStringDrawingUsesLineFragmentOrigin |
                       NSStringDrawingUsesFontLeading
                                            context:nil].size;
    return textSize;
}

//创建指定字窜的Label
+(UILabel*)UILabelWithText:(NSString*)text fontSize:(int)fontSize
{
    CGSize size=[self getAttributeSizeWithText:text fontSize:fontSize];
    UILabel* Label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    Label.text=text;
    Label.backgroundColor=[UIColor clearColor];
    Label.font=[UIFont systemFontOfSize:fontSize];
    return Label;
}

+ (CGSize) getAttributeSizeWithText:(NSString *)text fontSize:(int)fontSize
{
    CGSize size=[text sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]}];
    if (isIos7Later) {
        size=[text sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]}];
    }else{
        NSAttributedString *attributeSting = [[NSAttributedString alloc] initWithString:text attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]}];
        size = [attributeSting size];
    }
    return size;
}

+(float)heightForTextViewSize:(CGSize)size  WithText: (NSString *) strText font:(UIFont*)font
{
    float fPadding = 16.0;
    CGSize constraint = CGSizeMake(size.width - fPadding, CGFLOAT_MAX);
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:5];
    
    NSDictionary *attribute = @{NSFontAttributeName: font, NSParagraphStyleAttributeName:paragraphStyle};
    CGSize newSize = [strText boundingRectWithSize:constraint
                                           options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                        attributes:attribute
                                           context:nil].size;
    
    newSize.height+=16.0;
    return newSize.height;
}


+(UIButton*)buttonWithTitle:(NSString*)title frame:(CGRect)rect
{
    UIButton* button=[UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:title forState:UIControlStateNormal];
    button.frame=rect;
    [button.titleLabel setFont:[UIFont systemFontOfSize:15]];
    return button;
}



+(void)hidenKeyBoard
{
    [[[UIApplication sharedApplication]keyWindow] endEditing:YES];
}



+(NSString*)check:(NSObject*)data
{
    NSString* string=@"";
    if ([data isKindOfClass:[NSString class]])
    {
        string=(NSString*)data;
    }
    else if ([data isKindOfClass:[NSNumber class]])
    {
        string=[(NSNumber*)data stringValue];
    }
    return string;
}

+(NSData*)checkData:(NSData*)value
{
    NSData* data=[NSData data];
    if([value isKindOfClass:[NSData class]])
    {
        data=(NSData*)value;
    }
    return data;
}

+(NSNumber*)checkNumber:(NSNumber*)num
{
    NSNumber* number=[NSNumber numberWithInt:0];
    if([num isKindOfClass:[NSNumber class]])
    {
        number=(NSNumber*)num;
    }
    return number;
}


+(NSString*)clearSpaces:(NSString*)str
{
    str=[str stringByReplacingOccurrencesOfString:@" " withString:@""];
    return str;
}

+ (void)showErrorAlertWithMsg:(NSString*)msg
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

+(BOOL)call:(NSString *)phoneNumber
{
    phoneNumber=[Util clearSpaces:phoneNumber];
    return [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",phoneNumber]]];
}


+(void)showTipAlertWithMsg:(NSString*)msg
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:msg delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
    [alert show];
    [self performBlock:^
     {
         [alert dismissWithClickedButtonIndex:0 animated:YES];
     }
            afterDelay:1.2];
}

+ (UIFont *)systemFont:(CGFloat)fontsize
{
    return [UIFont systemFontOfSize:fontsize];
}

+ (UIFont *)boldFont:(CGFloat)fontsize
{
    return [UIFont boldSystemFontOfSize:fontsize];
}



+ (CALayer *)line:(CGRect)frame color:(UIColor *)color {
    
    CALayer *line = [CALayer layer];
    line.frame = frame;
    line.backgroundColor = color.CGColor;
    
    return line;
}
+ (CALayer *)dashLine:(CGRect)frame color:(UIColor *)color {
    UIBezierPath *path = [UIBezierPath new];
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(frame.size.width, 0)];
    
    CAShapeLayer *dashLayer = [CAShapeLayer layer];
    dashLayer.frame = frame;
    dashLayer.strokeColor = color.CGColor;
    dashLayer.lineDashPhase = 0;
    dashLayer.lineDashPattern = @[@5, @3];
    dashLayer.path = path.CGPath;
    return dashLayer;
}
//打电话
+ (void)callWithPhoneNumber:(NSString * )phoneNum
{
    static UIWebView *webView;
    if (webView == nil) {
        webView = [[UIWebView alloc] initWithFrame:CGRectZero];
    }
    NSString * urlStr = [NSString stringWithFormat:@"tel://%@",phoneNum];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]]];
}

// 发信息
+ (void)sendMesWithPhoneNumber:(NSString *)phoneNum
{
    NSString * urlStr = [NSString stringWithFormat:@"sms://%@",phoneNum];
    NSURL * url = [NSURL URLWithString:urlStr];
    [[UIApplication sharedApplication] openURL:url];
}


+ (NSString *)softwareVersion {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString*)kCFBundleVersionKey];
}

+ (void) getWithUrl:(NSString *)urlStr withParams:(NSDictionary *)params SuccessBlock:(void (^)(NSDictionary* dic))blockSucess FailBlock:(void (^)(NSError *error))blockFail ShowHud:(BOOL)bHud
{
    AFHTTPRequestOperationManager *manage=[AFHTTPRequestOperationManager manager];
   // manage.requestSerializer = [AFJSONRequestSerializer serializer];//请求
    manage.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manage.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manage.requestSerializer.timeoutInterval=20;
    [manage.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    AFHTTPRequestOperation *operation= [manage GET:[serverUrl stringByAppendingString:urlStr] parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         if(bHud)
         {
             [HudView dismiss];
         }
         if(blockSucess!=nil)
         {
             NSString *responseString=operation.responseString;
             NSDictionary *data = [responseString parseJson];
             blockSucess(data);
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         if(bHud)
         {
             [HudView dismiss];
         }
         if (blockFail != nil) {
             blockFail(error);
         }
     }];
    if(bHud)
    {
        [HudView showHud:@"正在卖力加载中" CancelBlock:^{
            [operation cancel];
        }];
    }
}


+ (void) postWithUrl:(NSString *)urlStr withParams:(NSDictionary *)params SuccessBlock:(void (^)(NSDictionary* dic))blockSucess FailBlock:(void (^)(NSError *error))blockFail ShowHud:(BOOL)bHud
{
    AFHTTPRequestOperationManager *manage=[AFHTTPRequestOperationManager manager];
   // manage.requestSerializer = [AFJSONRequestSerializer serializer];//请求
    manage.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manage.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manage.requestSerializer.timeoutInterval=20;
    [manage.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    AFHTTPRequestOperation *operation= [manage POST:[serverUrl stringByAppendingString:urlStr] parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         if(bHud)
         {
             [HudView dismiss];
         }
         if(blockSucess!=nil)
         {
             NSString *responseString=operation.responseString;
             NSDictionary *data = [responseString parseJson];
             blockSucess(data);
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         if(bHud)
         {
             [HudView dismiss];
         }
         if (blockFail != nil) {
             blockFail(error);
         }
     }];
    if(bHud)
    {
        [HudView showHud:@"正在卖力加载中" CancelBlock:^{
            [operation cancel];
        }];
    }
}

+ (void) postWithUrl:(NSString *)urlStr withParams:(NSDictionary *)params BodyBlock:(void (^)(id<AFMultipartFormData> formData))blockBody SuccessBlock:(void (^)(NSDictionary* dic))blockSucess FailBlock:(void (^)(NSError *error))blockFail ShowHud:(BOOL)bHud
{
    AFHTTPRequestOperationManager *manage=[AFHTTPRequestOperationManager manager];
    manage.requestSerializer = [AFJSONRequestSerializer serializer];//请求
  //manage.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manage.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manage.requestSerializer.timeoutInterval=20;
    [manage.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    AFHTTPRequestOperation *operation= [manage POST:[serverUrl stringByAppendingString:urlStr] parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        blockBody(formData);
    } success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         if(bHud)
         {
             [HudView dismiss];
         }
         if(blockSucess!=nil)
         {
             NSString *responseString=operation.responseString;
             NSDictionary *data = [responseString parseJson];
             blockSucess(data);
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         if(bHud)
         {
             [HudView dismiss];
         }
         if (blockFail != nil) {
             blockFail(error);
         }
     }];
    if(bHud)
    {
        [HudView showHud:@"正在卖力加载中" CancelBlock:^{
            [operation cancel];
        }];
    }
}


+ (void) putWithUrl:(NSString *)urlStr withParams:(NSDictionary *)params SuccessBlock:(void (^)(NSDictionary* dic))blockSucess FailBlock:(void (^)(NSError *error))blockFail ShowHud:(BOOL)bHud
{
    AFHTTPRequestOperationManager *manage=[AFHTTPRequestOperationManager manager];
    //manage.requestSerializer = [AFJSONRequestSerializer serializer];//请求
    manage.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manage.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manage.requestSerializer.timeoutInterval=20;
    [manage.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    AFHTTPRequestOperation *operation= [manage PUT:[serverUrl stringByAppendingString:urlStr] parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         if(bHud)
         {
             [HudView dismiss];
         }
         if(blockSucess!=nil)
         {
             NSString *responseString=operation.responseString;
             NSDictionary *data = [responseString parseJson];
             blockSucess(data);
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         if(bHud)
         {
             [HudView dismiss];
         }
         if (blockFail != nil) {
             blockFail(error);
         }
     }];
    if(bHud)
    {
        [HudView showHud:@"正在卖力加载中" CancelBlock:^{
            [operation cancel];
        }];
    }
}

+ (void) deleteWithUrl:(NSString *)urlStr withParams:(NSDictionary *)params SuccessBlock:(void (^)(NSDictionary* dic))blockSucess FailBlock:(void (^)(NSError *error))blockFail ShowHud:(BOOL)bHud
{
    AFHTTPRequestOperationManager *manage=[AFHTTPRequestOperationManager manager];
    //manage.requestSerializer = [AFJSONRequestSerializer serializer];//请求
    manage.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manage.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manage.requestSerializer.timeoutInterval=20;
    [manage.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    AFHTTPRequestOperation* operation= [manage DELETE:[serverUrl stringByAppendingString:urlStr] parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         if(bHud)
         {
             [HudView dismiss];
         }
         if(blockSucess!=nil)
         {
             NSString *responseString=operation.responseString;
             NSDictionary *data = [responseString parseJson];
             blockSucess(data);
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         if(bHud)
         {
            [HudView dismiss];
         }
         if (blockFail != nil) {
             blockFail(error);
         }
     }];
    if(bHud)
    {
        [HudView showHud:@"正在卖力加载中" CancelBlock:^{
            [operation cancel];
        }];
    }
}


+ (UIViewController*)topViewController {
    return [Util topViewControllerWithRootViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
}

+ (UIViewController*)topViewControllerWithRootViewController:(UIViewController*)rootViewController {
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController* tabBarController = (UITabBarController*)rootViewController;
        return [Util topViewControllerWithRootViewController:tabBarController.selectedViewController];
    } else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController* navigationController = (UINavigationController*)rootViewController;
        return [Util topViewControllerWithRootViewController:navigationController.visibleViewController];
    } else if (rootViewController.presentedViewController) {
        UIViewController* presentedViewController = rootViewController.presentedViewController;
        return [Util topViewControllerWithRootViewController:presentedViewController];
    } else {
        return rootViewController;
    }
}

@end
