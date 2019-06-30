//
//  YZPerson.m
//  KVOdemo
//
//  Created by eagle on 2019/6/23.
//  Copyright © 2019 yongzhen. All rights reserved.
//

#import "YZPerson.h"

@implementation YZPerson
- (void)setName:(NSString *)name{
    [self willChangeValueForKey:@"age"];
     _name = name;
    [self didChangeValueForKey:@"age"];
   
}
//// KVO监听执行
//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
//    if(context != CYLTabBarContext) {
//        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
//        return;
//    }
//    if(context == CYLTabBarContext) {
//        [[NSNotificationCenter defaultCenter] postNotificationName:CYLTabBarItemWidthDidChangeNotification object:self];
//        if (CYL_IS_IPHONE_X) {
//            [self layoutIfNeeded];
//        }
//    }
//}

@end
