//
//  define.h
//  YueXin
//
//  Created by wangshuo on 15/12/23.
//  Copyright © 2015年 wangshuo. All rights reserved.
//

#ifndef define_h
#define define_h
#endif /* define_h */

#import "EaseMob.h"
#import "WASColor.h"


// RGB颜色
#define WASColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

// 随机色
#define WASRandomColor WASColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), 1.0)
#ifdef DEBUG// 如果有DEBUG这个宏就编译下面一句代码
#define XXLog(...) NSLog(__VA_ARGS__)
#else // 如果没有DEBUG这个宏就编译下面一句代码
#define XXLog(...)
#endif