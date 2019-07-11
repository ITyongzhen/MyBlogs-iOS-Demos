//
//  ViewController.m
//  KVCDemo
//
//  Created by eagle on 2019/6/30.
//  Copyright © 2019 yongzhen. All rights reserved.
//

#import "ViewController.h"
#import "YZPerson.h"
@interface ViewController ()
@property (nonatomic,strong) YZPerson *person;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.person = [[YZPerson alloc]init];

//    // 添加KVO监听
//    [self.person addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NULL];
//
//    // 通过KVC修改age属性
    [self.person setValue:@10 forKey:@"age"];

    // 取值
    NSLog(@"取值为：%@",[self.person valueForKey:@"age"]);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.person setValue:@888 forKey:@"age"];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"observeValueForKeyPath - %@", change);
}

//-(void)dealloc{
//    // 移除KVO监听
//    [self.person removeObserver:self forKeyPath:@"age"];
//}

@end
