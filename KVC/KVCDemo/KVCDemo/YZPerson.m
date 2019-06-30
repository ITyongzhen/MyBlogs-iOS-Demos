//
//  YZPerson.m
//  KVCDemo
//
//  Created by eagle on 2019/6/30.
//  Copyright © 2019 yongzhen. All rights reserved.
//

#import "YZPerson.h"

@implementation YZPerson

- (int)getAge
{
    return 11;
}

- (int)age
{
    return 12;
}

- (int)isAge
{
    return 13;
}

- (int)_age
{
    return 14;
}


//- (void)setAge:(int)age
//{
//    NSLog(@"setAge: - %d", age);
//}

//- (void)_setAge:(int)age
//{
//    NSLog(@"_setAge: - %d", age);
//}
//- (void)willChangeValueForKey:(NSString *)key
//{
//    [super willChangeValueForKey:key];
//    NSLog(@"willChangeValueForKey - %@", key);
//}
//
//- (void)didChangeValueForKey:(NSString *)key
//{
//    NSLog(@"didChangeValueForKey - begin - %@", key);
//    [super didChangeValueForKey:key];
//    NSLog(@"didChangeValueForKey - end - %@", key);
//}
// 默认的返回值就是YES
+ (BOOL)accessInstanceVariablesDirectly
{
    return YES;
}
@end
