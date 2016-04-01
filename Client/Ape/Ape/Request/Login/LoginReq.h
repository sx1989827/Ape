//
//  LoginReq.h
//  Ape
//
//  Created by Geminy on 16/3/30.
//  Copyright © 2016年 Geminy. All rights reserved.
//

#import "BaseRequest.h"

@interface LoginReq : BaseRequest<GET>
@property (strong, nonatomic) NSString *phone;

@end

@interface LoginRes : BaseResponse
@property (strong, nonatomic) id data;
@end