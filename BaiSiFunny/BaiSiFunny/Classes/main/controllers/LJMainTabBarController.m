//
//  LJMainTabBarController.m
//  BaiSiFunny
//
//  Created by raymond on 16/9/1.
//  Copyright © 2016年 raymond. All rights reserved.
//

#import "LJMainTabBarController.h"
#import "LJMarcos.h"
#import "LJEssenceViewController.h"
#import "LJNewViewController.h"
#import "LJFriendTrendsViewController.h"
#import "LJMeViewController.h"
#import "LJTabBar.h"

@interface LJMainTabBarController ()

@end

@implementation LJMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITabBarItem *item = [UITabBarItem appearance];

    [self setValue:[[LJTabBar alloc] init] forKeyPath:@"tabBar"];

    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];

    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];

    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];

    [self setupChildenViewController:[[LJEssenceViewController alloc] init]
                               title:@"精华"
                               image:[UIImage imageNamed:@"tabBar_essence_icon"]
                       selectedImage:
                           [UIImage imageNamed:@"tabBar_essence_click_icon"]];
    [self setupChildenViewController:[[LJNewViewController alloc] init]
                               title:@"新帖"
                               image:[UIImage imageNamed:@"tabBar_new_icon"]
                       selectedImage:[UIImage
                                         imageNamed:@"tabBar_new_click_icon"]];
    [self setupChildenViewController:[[LJFriendTrendsViewController alloc] init]
                               title:@"关注"
                               image:[UIImage
                                         imageNamed:@"tabBar_friendTrends_icon"]
                       selectedImage:
                           [UIImage
                               imageNamed:@"tabBar_friendTrends_click_icon"]];
    [self setupChildenViewController:[[LJMeViewController alloc] init]
                               title:@"我"
                               image:[UIImage imageNamed:@"tabBar_me_icon"]
                       selectedImage:[UIImage
                                         imageNamed:@"tabBar_me_click_icon"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private

- (void)setupChildenViewController:(UIViewController *)vc
                             title:(NSString *)title
                             image:(UIImage *)image
                     selectedImage:(UIImage *)selectedImage {
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selectedImage;
    vc.view.backgroundColor = RamdonColor;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}

@end
