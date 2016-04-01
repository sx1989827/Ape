//
//  LoginVM.m
//  Ape
//
//  Created by Geminy on 16/3/30.
//  Copyright © 2016年 Geminy. All rights reserved.
//

#import "LoginVM.h"

@implementation LoginVM

- (void)verifyPhoneHasRegistered:(NSString *)phone responseBlock:(void (^)(NSString *, id))responseBlock
{
    [LoginReq do:^(id req) {
        LoginReq *q = req;
        q.phone = phone;
    } Res:^(id res) {
        LoginRes *s = res;
        responseBlock(s.msg, s.data);
    } ShowHud:NO];
}

@end
