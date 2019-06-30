//
//  YZPerson.m
//  KVOdemo
//
//  Created by eagle on 2019/6/23.
//  Copyright © 2019 yongzhen. All rights reserved.
//

#import "YZPerson.h"

@implementation YZPerson


- (void)willChangeValueForKey:(NSString *)key
{
    [super willChangeValueForKey:key];

    NSLog(@"willChangeValueForKey");
}

- (void)didChangeValueForKey:(NSString *)key
{
    NSLog(@"didChangeValueForKey - begin");

    [super didChangeValueForKey:key];

    NSLog(@"didChangeValueForKey - end");
}

@end
