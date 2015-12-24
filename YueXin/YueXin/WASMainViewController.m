//
//  WASMainViewController.m
//  YueXin
//
//  Created by wangshuo on 15/12/23.
//  Copyright © 2015年 wangshuo. All rights reserved.
//

#import "WASMainViewController.h"
#import "WASNaviViewController.h"
#import "WASHomeViewController.h"
#import "WASMessageCenterViewController.h"
#import "WASDiscoverViewController.h"
#import "WASProfileViewController.h"

@interface WASMainViewController ()

@end

@implementation WASMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.初始化子控制器
    WASHomeViewController *home = [[WASHomeViewController alloc] init];
    [self addChildVc:home title:@"首页" image:@"match" selectedImage:@"matchSt"];
    
    WASMessageCenterViewController *messageCenter = [[WASMessageCenterViewController alloc] init];
    [self addChildVc:messageCenter title:@"消息" image:@"message" selectedImage:@"messageSt"];
    
    WASDiscoverViewController *discover = [[WASDiscoverViewController alloc] init];
    [self addChildVc:discover title:@"发现" image:@"found" selectedImage:@"foundSt"];
    
    WASProfileViewController *profile = [[WASProfileViewController alloc] init];
    [self addChildVc:profile title:@"我" image:@"me" selectedImage:@"meSt"];
}

/**
 *  添加一个子控制器
 *
 *  @param childVc       子控制器
 *  @param title         标题
 *  @param image         图片
 *  @param selectedImage 选中的图片
 */
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字
//    childVc.title = title; // 同时设置tabbar和navigationBar的文字
    //    childVc.tabBarItem.title = title; // 设置tabbar的文字
        childVc.navigationItem.title = title; // 设置navigationBar的文字
    
    // 设置子控制器的图片
    childVc.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    childVc.tabBarItem.image = [UIImage imageNamed:image];;
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    // 设置文字的样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    childVc.view.backgroundColor = WASRandomColor;
    
    // 先给外面传进来的小控制器 包装 一个导航控制器
    WASNaviViewController *nav = [[WASNaviViewController alloc] initWithRootViewController:childVc];
    // 添加为子控制器
    [self addChildViewController:nav];
}

@end
