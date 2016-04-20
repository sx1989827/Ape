//
//  User.h
//  Ape
//
//  Created by Geminy on 16/4/19.
//  Copyright © 2016年 Geminy. All rights reserved.
//

#import <JSONModel.h>

@interface User : JSONModel
/**用户ID */
@property (copy, nonatomic) NSString <Optional> *id;
/**电话*/
@property (copy, nonatomic) NSString <Optional> *phone;

@end
