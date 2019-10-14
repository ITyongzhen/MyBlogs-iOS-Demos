//
//  main.m
//  objc-test
//
//  Created by eagle on 2018/8/3.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/message.h>
#import "Person.h"
#import "AppModel.h"
#import "Car.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        [[AppModel sharedInstance] runModuleFunc:@"YZPerson" :@"run" :nil hasReturn:NO];
        id k;
        {
        Car *car = [[Car alloc] init];
        car.price = 110;
            
            k = car;
        }
        
        NSNumber *num = @20;
        NSLog(@"num %p",num);
//
//       [[AppModel sharedInstance] runModuleFunc:@"YZPerson" :@"getDoubleWithPrice:" :@[car] hasReturn:YES];
         NSLog(@"car地址");
    }
    return 0;
}




void rest2(){
    [Person run];
}


void test1(){
    
    //        NSString *str = @"abc";
    // cls里面存放的是Person的isa指针
    id cls = [Person class];
    
    // obj指向cls
    void *obj = &cls;
    //调用speak时候，根据IMP指针找到person，打印self的时候，可以找到person。 但是person里面没有name,然后调用name的时候，依然会跳过前面isa指针的内存去查找8个字节，也就是name所在的位置，因为内存是从低地址到高地址排列，在person创建之前，已经有了 viewController,所以如果是ios项目中会打印RuntimeDemo[61756:636262] speak : <ViewController: 0x7fad0d60b600>，但是在命令行中，没有控制器，去访问的时候，就会坏内存访问。当然了。如果说非要在命令行中解决。可以再前面定义个变量，例如NSString *str = @"abc";那么打印name的是，去查找内存，会查到str,打印出objc-test[60824:627016] speak : abc
    [(__bridge id)obj speak];
}
