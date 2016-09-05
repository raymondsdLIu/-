//
//  LJNetworkTools.h
//  BaiSiFunny
//
//  Created by raymond on 16/9/5.
//  Copyright © 2016年 raymond. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LJNetworkTools : NSObject

+ (instancetype)sharedInstance;

- (void)loadDataWithURL:(NSString *)urlString params:(NSDictionary *)params action:(void (^)(NSError *error, id response))action;

@end
