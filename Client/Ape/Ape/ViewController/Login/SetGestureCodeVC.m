//
//  SetGestureCodeVC.m
//  Ape
//
//  Created by Geminy on 16/3/29.
//  Copyright © 2016年 Geminy. All rights reserved.
//

#import "SetGestureCodeVC.h"
#import <DBGuestureLock.h>

@interface SetGestureCodeVC ()

@end

@implementation SetGestureCodeVC

- (void)viewDidLoad {
    [super viewDidLoad];

    [DBGuestureLock clearGuestureLockPassword];

    DBGuestureLock *lock = [DBGuestureLock lockOnView:self.view onPasswordSet:^(DBGuestureLock *lock, NSString *password) {
        if (lock.firstTimeSetupPassword == nil) {
            lock.firstTimeSetupPassword = password;
            NSLog(@"varify your password:%@",password);
        }
    } onGetCorrectPswd:^(DBGuestureLock *lock, NSString *password) {
        if (lock.firstTimeSetupPassword && ![lock.firstTimeSetupPassword isEqualToString:DBFirstTimeSetupPassword]) {
            lock.firstTimeSetupPassword = DBFirstTimeSetupPassword;
            NSLog(@"password has been setup!:%@",password);
        } else {
            NSLog(@"login success");
        }
    } onGetIncorrectPswd:^(DBGuestureLock *lock, NSString *password) {
        if (![lock.firstTimeSetupPassword isEqualToString:DBFirstTimeSetupPassword]) {
            NSLog(@"Error: password not equal to first setup!:%@",password);
        } else {
            NSLog(@"login failed");
        }
    }];
    [self.view addSubview:lock];
    [self.view setBackgroundColor:[UIColor colorWithRed:0.133 green:0.596 blue:0.933 alpha:1.00]];
}

@end
