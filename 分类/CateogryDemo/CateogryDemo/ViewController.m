//
//  ViewController.m
//  CateogryDemo
//
//  Created by eagle on 2019/7/5.
//  Copyright © 2019 yongzhen. All rights reserved.
//

#import "ViewController.h"
#import "YZPerson.h"
#import "YZPerson+test1.h"
#import "YZStudent.h"
#import <objc/runtime.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
//
//    if (自己没有初始化) {
//        if(父类没有初始化){
//            objc_msgSend([YZPerson class]，@selector(initialize));
//        }
//         objc_msgSend([YZStudent class]，@selector(initialize));
//    }
    
    
//    YZPerson *person = [[YZPerson alloc] init];
//    [person run];
//    [YZPerson run];
//    [YZPerson load];
    printMethodNamesOfClass(object_getClass([YZPerson class]));
}

void printMethodNamesOfClass(Class cls)
{
    unsigned int count;
    // 获得方法数组
    Method *methodList = class_copyMethodList(cls, &count);
    
    // 存储方法名
    NSMutableString *methodNames = [NSMutableString string];
    
    // 遍历所有的方法
    for (int i = 0; i < count; i++) {
        // 获得方法
        Method method = methodList[i];
        // 获得方法名
        NSString *methodName = NSStringFromSelector(method_getName(method));
        // 拼接方法名
        [methodNames appendString:methodName];
        [methodNames appendString:@", "];
    }
    
    // 释放
    free(methodList);
    
    // 打印方法名
    NSLog(@"%@ %@", cls, methodNames);
}
@end
