//
//  WASBaseService.m
//  YueXin
//
//  Created by wangshuo on 15/12/29.
//  Copyright © 2015年 wangshuo. All rights reserved.
//

#import "WASBaseService.h"

@implementation WASBaseService
+(instancetype)shareService
{
    static WASBaseService *baseService;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        baseService = [[WASBaseService alloc] init];
    });
    return baseService;
}


-(BOOL)isUserLogin
{
    BOOL b = NO;
    if ([[EaseMob sharedInstance].chatManager isLoggedIn]&&[[EaseMob sharedInstance].chatManager loginInfo]) {
        b = YES;
    }
    return b;
}
@end
