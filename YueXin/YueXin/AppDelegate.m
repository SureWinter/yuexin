//
//  AppDelegate.m
//  YueXin
//
//  Created by wangshuo on 15/12/23.
//  Copyright © 2015年 wangshuo. All rights reserved.
//

#import "AppDelegate.h"
#import "WASMainViewController.h"
#import "WASLoginViewController.h"
#import "EaseMob.h"
@interface AppDelegate ()<EMChatManagerDelegate>
@property (nonatomic,strong) WASMainViewController  *mainController;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[EaseMob sharedInstance] registerSDKWithAppKey:@"yuemaios#yuema" apnsCertName:@"istore_dev"];
    [[EaseMob sharedInstance] application:application didFinishLaunchingWithOptions:launchOptions];
    
    [[EaseMob sharedInstance].chatManager addDelegate:self delegateQueue:nil];

    // 1.创建窗口
    self.window = [[UIWindow alloc] init];
    self.window.frame = [UIScreen mainScreen].bounds;
    
    
    UINavigationController *navigationController = nil;
    BOOL isAutoLogin = [[[EaseMob sharedInstance] chatManager] isAutoLoginEnabled];
    
    if (isAutoLogin) {//登陆成功加载主窗口控制器
        if (self.mainController == nil) {
            self.mainController = [[WASMainViewController alloc] init];
            navigationController = [[UINavigationController alloc] initWithRootViewController:self.mainController];
        }else{
            navigationController  = self.mainController.navigationController;
        }
    }
    else{//登陆失败加载登陆页面控制器
        self.mainController = nil;
        WASLoginViewController *loginController = [[WASLoginViewController alloc] init];
        navigationController = [[UINavigationController alloc] initWithRootViewController:loginController];
    }
    
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

/*!
 @method
 @brief 用户将要进行自动登录操作的回调
 @discussion
 @param loginInfo 登录的用户信息
 @param error     错误信息
 @result
 */
- (void)willAutoLoginWithInfo:(NSDictionary *)loginInfo error:(EMError *)error
{
    XXLog(@"%@",loginInfo);
    
}

/*!
 @method
 @brief 用户自动登录完成后的回调
 @discussion
 @param loginInfo 登录的用户信息
 @param error     错误信息
 @result
 */
- (void)didAutoLoginWithInfo:(NSDictionary *)loginInfo error:(EMError *)error{
    XXLog(@"%@",loginInfo);

}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    [[EaseMob sharedInstance] applicationDidEnterBackground:application];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
     [[EaseMob sharedInstance] applicationWillEnterForeground:application];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [[EaseMob sharedInstance] applicationWillTerminate:application];
}

@end
