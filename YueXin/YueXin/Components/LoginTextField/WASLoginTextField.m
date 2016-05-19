//
//  WASLoginTextField.m
//  YueXin
//
//  Created by wangshuo on 16/5/19.
//  Copyright © 2016年 wangshuo. All rights reserved.
//

#import "WASLoginTextField.h"

@implementation WASLoginTextField


- (instancetype)initLoginTextFieldWithPlaceholder:(NSString *)placeholder
{
    if ( self = [super init] )
    {
        self.backgroundColor = [UIColor grayColor];
        self.alpha = 0.8;
        self.borderStyle = UITextBorderStyleRoundedRect;
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
        NSMutableAttributedString *attString=[[NSMutableAttributedString alloc] initWithString:placeholder];
        NSInteger stringLength=[placeholder length];
        UIColor *red=[UIColor whiteColor];
        [attString addAttribute:NSForegroundColorAttributeName value:red range:NSMakeRange(0, stringLength)];
        self.attributedPlaceholder = attString;
        self.tintColor = [UIColor whiteColor];
    }
    return self;
}

@end
