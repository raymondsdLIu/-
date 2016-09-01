//
//  UIBarButtonItem+Extends.m
//  BaiSiFunny
//
//  Created by raymond on 16/9/1.
//  Copyright © 2016年 raymond. All rights reserved.
//

#import "UIBarButtonItem+Extends.h"

@implementation UIBarButtonItem (Extends)

+ (instancetype)barButtonItemWithImage:(UIImage *)image
                      highlightedImage:(UIImage *)highlightedImage
                                target:(id)target
                                action:(SEL)selector {
  UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
  [button setImage:image forState:UIControlStateNormal];
  [button setImage:highlightedImage forState:UIControlStateHighlighted];
  [button addTarget:target
                action:selector
      forControlEvents:UIControlEventTouchUpInside];
  button.size = button.currentImage.size;
  UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
  return item;
}

@end
