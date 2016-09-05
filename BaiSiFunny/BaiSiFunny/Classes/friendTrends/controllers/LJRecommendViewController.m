//
//  LJRecommendViewController.m
//  BaiSiFunny
//
//  Created by raymond on 16/9/5.
//  Copyright © 2016年 raymond. All rights reserved.
//

#import "LJRecommendViewController.h"
#import "LJRecommendCategory.h"
#import "LJRecommendCategoryCell.h"
#import "LJRecmmendUser.h"

@interface LJRecommendViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *categoryTableView;
@property (nonatomic, strong) UITableView *userTableView;
@property (nonatomic, strong) NSArray *categories;
@property (nonatomic, strong) NSArray *users;

@end

@implementation LJRecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"推荐关注";
    self.view.backgroundColor = LJGlobalColor;
    [self prepareUI];
    self.automaticallyAdjustsScrollViewInsets = NO;

    [SVProgressHUD show];
    NSString *url = @"http://api.budejie.com/api/api_open.php";
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"category";
    params[@"c"] = @"subscribe";
    [sLJNetWorkTools loadDataWithURL:url params:params action:^(NSError *error, id response) {
        [SVProgressHUD dismiss];
        if (error == nil && response != nil) {
            NSLog(@"%@", response);
            self.categories = [LJRecommendCategory mj_objectArrayWithKeyValuesArray:response[@"list"]];
            [self.categoryTableView reloadData];
            [self.categoryTableView
                selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]
                            animated:NO
                      scrollPosition:UITableViewScrollPositionNone];
        } else {
            NSLog(@"%@", error);
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private

- (void)prepareUI {
    [self.view addSubview:self.categoryTableView];
    [self.view addSubview:self.userTableView];
    NSDictionary *views = @{
      @"ctb" : self.categoryTableView,
      @"utb" : self.userTableView
    };
    [self.view
        addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:
                                               @"H:|-0-[ctb(70)]-0-[utb]-0-|"
                                                               options:0
                                                               metrics:nil
                                                                 views:views]];
    [self.view addConstraints:[NSLayoutConstraint
                                  constraintsWithVisualFormat:@"V:|-0-[ctb]-0-|"
                                                      options:0
                                                      metrics:nil
                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint
                                  constraintsWithVisualFormat:@"V:|-0-[utb]-0-|"
                                                      options:0
                                                      metrics:nil
                                                        views:views]];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.categoryTableView) {
        return self.categories.count;
    } else {
        return self.users.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.categoryTableView) {
        LJRecommendCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:CategoryCellReuseId forIndexPath:indexPath];
        LJRecommendCategory *categroy = self.categories[indexPath.row];
        cell.category = categroy;
        return cell;
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:UserCellReuseId forIndexPath:indexPath];
        LJRecmmendUser *user = self.users[indexPath.row];
        cell.textLabel.text = user.screen_name;
        return cell;
    }
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.categoryTableView) {
        LJRecommendCategory *catepory = self.categories[indexPath.row];
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        params[@"a"] = @"list";
        params[@"c"] = @"subscribe";
        params[@"category_id"] = @(catepory.id);
        [sLJNetWorkTools loadDataWithURL:@"http://api.budejie.com/api/api_open.php" params:params action:^(NSError *error, id response) {
            if (error == nil && response != nil) {
                self.users = [LJRecmmendUser mj_objectArrayWithKeyValuesArray:response[@"list"]];
                [self.userTableView reloadData];
            } else {
                NSLog(@"%@", error);
            }
        }];
    }
}

#pragma mark - getter

- (UITableView *)categoryTableView {
    if (!_categoryTableView) {
        _categoryTableView = [[UITableView alloc] init];
        _categoryTableView.translatesAutoresizingMaskIntoConstraints = NO;
        [_categoryTableView registerClass:[LJRecommendCategoryCell class] forCellReuseIdentifier:CategoryCellReuseId];
        _categoryTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _categoryTableView.dataSource = self;
        _categoryTableView.delegate = self;
        _categoryTableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    }
    return _categoryTableView;
}

- (UITableView *)userTableView {
    if (!_userTableView) {
        _userTableView = [[UITableView alloc] init];
        _userTableView.translatesAutoresizingMaskIntoConstraints = NO;
        [_userTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:UserCellReuseId];
        _userTableView.dataSource = self;
        _userTableView.delegate = self;
        _userTableView.contentInset = self.categoryTableView.contentInset;
    }
    return _userTableView;
}

@end
