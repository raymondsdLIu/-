//
//  LJMeViewController.m
//  BaiSiFunny
//
//  Created by raymond on 16/9/1.
//  Copyright © 2016年 raymond. All rights reserved.
//

#import "LJMeViewController.h"

@interface LJMeViewController ()

@end

@implementation LJMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的";

    UIBarButtonItem *nightItem = [UIBarButtonItem
        barButtonItemWithImage:[UIImage imageNamed:@"mine-moon-icon"]
              highlightedImage:[UIImage imageNamed:@"mine-moon-icon-click"]
                        target:self
                        action:nil];
    UIBarButtonItem *settingItem = [UIBarButtonItem
        barButtonItemWithImage:[UIImage imageNamed:@"mine-setting-icon"]
              highlightedImage:[UIImage imageNamed:@"mine-setting-icon-click"]
                        target:self
                        action:nil];
    self.navigationItem.rightBarButtonItems = @[ settingItem, nightItem ];
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
