//
//  LJRecmmendUser.h
//  BaiSiFunny
//
//  Created by raymond on 16/9/5.
//  Copyright © 2016年 raymond. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LJRecmmendUser : NSObject

@property (nonatomic, copy) NSString *header;
@property (nonatomic, copy) NSString *uid;
@property (nonatomic, assign) BOOL is_vip;
@property (nonatomic, assign) BOOL is_follow;
@property (nonatomic, copy) NSString *introduction;
@property (nonatomic, assign) NSInteger gender;
@property (nonatomic, assign) NSInteger tiezi_cout;
@property (nonatomic, copy) NSString *screen_name;

@end
