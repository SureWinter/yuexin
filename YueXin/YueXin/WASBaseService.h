//
//  WASBaseService.h
//  YueXin
//
//  Created by wangshuo on 15/12/29.
//  Copyright © 2015年 wangshuo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WASBaseService : NSObject
+(instancetype)shareService;
- (BOOL)isUserLogin;
@end
