//
//  LSPTabBar.h
//  LSPTabBarController
//
//  Created by Object on 2018/3/17.
//  Copyright © 2018年 lsp. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LSPTabBar;

@protocol LSPTabBarDelegate <NSObject>

@optional
- (void)tabBar:(LSPTabBar *)tabBar didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to;
- (void)tabBar:(LSPTabBar *)tabBar didSelectCenterButton:(UIButton *)centerBtn;
@end

@interface LSPTabBar : UIView

- (void)addTabBarButtonWithItem:(UITabBarItem *)item;

@property (nonatomic, weak) id<LSPTabBarDelegate> delegate;

@end
