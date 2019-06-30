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

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNameKVO];
}

-(void)setNameKVO{
    
    self.person = [[YZPerson alloc] init];
    self.person2 = [[YZPerson alloc] init];
    
//    NSLog(@"person添加KVO监听之前 - %@ %@",
//          object_getClass(self.person),
//          object_getClass(self.person2));
    NSLog(@"person添加KVO监听之前 - %p %p",
          [self.person methodForSelector:@selector(setName:)],
          [self.person2 methodForSelector:@selector(setName:)]);
    // 注册观察者
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [self.person addObserver:self forKeyPath:@"name" options:options context:@"1111"];
    
//    NSLog(@"person添加KVO监听之后 - %@ %@",
//          object_getClass(self.person),
//          object_getClass(self.person2));
    NSLog(@"person添加KVO监听之后 - %p %p",
          [self.person methodForSelector:@selector(setName:)],
          [self.person2 methodForSelector:@selector(setName:)]);
    
    
    NSLog(@"类对象 - %@ %@",
          object_getClass(self.person),  // self.person.isa
          object_getClass(self.person2)); // self.person2.isa
    
    NSLog(@"元类对象 - %@ %@",
          object_getClass(object_getClass(self.person)), // self.person.isa.isa
          object_getClass(object_getClass(self.person2))); // self.person2.isa.isa
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.person.name = @"ccc";
    self.person2.name = @"ddd";
    
    // NSKVONotifying_YZPerson是使用Runtime动态创建的一个类，是YZPerson的子类
    
    // self.person.isa == NSKVONotifying_YZPerson
  
    // self.person2.isa = YZPerson
  
    
    
//    [self.person setName:@"dd"];
    
    
//    [self.person willChangeValueForKey:@"name"];
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
