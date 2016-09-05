//
//  LJNotLoginView.m
//  BaiSiFunny
//
//  Created by raymond on 16/9/2.
//  Copyright © 2016年 raymond. All rights reserved.
//

#import "LJNotLoginView.h"

@interface LJNotLoginView ()

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *loginButton;

@end

@implementation LJNotLoginView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubViews];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews {
    self.backgroundColor = LJGlobalColor;
    [self addSubview:self.iconView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.loginButton];

    NSDictionary *views = @{
                            @"iv" : self.iconView,
                            @"tl" : self.titleLabel,
                            @"lb" : self.loginButton
                            };

    [self
        addConstraints:[NSLayoutConstraint
                           constraintsWithVisualFormat:@"V:[iv]-40-[tl]-40-[lb(35)]"
                                               options:0
                                               metrics:nil
                                                 views:views]];
    [self addConstraint:[NSLayoutConstraint
                            constraintWithItem:self.iconView
                                     attribute:NSLayoutAttributeCenterX
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self
                                     attribute:NSLayoutAttributeCenterX
                                    multiplier:1
                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint
                            constraintWithItem:self.titleLabel
                                     attribute:NSLayoutAttributeCenterX
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self
                                     attribute:NSLayoutAttributeCenterX
                                    multiplier:1
                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint
                            constraintWithItem:self.titleLabel
                                     attribute:NSLayoutAttributeCenterY
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self
                                     attribute:NSLayoutAttributeCenterY
                                    multiplier:1
                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint
                            constraintWithItem:self.loginButton
                                     attribute:NSLayoutAttributeCenterX
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self
                                     attribute:NSLayoutAttributeCenterX
                                    multiplier:1
                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint
                            constraintWithItem:self.loginButton
                                     attribute:NSLayoutAttributeWidth
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                     attribute:NSLayoutAttributeNotAnAttribute
                                    multiplier:1
                                      constant:200]];
}

#pragma mark - getter

- (UIImageView *)iconView {
    if (!_iconView) {
        _iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"header_cry_icon"]];
        _iconView.translatesAutoresizingMaskIntoConstraints = NO;
        [_iconView sizeToFit];
    }
    return _iconView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _titleLabel.text = @"快快登录吧, 关注百思最in牛人\n好友动态让你过把瘾儿~\n欧耶~~~~!";
        _titleLabel.numberOfLines = 0;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = LJColor(153, 102, 51);
        _titleLabel.font = [UIFont systemFontOfSize:17.f];
    }
    return _titleLabel;
}

- (UIButton *)loginButton {
    if (!_loginButton) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginButton.translatesAutoresizingMaskIntoConstraints = NO;
        [_loginButton setTitle:@"立即登录注册" forState:UIControlStateNormal];
        [_loginButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [_loginButton setBackgroundImage:[UIImage imageNamed:@"friendsTrend_login"] forState:UIControlStateNormal];
        [_loginButton setBackgroundImage:[UIImage imageNamed:@"friendsTrend_login_click"] forState:UIControlStateHighlighted];
        _loginButton.size = _loginButton.currentBackgroundImage.size;
        // [_loginButton sizeToFit];
    }
    return _loginButton;
}

@end
