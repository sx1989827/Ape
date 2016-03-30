//
//  2r3.m
//  HorseRiding
//
//  Created by 孙昕 on 16/2/3.
//  Copyright © 2016年 孙昕. All rights reserved.
//

#import "NSObject+Category.h"

@implementation NSObject(Addition)
- (void)performBlock:(void (^)(void))block
          afterDelay:(NSTimeInterval)delay
{
    [self performSelector:@selector(fireBlockAfterDelay:)
               withObject:block
               afterDelay:delay];
}

- (void)fireBlockAfterDelay:(void (^)(void))block {
    block();
}
@end
