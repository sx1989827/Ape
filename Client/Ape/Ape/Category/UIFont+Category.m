//
//  qwd.m
//  HorseRiding
//
//  Created by 孙昕 on 16/2/3.
//  Copyright © 2016年 孙昕. All rights reserved.
//

#import "UIFont+Category.h"
#import "Define.h"

@implementation UIFont(Addition)
-(UIFont *)adaptDeviceWith4_7inchOfFontSize
{
    if (IPHONE_4 || IPHONE_5) {
        return [UIFont fontWithName:self.fontName size:self.pointSize/375.0*320.0];
    } else if (IPHONE_6P){
        return [UIFont fontWithName:self.fontName size:self.pointSize/375.0*414.0];
    } else {
        return self;
    }
}

-(UIFont *)boldAdaptDeviceWith4_7inchOfFontSize
{
    if (IPHONE_4) {
        return [UIFont boldSystemFontOfSize:(self.pointSize/4.7*3.5)];
    } else if (IPHONE_5){
        return [UIFont boldSystemFontOfSize:(self.pointSize/4.7*4)];
    } else {
        return [UIFont boldSystemFontOfSize:self.pointSize];
    }
}

@end
