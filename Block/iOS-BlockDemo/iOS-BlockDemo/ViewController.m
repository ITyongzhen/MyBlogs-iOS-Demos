//
//  ViewController.m
//  iOS-BlockDemo
//
//  Created by eagle on 2019/7/14.
//  Copyright © 2019 yongzhen. All rights reserved.
//

#import "ViewController.h"
#import "YZPerson.h"

typedef int (^MyBlock)(int a, int b);
@interface ViewController ()
@property (nonatomic,copy) MyBlock myBlockOne;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    YZPerson *person = [[YZPerson alloc] init];
    person.age = 10;
    person.block = ^{
        NSLog(@"person---%p",person);
    };
    NSLog(@"--------");
}

-(void)test{
    self.myBlockOne = ^int(int a, int b) {
        return a + b;
    };
    
    self.myBlockOne(2, 5);
}

@end
