//
//  UIImage+Extension.h
//  LSPTabBarController
//
//  Created by Object on 2018/3/17.
//  Copyright © 2018年 lsp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

/**
 *  加载图片
 *
 *  @param name 图片名
 */
+ (UIImage *)imageWithName:(NSString *)name;

/**
 *  返回一张自由拉伸的图片
 */
+ (UIImage *)resizedImageWithName:(NSString *)name;

@end
