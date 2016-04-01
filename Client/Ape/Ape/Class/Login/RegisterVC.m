//
//  RegisterVC.m
//  Ape
//
//  Created by Geminy on 16/3/29.
//  Copyright © 2016年 Geminy. All rights reserved.
//

#import "RegisterVC.h"
#import "ZYTextField.h"
#import "Util.h"
#import "Define.h"
#import "UIColor+Category.h"
#import "UINavigationController+Category.h"
#import "SetGestureCodeVC.h"
#import "UIViewController+Category.h"
#import "LoginVM.h"

typedef enum : NSUInteger {
    TFPhoneNum = 101,
    TFNickname,
    TFInviCode
} TFType;

@interface RegisterVC ()
@property (strong, nonatomic) LoginVM *vm;
@property (strong, nonatomic) NSString *phone;
@end

@implementation RegisterVC

#pragma mark - life
- (void)viewDidLoad {
    [super viewDidLoad];

    [self initNavigationBar];
}

- (void)initNavigationBar
{
    self.bHideNavigationBottomLine = YES;
}

#pragma mark - button action
- (IBAction)clickSubmit:(UIButton *)sender {

    [_vm verifyPhoneHasRegistered:_phone responseBlock:^(NSString *msg, id data) {
        if (data == 0) {
            NSLog(@"该号码已经注册过");
            return ;
        }
    }];
    [self pushViewController:@"SetGestureCodeVC" Param:nil];
}


#pragma mark - text field action
- (IBAction)textFieldDidChanged:(UITextField *)sender {

    if (sender.tag == TFPhoneNum) {
        if (sender.text.length > 11) {
            sender.text = [sender.text substringToIndex:11];
        }
    }
    if (sender.tag == TFInviCode) {
        if (sender.text.length > 6) {
            sender.text = [sender.text substringToIndex:6];
        }
    }
}

- (IBAction)textFieldEditingDidEnd:(UITextField *)sender {
    [self checkTFContentWithTextField:sender];
}

#pragma mark private
- (void)checkTFContentWithTextField:(UITextField *)textf
{
    switch (textf.tag) {
        case TFPhoneNum:
        {
            [self tfCheck:[Util checkMoblieNumber:textf.text]
            WithTextField:textf];
        }
            break;
        case TFNickname:
        {
            if (textf.text.length > 0) {
                [self tfCheck:YES WithTextField:textf];
            } else {
                [self tfCheck:NO WithTextField:textf];
            }
        }
            break;
        case TFInviCode:
        {
            if (textf.text.length == 6) {
                [self tfCheck:YES WithTextField:textf];
            } else {
                [self tfCheck:NO WithTextField:textf];
            }
        }
            break;
    }
}

- (void)tfCheck:(BOOL)check WithTextField:(UITextField *)textf
{
    ZYTextField *tf = (ZYTextField *)textf;

    if (check == YES) {
        [tf setLineColor:kColor(73, 190, 53)];
        _phone = tf.text;
    } else {
        [tf setLineColor:[UIColor redColor]];
    }
}

@end
