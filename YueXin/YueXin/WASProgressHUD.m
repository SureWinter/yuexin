//
//  WASProgressHUD.m
//  YueXin
//
//  Created by wangshuo on 15/12/24.
//  Copyright © 2015年 wangshuo. All rights reserved.
//

#import "WASProgressHUD.h"


@implementation WASProgressHUD
+(void)showLoading
{
    [SVProgressHUD showWithStatus:@"载入中"];
}
+(void)showLoadingString:(NSString *)aString
{
    [SVProgressHUD showWithStatus:aString];
}
+(void)showNetWorkError
{
    [SVProgressHUD showImage:[UIImage imageNamed:@"netError.png"] status:@"网络无法连接"];
}

+(void)showSuccess:(NSString *)str
{
    [SVProgressHUD setBackgroundColor:[UIColor lightGrayColor]];
    [SVProgressHUD showImage:[UIImage imageNamed:@"successHint.png"] status:str];
}

+(void)showError:(NSString *)str
{
    [SVProgressHUD showImage:[UIImage imageNamed:@"failHint.png"] status:str];
}

+(void)showSystemCrach
{
    [SVProgressHUD showImage:[UIImage imageNamed:@"failHint.png"] status:@"系统发生崩溃啦"];
}

+(void)showWarn:(NSString *)str
{
    [SVProgressHUD showImage:[UIImage imageNamed:@"warnHint.png"] status:str];
}

//+(void)showError:(NSError *)error
//{
//    switch(error.errorType){
//        case MSErrorNoNetwork:{
//            [[self class] showNetWorkErrorToast];
//        }
//            break;
//            
//        case MSErrorCannotConnectToServer:
//        {
//            [SVProgressHUD showImage:[UIImage imageNamed:@"failHint.png"] status:@"网络连接不稳定\n请稍后再试"];
//        }
//            break;
//        case MSErrorServerError:
//        case MSErrorAppError:{
//            [SVProgressHUD showImage:[UIImage imageNamed:@"failHint.png"] status:@"访问异常\n请稍后重试"];
//        }
//            break;
//        default:{
//            [SVProgressHUD showImage:[UIImage imageNamed:@"failHint.png"] status:error.rtMessage];
//        }
//            break;
//    }
//    
//}
+(void)showWait
{
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeClear];
}
+(void)dismiss
{
    [SVProgressHUD dismiss];
}

+ (void)showNoneBlockWait{
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeNone];
}

@end
