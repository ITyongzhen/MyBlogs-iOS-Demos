//
//  Car.m
//  objc-test
//
//  Created by eagle on 2018/8/3.
//

#import "Car.h"

@implementation Car
- (void)run{
    NSLog(@"%s",__func__);
}
+ (void)run{
     NSLog(@"%s",__func__);
}
- (int)test:(int)age{
     NSLog(@"%s",__func__);
     return age * 2;
}
@end
