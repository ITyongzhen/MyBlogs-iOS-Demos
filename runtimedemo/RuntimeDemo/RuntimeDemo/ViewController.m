//
//  ViewController.m
//  RuntimeDemo
//
//  Created by eagle on 2019/7/23.
//  Copyright © 2019 yongzhen. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

#import "YZPerson.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    Method method = class_getClassMethod([self class], @selector(test));
//    const char *str = method_getTypeEncoding(method);
//
//    Method method2 = class_getClassMethod([self class], @selector(testWithNum:));
//    const char *str2 = method_getTypeEncoding(method2);
//
//    NSLog(@"test的类型 = %s ",str);
//    NSLog(@"testWithNum: = %s ",str2);
    
    id cls = [YZPerson class];
    
    // obj指向cls
    void *obj = &cls;
    //调用speak时候，根据IMP指针找到person，但是person里面没有name,然后调用name的时候，
    [(__bridge id)obj speak];
    
}

+(void)test{
    
}
+(int)testWithNum:(int)num{
    return num;
}

@end
