//
//  UserDefaults.h
//  
//
//  Created by Geminy on 16/4/19.
//
//

#import <Foundation/Foundation.h>
#import "User.h"

#define USERDEFAULTS [UserDefaults sharedInstance]

@interface UserDefaults : NSObject

+ (instancetype)sharedInstance;

+ (void)saveUserInfo:(User *)model;

- (BOOL)isAvailable;

@property(nonatomic,strong)User * userInfo;

@end