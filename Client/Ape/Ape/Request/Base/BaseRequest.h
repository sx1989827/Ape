//
//  BaseRequest.h
//  Ape
//
//  Created by Geminy on 16/3/29.
//  Copyright © 2016年 Geminy. All rights reserved.
//

#import <JSONModel/JSONModel.h>
@protocol GET
@end
@protocol POST
@end
@protocol PUT
@end
@protocol DELETE
@end
@interface BaseRequest : JSONModel
@property (strong,nonatomic) NSString *url;
+(void)do:(void (^)(id req))reqBlock Res:(void (^)(id res))resBlock ShowHud:(BOOL)bHud;
@end

@interface BaseResponse : JSONModel
@property (assign,nonatomic) NSInteger  code;
@property (strong,nonatomic) NSString<Optional> *msg;
@end