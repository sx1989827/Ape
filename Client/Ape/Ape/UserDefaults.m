//
//  UserDefaults.m
//  
//
//  Created by Geminy on 16/4/19.
//
//

#import "UserDefaults.h"

@implementation UserDefaults

+ (instancetype)sharedInstance
{
    static UserDefaults *userDefaults = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        userDefaults = [[[self class] alloc] init];
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        NSData *data = [user objectForKey:@"userModel"];
        if(data)
        {
            User *res = [NSKeyedUnarchiver unarchiveObjectWithData:data];
            userDefaults.userInfo = res;
        }
    });
    return userDefaults;
}

+ (void)saveUserInfo:(User *)model
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    if(model != nil)
    {
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:model];

        [user setObject:data forKey:@"userModel"];
    }
    else
    {
        [user removeObjectForKey:@"userModel"];
    }
    [user synchronize];
    [UserDefaults sharedInstance].userInfo = model;
}

- (BOOL)isAvailable
{
    return [UserDefaults sharedInstance].userInfo != nil;
}


@end
