//
//  LJNetworkTools.m
//  BaiSiFunny
//
//  Created by raymond on 16/9/5.
//  Copyright © 2016年 raymond. All rights reserved.
//

#import "LJNetworkTools.h"
#import "AFNetworking/AFNetworking.h"

@implementation LJNetworkTools

+ (instancetype)sharedInstance {
    static id instance;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });

    return instance;
}

- (void)loadDataWithURL:(NSString *)urlString params:(NSDictionary *)params action:(void (^)(NSError *error, id response))action {
    NSAssert(urlString.length > 0, @"url不能为空");
    NSString *url = [urlString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *parameters = nil;
    if (params != nil && params.count != 0) {
        parameters = params;
    }
    [[AFHTTPSessionManager manager] GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        action(nil,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        action(error, nil);
    }];
}

@end
