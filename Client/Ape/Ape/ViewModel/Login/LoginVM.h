//
//  LoginVM.h
//  Ape
//
//  Created by Geminy on 16/3/30.
//  Copyright © 2016年 Geminy. All rights reserved.
//

#import "BaseVM.h"
#import "LoginReq.h"

@interface LoginVM : BaseVM

/**检查号码是否已注册*/
- (void)verifyPhoneHasRegistered:(NSString *)phone responseBlock:(void(^)(NSString *, id))responseBlock;

@end
