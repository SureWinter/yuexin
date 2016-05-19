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

@interface WASLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (nonatomic, strong) MPMoviePlayerController *player;
@property (weak, nonatomic) IBOutlet UIView *playerView;


@end

@implementation WASLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareBackground];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//设置视频背景
- (void)prepareBackground
{
    //获取本地影片路径
    NSString *moviePath = [[NSBundle mainBundle] pathForResource:@"onboarding-loop" ofType:@"mp4"];
    NSURL *movieURL = [NSURL fileURLWithPath:moviePath];
    //创建播放器
    _player =
    [[MPMoviePlayerController alloc] initWithContentURL: movieURL];
    [_player prepareToPlay];
    
    //设置播放器frame大小为屏幕大小
    [_player.view setFrame: self.view.bounds];  // player's frame must match parent's
    [self.playerView addSubview: _player.view];
    
    //设置播放器模式为全屏拉伸模式
    _player.scalingMode = MPMovieScalingModeAspectFill;
    
    //无播放控制器
    _player.controlStyle = MPMovieControlStyleNone;
    
    //循环播放
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

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
//    return UIStatusBarStyleDefault;
}


-(BOOL)prefersStatusBarHidden
{
    return NO;
}

@end
