//
//  WASLoginViewController.m
//  YueXin
//
//  Created by wangshuo on 15/12/23.
//  Copyright © 2015年 wangshuo. All rights reserved.
//

#import "WASLoginViewController.h"
#import "WASProgressHUD.h"

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
    [WASProgressHUD showSuccess:@"注册成功"];

//    [[EaseMob sharedInstance].chatManager asyncRegisterNewAccount:self.username.text password:self.password.text withCompletion:^(NSString *username, NSString *password, EMError *error) {
//        if (!error) {
//            XXLog(@"注册成功");
//            [WASProgressHUD showSuccess:@"注册成功"];
//            
//        }
//    } onQueue:nil];
    
}
- (IBAction)loginAction:(id)sender {
    [[EaseMob sharedInstance].chatManager asyncLoginWithUsername:self.username.text password:self.password.text completion:^(NSDictionary *loginInfo, EMError *error) {
        if (!error && loginInfo) {
            NSLog(@"登陆成功");
        }
    } onQueue:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
