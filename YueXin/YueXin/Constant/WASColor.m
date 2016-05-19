//
//  WASColor.m
//  YueXin
//
//  Created by wangshuo on 16/4/27.
//  Copyright © 2016年 wangshuo. All rights reserved.
//

#import "WASColor.h"

@implementation WASColor

+(UIColor *)loginOutRedbackgroundColor
{
    UIColor *color = [self transformHexadecimalTodecimalism:@"#F6534D" andClear:1.0];
    return color;
}

+(UIColor *)transformHexadecimalTodecimalism:(NSString *)str andClear:(CGFloat)clear {
    if (str.length == 7) {
        //验证长度
        NSString *subStr = [str substringWithRange:NSMakeRange(1, 6)];
        NSInteger R = strtoul([[subStr substringWithRange:NSMakeRange(0, 2)] UTF8String], 0, 16);
        NSInteger G = strtoul([[subStr substringWithRange:NSMakeRange(2, 2)] UTF8String], 0, 16);
        NSInteger B = strtoul([[subStr substringWithRange:NSMakeRange(4, 2)] UTF8String], 0, 16);
        UIColor *color = WASColor(R, G, B, clear);
        return color;
    }else {
        return nil;
    }
}
@end
