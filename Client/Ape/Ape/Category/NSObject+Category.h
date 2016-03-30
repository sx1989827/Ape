//
//  2r3.h
//  HorseRiding
//
//  Created by 孙昕 on 16/2/3.
//  Copyright © 2016年 孙昕. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject(Addition)
- (void)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay;
@end
