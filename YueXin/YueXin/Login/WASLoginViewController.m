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
#import <MediaPlayer/MediaPlayer.h>
#import "WASLoginTextField.h"

@interface WASLoginViewController ()
@property (strong, nonatomic)  WASLoginTextField *username;
@property (strong, nonatomic)  WASLoginTextField *password;
@property (nonatomic, strong) MPMoviePlayerController *player;
@property (weak, nonatomic) IBOutlet UIView *playerView;


@end

@implementation WASLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareBackground];
    [self initUI];
    
    
    
}

- (void)initUI
{
    _username = [[WASLoginTextField alloc] initLoginTextFieldWithPlaceholder:@"Username"];
    _password = [[WASLoginTextField alloc] initLoginTextFieldWithPlaceholder:@"Password"];
    _username.bounds = CGRectMake(0, 0,kScreenW-50, 35);
    _username.center = CGPointMake(kScreenW/2, 141);
    _password.bounds = CGRectMake(0, 0,kScreenW-50, 35);
    _password.center = CGPointMake(kScreenW/2, 220);
    [self.view addSubview:_username];
    [self.view addSubview:_password];
    [_password setSecureTextEntry:YES];
    
}




#pragma mark - IBAction

- (void)registerAction:(id)sender {
    if (![self isEmpty]) {
        [self.view endEditing:YES];
        if ([self.username.text isChinese]) {
            [WASProgressHUD showError:@"用户名不能为中文"];
            return;
        }
        [[EaseMob sharedInstance].chatManager asyncRegisterNewAccount:self.username.text
                                                             password:self.password.text
                                                       withCompletion:^(NSString *username, NSString *password, EMError *error) {
            if (!error) {
                XXLog(@"注册成功");
                [WASProgressHUD showSuccess:@"注册成功"];
            }
        } onQueue:nil];
        
    }
    
}
- (void)loginAction:(id)sender {
    if (![self isEmpty]) {
        [self.view endEditing:YES];
        if ([self.username.text isChinese]) {
            [WASProgressHUD showError:@"用户名不能为中文"];
            return;
        }
        [[EaseMob sharedInstance].chatManager asyncLoginWithUsername:self.username.text
                                                            password:self.password.text
                                                          completion:^(NSDictionary *loginInfo, EMError *error) {
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

#pragma mark - Init UI

//设置视频背景
- (void)prepareBackground
{
    NSString *moviePath = [[NSBundle mainBundle] pathForResource:@"onboarding-loop" ofType:@"mp4"];
    NSURL *movieURL = [NSURL fileURLWithPath:moviePath];
    _player =[[MPMoviePlayerController alloc] initWithContentURL: movieURL];
    [_player prepareToPlay];
    [_player.view setFrame: self.view.bounds];
    [self.playerView addSubview: _player.view];
    _player.scalingMode = MPMovieScalingModeAspectFill;
    _player.controlStyle = MPMovieControlStyleNone;
    _player.repeatMode = MPMovieRepeatModeOne;
    [_player play];
    
    //背景层
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.alpha = 0.3;
    imgView.backgroundColor = [UIColor blackColor];
    imgView.frame = self.view.bounds;
    imgView.userInteractionEnabled = YES;
    [self.playerView addSubview:imgView];
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


-(BOOL)prefersStatusBarHidden
{
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
