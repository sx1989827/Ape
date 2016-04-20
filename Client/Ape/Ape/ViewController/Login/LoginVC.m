//
//  LoginVC.m
//  Ape
//
//  Created by Geminy on 16/3/29.
//  Copyright © 2016年 Geminy. All rights reserved.
//

#import "LoginVC.h"
#import "ZYTextField.h"
#import "Util.h"
#import "Define.h"
#import "UIColor+Category.h"
#import "UINavigationController+Category.h"
#import "SetGestureCodeVC.h"
#import "UIImage+Extention.h"
#import "UIViewController+Category.h"
#import "LoginVM.h"
#import "UserDefaults.h"
#import "Reactivecocoa.h"
#import "SVProgressHUD.h"

typedef enum : NSUInteger {
    TFPhoneNum = 101,
    TFNickname,
    TFInviCode
} TFType;

@interface LoginVC ()
@property (weak, nonatomic) IBOutlet ZYTextField *phoneTextF;
@property (weak, nonatomic) IBOutlet ZYTextField *nameTextF;
@property (weak, nonatomic) IBOutlet ZYTextField *inviteCodeTextF;
@property (weak, nonatomic) IBOutlet UITextField *questionTextF;
@property (weak, nonatomic) IBOutlet UITextField *answerTextF;
@property (strong, nonatomic) LoginVM *vm;
@property (strong, nonatomic) NSString *phone;
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;
@end

@implementation LoginVC

#pragma mark - life
- (void)viewDidLoad {
    [super viewDidLoad];

    [self initNavigationBar];
    _submitBtn.enabled = NO;
    [_submitBtn setBackgroundImage:[UIImage imageWithColor:kGlobalColor] forState:UIControlStateNormal];
    [_submitBtn setBackgroundImage:[UIImage imageWithColor:kGrayColor] forState:UIControlStateDisabled];

    RAC(self.submitBtn, enabled) = \
    [RACSignal combineLatest:@[
                               self.phoneTextF.rac_textSignal,
                               self.nameTextF.rac_textSignal,
                               self.inviteCodeTextF.rac_textSignal,
                               self.questionTextF.rac_textSignal,
                               self.answerTextF.rac_textSignal
                               ]
                      reduce:^(NSString *phone, NSString *name, NSString *inviteCode, NSString *question, NSString *answer) {
//                         return @(phone.length == 11 && name.length > 0 && inviteCode.length == 6 && question.length > 0 && answer.length > 0);
                          return @1;
                    }];
}

- (void)initNavigationBar
{
    self.title = @"注册";
    self.bHideNavigationBottomLine = YES;
}

#pragma mark - button action
- (IBAction)clickSubmit:(UIButton *)sender {

    User *userInfo = USERDEFAULTS.userInfo;
    userInfo.phone = _phone;

    self.bHud = YES;
    [_vm verifyPhoneHasRegistered:_phone responseBlock:^(NSString *msg, id data) {
        self.bHud = NO;
        if (data == 0) {
            NSLog(@"该号码已经注册过");
            return ;
        }
        [UserDefaults saveUserInfo:userInfo];
        [self pushViewController:@"SetGestureCodeVC" Param:nil];
    }];
}

- (IBAction)helpBtnClick:(id)sender {
    UIAlertController *alertCon = [UIAlertController alertControllerWithTitle:@"" message:@"通过唯一的邀请码才能注册,您可以从您身边的朋友中获得" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAct = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:nil];
    [alertCon addAction:okAct];
    [self presentViewController:alertCon animated:YES completion:nil];
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
    switch (sender.tag) {
        case TFPhoneNum:
        {
            [self tfCheck:[Util checkMoblieNumber:sender.text]
            WithTextField:sender];
        }
            break;
        case TFNickname:
        {
            if (sender.text.length > 0) {
                [self tfCheck:YES WithTextField:sender];
            } else {
                [self tfCheck:NO WithTextField:sender];
            }
        }
            break;
        case TFInviCode:
        {
            if (sender.text.length == 6) {
                [self tfCheck:YES WithTextField:sender];
            } else {
                [self tfCheck:NO WithTextField:sender];
            }
        }
            break;
    }
}

#pragma mark private
- (void)tfCheck:(BOOL)check WithTextField:(UITextField *)textf
{
    ZYTextField *tf = (ZYTextField *)textf;

    if (check == YES) {
        [tf setLineColor:kGrayColor];
        _phone = tf.text;
    } else {
        [tf setLineColor:[UIColor redColor]];
    }
}

@end
