//
//  YZProxy.m
//  iOS定时器
//
//  Created by eagle on 2018/8/16.
//  Copyright © 2018 yongzhen. All rights reserved.
//

#import "YZProxy.h"

@implementation YZProxy

+ (instancetype)proxyWithTarget:(id)target
{
    // NSProxy对象不需要调用init，因为它本来就没有init方法
    YZProxy *proxy = [YZProxy alloc];
    proxy.target = target;
    return proxy;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel
{
    return [self.target methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    [invocation invokeWithTarget:self.target];
}
@end
