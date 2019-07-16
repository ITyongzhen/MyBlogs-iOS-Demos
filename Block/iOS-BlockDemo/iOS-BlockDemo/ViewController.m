//
//  ViewController.m
//  iOS-BlockDemo
//
//  Created by eagle on 2019/7/14.
//  Copyright © 2019 yongzhen. All rights reserved.
//

#import "ViewController.h"
typedef int (^MyBlock)(int a, int b);
@interface ViewController ()
@property (nonatomic,copy) MyBlock myBlockOne;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.myBlockOne = ^int(int a, int b) {
        return a + b;
    };
    
    self.myBlockOne(2, 5);
}



@end
