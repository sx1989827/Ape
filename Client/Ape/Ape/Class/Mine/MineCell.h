//
//  MineCell.h
//  Ape
//
//  Created by Geminy on 16/3/31.
//  Copyright © 2016年 Geminy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <LazyTableCell.h>

@interface MineCell : LazyTableCell

@property (strong, nonatomic) NSString *imgName;
@property (strong, nonatomic) NSString *title;
- (void)showIndicator;
@end




