//
//  main.m
//  iOS-关联对象
//
//  Created by eagle on 2019/7/9.
//  Copyright © 2019 yongzhen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YZPerson+Ext.h"
#import "YZPerson.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        YZPerson *person = [[YZPerson alloc] init];
        person.weight = 103;
        person.name = @"jack";

        YZPerson *person2 = [[YZPerson alloc] init];
        person2.weight = 13;
        person2.name = @"rose";
        
        NSLog(@"person.weight = %d person.name = %@",person.weight,person.name);
        NSLog(@"person2.weight = %d person2.name = %@",person2.weight,person2.name);
    }
    return 0;
}
