//
//  LJNewViewController.m
//  BaiSiFunny
//
//  Created by raymond on 16/9/1.
//  Copyright © 2016年 raymond. All rights reserved.
//

#import "LJNewViewController.h"

@interface LJNewViewController ()

@end

@implementation LJNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.titleView =
        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem
        barButtonItemWithImage:[UIImage imageNamed:@"MainTagSubIcon"]
              highlightedImage:[UIImage imageNamed:@"MainTagSubIconClick"]
                        target:self
                        action:@selector(leftNavgationItemAction)];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - private

- (void)leftNavgationItemAction {
    
}

@end
