//
//  WASProgressHUD.h
//  YueXin
//
//  Created by wangshuo on 15/12/24.
//  Copyright © 2015年 wangshuo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SVProgressHUD.h"

@interface WASProgressHUD : NSObject
+(void)showLoading;

+(void)showLoadingString:(NSString *)aString;

+(void)showNetWorkError;

+(void)showSuccess:(NSString *)str;

+(void)showError:(NSString *)str;

+(void)showSystemCrach;

+(void)showWarn:(NSString *)str;

//+(void)showError:(NSError *)error;

+(void)showWait;

+(void)dismiss;

+ (void)showNoneBlockWait;
@end
