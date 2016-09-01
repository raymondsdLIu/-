//
//  LJTabBar.m
//  BaiSiFunny
//
//  Created by raymond on 16/9/1.
//  Copyright © 2016年 raymond. All rights reserved.
//

#import "LJTabBar.h"

@interface LJTabBar ()

@property (nonatomic, strong) UIButton *publishButton;

@end

@implementation LJTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.publishButton];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.publishButton.size = self.publishButton.currentImage.size;
    self.publishButton.center = CGPointMake(self.width*0.5, self.height*0.5);

    CGFloat totalWidth = self.width - self.publishButton.width;
    int i = 0;
    for (UIView *item in self.subviews) {
        if (![item isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        item.width = totalWidth * 0.25;
        item.left = i > 1 ? i * item.width + self.publishButton.width : item.width * i;
        i ++;
    }
}

#pragma mark - getter

- (UIButton *)publishButton {
    if (!_publishButton) {
        UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishButton setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishButton setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        _publishButton = publishButton;
    }
    return _publishButton;
}

@end
