//
//  UIBarButtonItem+Extends.h
//  BaiSiFunny
//
//  Created by raymond on 16/9/1.
//  Copyright © 2016年 raymond. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extends)

+ (instancetype)barButtonItemWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage target:(id)target action:(SEL)selector;

@end
