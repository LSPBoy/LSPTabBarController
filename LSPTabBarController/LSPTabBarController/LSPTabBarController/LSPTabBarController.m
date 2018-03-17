//
//  LSPTabBarController.m
//  LSPTabBarController
//
//  Created by Object on 2018/3/17.
//  Copyright © 2018年 lsp. All rights reserved.
//

#import "LSPTabBarController.h"
#import "LSPTabBar.h"
#import "LSPHomeViewController.h"
#import "LSPMessageViewController.h"
#import "LSPDiscoverViewController.h"
#import "LSPMeViewController.h"

@interface LSPTabBarController ()<LSPTabBarDelegate>

/**
 *  自定义的tabbar
 */
@property (nonatomic, weak) LSPTabBar *customTabBar;

@end

@implementation LSPTabBarController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 删除系统自动生成的UITabBarButton
    NSLog(@"++++%@",self.tabBar.subviews);
    
   
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupTabbar];
    
    // 初始化所有的子控制器
    [self setupAllChildViewControllers];
    
}

/**
 *  初始化tabbar
 */
- (void)setupTabbar
{
    LSPTabBar *customTabBar = [[LSPTabBar alloc] init];
    customTabBar.frame = self.tabBar.bounds;
    customTabBar.delegate = self;
    [self.tabBar addSubview:customTabBar];
    self.customTabBar = customTabBar;
}

/**
 *  监听tabbar按钮的改变
 *  @param from   原来选中的位置
 *  @param to     最新选中的位置
 */
- (void)tabBar:(LSPTabBar *)tabBar didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to
{
    self.selectedIndex = to;
}
#pragma mark - 中间按钮点击
- (void)tabBar:(LSPTabBar *)tabBar didSelectCenterButton:(UIButton *)centerBtn
{
    NSLog(@"点击了中间按钮");
}

/**
 *  初始化所有的子控制器
 */
- (void)setupAllChildViewControllers
{
    // 1.首页
    LSPHomeViewController *home = [[LSPHomeViewController alloc] init];
    [self setupChildViewController:home title:@"首页" imageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected"];
    
    // 2.消息
    LSPMessageViewController *message = [[LSPMessageViewController alloc] init];
    [self setupChildViewController:message title:@"消息" imageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected"];
    
    // 3.广场
    LSPDiscoverViewController *discover = [[LSPDiscoverViewController alloc] init];
    [self setupChildViewController:discover title:@"广场" imageName:@"tabbar_discover" selectedImageName:@"tabbar_discover_selected"];
    
    // 4.我
    LSPMeViewController *me = [[LSPMeViewController alloc] init];
    [self setupChildViewController:me title:@"我" imageName:@"tabbar_profile" selectedImageName:@"tabbar_profile_selected"];
}

/**
 *  初始化一个子控制器
 *
 *  @param childVc           需要初始化的子控制器
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中的图标
 */
- (void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 1.设置控制器的属性
    childVc.title = title;
    // 设置图标
    childVc.tabBarItem.image = [UIImage imageWithName:imageName];
    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageWithName:selectedImageName];
    if (iOS7) {
        childVc.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    } else {
        childVc.tabBarItem.selectedImage = selectedImage;
    }
    
    // 2.包装一个导航控制器
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
    
    // 3.添加tabbar内部的按钮
    [self.customTabBar addTabBarButtonWithItem:childVc.tabBarItem];
}

@end
