//
//  LSPMeViewController.m
//  LSPTabBarController
//
//  Created by Object on 2018/3/17.
//  Copyright © 2018年 lsp. All rights reserved.
//

#import "LSPMeViewController.h"

@interface LSPMeViewController ()

@end

@implementation LSPMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.view.backgroundColor = [UIColor yellowColor];
     self.tabBarItem.badgeValue = @"new";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
