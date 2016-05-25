//
//  WASLoginButton.m
//  YueXin
//
//  Created by wangshuo on 16/5/19.
//  Copyright © 2016年 wangshuo. All rights reserved.
//

#import "WASLoginButton.h"

@implementation WASLoginButton
- (instancetype)initLoginButtonWithButtonTitle:(NSString *)buttonTitle
{
    if ( self = [super init] )
    {
        self.backgroundColor = [UIColor blackColor];
        self.alpha = 0.6;
        [self setTitle:buttonTitle forState:UIControlStateNormal];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    }
    return self;
}

@end
