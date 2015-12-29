//
//  NSString+Valid.m
//  YueXin
//
//  Created by wangshuo on 15/12/29.
//  Copyright © 2015年 wangshuo. All rights reserved.
//

#import "NSString+Valid.h"

@implementation NSString (Valid)
- (BOOL)isChinese
{
    NSString *match = @"(^[\u4e00-\u9fa5]+$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    return [predicate evaluateWithObject:self];
}
@end
