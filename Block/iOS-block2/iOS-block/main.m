//
//  main.m
//  iOS-block
//
//  Created by eagle on 2019/7/12.
//  Copyright © 2019 yongzhen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YZPerson.h"

// 定义block
typedef void (^YZBlock)(void);


int main(int argc, const char * argv[]) {
    @autoreleasepool {
       __block int age = 10;
        YZBlock block = ^{
            age = 20;
            NSLog(@"block内部修改之后age = %d",age);
        };
        
        block();
        NSLog(@"block调用完 age = %d",age);
    }
    return 0;
}

//void test(){
//    YZBlock block;
//
//    {
//        YZPerson *person = [[YZPerson alloc]init];
//        person.age = 10;
//        //
//        //            block = [^{
//        //                NSLog(@"---------%d", person.age);
//        //            } copy];
//
//        __weak YZPerson *weakPerson = person;
//
//        block = ^{
//            NSLog(@"---------%d", person.age);
//        };
//
//        NSLog(@"block.class = %@",[block class]);
//        // MRC下，需要手动释放
//        //            [person release];
//    }
//
//    NSLog(@"block销毁");
//    //        [block release];
//
//
//}
