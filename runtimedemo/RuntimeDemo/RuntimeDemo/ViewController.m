//
//  ViewController.m
//  RuntimeDemo
//
//  Created by eagle on 2019/7/23.
//  Copyright © 2019 yongzhen. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    Method method = class_getClassMethod([self class], @selector(test));
    const char *str = method_getTypeEncoding(method);
    
    Method method2 = class_getClassMethod([self class], @selector(testWithNum:));
    const char *str2 = method_getTypeEncoding(method2);
    
    NSLog(@"test的类型 = %s ",str);
    NSLog(@"testWithNum: = %s ",str2);
}

+(void)test{
    
}
+(int)testWithNum:(int)num{
    return num;
}

@end
