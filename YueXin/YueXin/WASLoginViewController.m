//
//  WASLoginViewController.m
//  YueXin
//
//  Created by wangshuo on 15/12/23.
//  Copyright © 2015年 wangshuo. All rights reserved.
//

#import "WASLoginViewController.h"
#import "WASProgressHUD.h"
#import "NSString+Valid.h"

@interface WASLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation WASLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)registerAction:(id)sender {
    if (![self isEmpty]) {
        [self.view endEditing:YES];
        if ([self.username.text isChinese]) {

            [WASProgressHUD showError:@"用户名不能为中文"];
            
            return;
        }
        
        [[EaseMob sharedInstance].chatManager asyncRegisterNewAccount:self.username.text password:self.password.text withCompletion:^(NSString *username, NSString *password, EMError *error) {
            if (!error) {
                XXLog(@"注册成功");
                [WASProgressHUD showSuccess:@"注册成功"];
                
            }
        } onQueue:nil];
        
    }
    
}
- (IBAction)loginAction:(id)sender {
    if (![self isEmpty]) {
        [self.view endEditing:YES];
        if ([self.username.text isChinese]) {
            
            [WASProgressHUD showError:@"用户名不能为中文"];
            
            return;
        }
        [[EaseMob sharedInstance].chatManager asyncLoginWithUsername:self.username.text password:self.password.text completion:^(NSDictionary *loginInfo, EMError *error) {
            if (!error && loginInfo) {
                NSLog(@"登陆成功");
                    // 设置自动登录
                    [[EaseMob sharedInstance].chatManager setIsAutoLoginEnabled:YES];
                
            }
        } onQueue:nil];
    }
}

//判断账号和密码是否为空
- (BOOL)isEmpty{
    BOOL ret = NO;
    NSString *username = self.username.text;
    NSString *password = self.password.text;
    if (username.length == 0 || password.length == 0) {
        ret = YES;
        [WASProgressHUD showError:@"账号密码不能为空"];
    }
    
    return ret;
}

@end
