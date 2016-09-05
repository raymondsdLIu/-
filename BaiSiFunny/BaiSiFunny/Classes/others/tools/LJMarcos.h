//
//  LJMarcos.h
//  BaiSiFunny
//
//  Created by raymond on 16/9/1.
//  Copyright © 2016年 raymond. All rights reserved.
//

#ifndef LJMarcos_h
#define LJMarcos_h

#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...)
#endif

#define RamdonColor                                                            \
  [UIColor colorWithRed:arc4random_uniform(256) / 255.0                        \
                  green:arc4random_uniform(256) / 255.0                        \
                   blue:arc4random_uniform(256) / 255.0                        \
                  alpha:1.0];
#define LJColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define LJGlobalColor LJColor(233, 233, 233)

#define sLJNetWorkTools [LJNetworkTools sharedInstance]

#define CategoryCellReuseId @"CategoryCellReuseId"
#define UserCellReuseId @"UserCellReuseId"

#endif /* LJMarcos_h */
