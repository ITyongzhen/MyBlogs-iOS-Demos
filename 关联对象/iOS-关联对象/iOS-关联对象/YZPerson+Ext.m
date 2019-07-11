//
//  YZPerson+Ext.m
//  iOS-关联对象
//
//  Created by eagle on 2019/7/9.
//  Copyright © 2019 yongzhen. All rights reserved.
//

#import "YZPerson+Ext.h"
#import <objc/runtime.h>
@implementation YZPerson (Ext)

const void *YZNameKey = &YZNameKey;

- (void)setName:(NSString *)name{
    objc_setAssociatedObject(self, YZNameKey, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)name{
   return objc_getAssociatedObject(self, YZNameKey);
}

- (void)dealloc
{
    objc_removeAssociatedObjects(self);
}

NSMutableDictionary *weights_;

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 写在这里，保证s只初始化一次
        weights_ = [NSMutableDictionary dictionary];
    });
}

- (void)setWeight:(int)weight{
    NSString *key = [NSString stringWithFormat:@"%p",self];//self 地址值作为key
    weights_[key] = @(weight);//字典中的value不能直接放int，需要包装成对象
}
- (int)weight{
     NSString *key = [NSString stringWithFormat:@"%p",self];
    return  [weights_[key] intValue];
}

//int _weight;
//- (void)setWeight:(int)weight{
//    _weight = weight;
//}
//- (int)weight{
//    return _weight;
//}
@end
