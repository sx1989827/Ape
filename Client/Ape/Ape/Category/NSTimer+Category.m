//
//  HorseRiding
//
//  Created by 孙昕 on 16/2/2.
//  Copyright © 2016年 孙昕. All rights reserved.
//

#import "NSTimer+Category.h"

@implementation NSTimer(Addtion)
-(void)pause
{
    if (![self isValid])
    {
        return ;
    }
    [self setFireDate:[NSDate distantFuture]];
}


-(void)resume
{
    if (![self isValid])
    {
        return ;
    }
    [self setFireDate:[NSDate date]];
}
@end
