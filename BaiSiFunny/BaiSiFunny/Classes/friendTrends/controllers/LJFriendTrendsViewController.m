//
//  LJFriendTrendsViewController.m
//  BaiSiFunny
//
//  Created by raymond on 16/9/1.
//  Copyright © 2016年 raymond. All rights reserved.
//

#import "LJFriendTrendsViewController.h"
#import "LJRecommendViewController.h"
#import "LJNotLoginView.h"

@interface LJFriendTrendsViewController ()

@property(nonatomic, strong) LJNotLoginView *notLoginView;

@end

@implementation LJFriendTrendsViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  [self prepareUI];
  self.navigationItem.title = @"我的关注";
  self.navigationItem.leftBarButtonItem = [UIBarButtonItem
      barButtonItemWithImage:[UIImage imageNamed:@"friendsRecommentIcon"]
            highlightedImage:[UIImage imageNamed:@"friendsRecommentIcon-click"]
                      target:self
                      action:@selector(leftNavgationItemAction)];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)leftNavgationItemAction {
    [self.navigationController pushViewController:[[LJRecommendViewController alloc] init] animated:YES];
}

- (void)prepareUI {
  [self.view addSubview:self.notLoginView];
  [self.view
      addConstraints:[NSLayoutConstraint
                         constraintsWithVisualFormat:@"V:|-0-[nlv]-0-|"
                                             options:0
                                             metrics:nil
                                               views:@{
                                                 @"nlv" : self.notLoginView
                                               }]];
  [self.view
      addConstraints:[NSLayoutConstraint
                         constraintsWithVisualFormat:@"H:|-0-[nlv]-0-|"
                                             options:0
                                             metrics:nil
                                               views:@{
                                                 @"nlv" : self.notLoginView
                                               }]];
}

#pragma mark - getter

- (UIView *)notLoginView {
  if (!_notLoginView) {
    _notLoginView = [[LJNotLoginView alloc] init];
    _notLoginView.translatesAutoresizingMaskIntoConstraints = NO;
  }
  return _notLoginView;
}

@end
