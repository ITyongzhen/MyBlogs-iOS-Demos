//
//  YZProxy.h
//  iOS定时器
//
//  Created by eagle on 2018/8/16.
//  Copyright © 2018 yongzhen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YZProxy : NSProxy
+ (instancetype)proxyWithTarget:(id)target;
@property (weak, nonatomic) id target;
@end

