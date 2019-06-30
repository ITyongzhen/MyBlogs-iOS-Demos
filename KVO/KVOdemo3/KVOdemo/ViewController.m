//
//  ViewController.m
//  KVOdemo
//
//  Created by eagle on 2019/6/23.
//  Copyright © 2019 yongzhen. All rights reserved.
//

#import "ViewController.h"
#import "YZPerson.h"
#import <objc/runtime.h>

@interface ViewController ()
@property (nonatomic,strong) YZPerson *person;
@property (nonatomic,strong) YZPerson *person2;
@end

@implementation ViewController
- (void)printMethodNamesOfClass:(Class)cls
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

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNameKVO];
}

-(void)setNameKVO{
    
    self.person = [[YZPerson alloc] init];
    // 注册观察者
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [self.person addObserver:self forKeyPath:@"name" options:options context:@"1111"];
    NSLog(@"person添加KVO监听之后 - self.person的类是：%@   里面的方法有：",object_getClass(self.person));
    [self printMethodNamesOfClass:object_getClass(self.person)];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//        self.person.name = @"ccc";
    
    self.person->_name = @"abc";
    // 手动调用KVO
//    [self.person willChangeValueForKey:@"name"];
//
//    [self.person didChangeValueForKey:@"name"];
}
// 当监听对象的属性值发生改变时，就会调用
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"监听到%@的%@属性值改变了 - %@ - %@", object, keyPath, change, context);
}
- (void)dealloc
{
    // 移除监听
    [self.person removeObserver:self forKeyPath:@"name"];
}
@end
