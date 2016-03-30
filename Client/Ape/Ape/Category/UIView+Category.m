//
//  UIView+Category.m
//  VeryZhunInsider
//
//  Created by Cain Goodbye on 13-10-17.
//  Copyright (c) 2013年 Cain Goodbye. All rights reserved.
//

#import "UIView+Category.h"
#import <objc/runtime.h>
#import "UIFont+Category.h"
static char charAdaptFont;
@implementation UIView (Category)
- (CGFloat)left
{
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)top
{
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)right
{
    return self.left + self.width;
}

- (void)setRight:(CGFloat)right
{
    if(right == self.right){
        return;
    }
    
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottom
{
    return self.top + self.height;
}

- (void)setBottom:(CGFloat)bottom {
    if(bottom == self.bottom){
        return;
    }
    
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}


- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height
{
    if(height == self.height){
        return;
    }
    
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGFloat)centerX
{
    return self.center.x;
}


- (void)setCenterX:(CGFloat)centerX
{
    self.center = CGPointMake(centerX, self.center.y);
}


- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY
{
    self.center = CGPointMake(self.center.x, centerY);
}

- (UIView*)descendantOrSelfWithClass:(Class) cls
{
    if ([self isKindOfClass:cls])
        return self;
    
    for (UIView* child in self.subviews) {
        UIView* it = [child descendantOrSelfWithClass:cls];
        if (it)
            return it;
    }
    
    return nil;
}

- (UIViewController*)viewController
{
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

- (UINavigationController *)navigationController
{
    return self.viewController.navigationController;
}

- (void)resizeToPrecent:(float) precent
{
    CGRect bounds = self.bounds;
    bounds.size.width *= precent;
    bounds.size.height *= precent;
    self.bounds = bounds;
}

- (void)removeAllSubviews
{
    for (UIView *v in self.subviews) {
        [v removeFromSuperview];
    }
}

-(UIImage*)imageCache
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size,NO,[[UIScreen mainScreen] scale]);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage*img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

-(void)setBAdaptFont:(BOOL)bAdaptFont
{
    UIFont *font;
    if([self isKindOfClass:[UIButton class]])
    {
        font=((UIButton*)self).titleLabel.font;
    }
    else if([self isKindOfClass:[UILabel class]] || [self isKindOfClass:[UITextView class]] || [self isKindOfClass:[UITextField class]])
    {
        font=[font valueForKey:@"font"];
    }
    else
    {
        return;
    }
    objc_setAssociatedObject(self, &charAdaptFont, @(bAdaptFont), OBJC_ASSOCIATION_RETAIN);
    if(bAdaptFont)
    {
        font=[font adaptDeviceWith4_7inchOfFontSize];
        if([self isKindOfClass:[UIButton class]])
        {
            ((UIButton*)self).titleLabel.font=font;
        }
        else if([self isKindOfClass:[UILabel class]] || [self isKindOfClass:[UITextView class]] || [self isKindOfClass:[UITextField class]])
        {
            [self setValue:font forKey:@"font"];
        }
    }
    else
    {
        return;
    }
    
}

-(BOOL)bAdaptFont
{
    return [((NSNumber*)objc_getAssociatedObject(self, &charAdaptFont)) boolValue];
}
@end









