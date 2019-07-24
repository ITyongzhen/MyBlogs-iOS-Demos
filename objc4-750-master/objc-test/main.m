//
//  main.m
//  objc-test
//
//  Created by eagle on 2018/8/23.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/message.h>



//- (void)test
//{
//    NSLog(@"%s", __func__);
//}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSObject *obj = [[NSObject alloc]init];
//        Method method = class_getClassMethod(self, @selector(test))
//        method_getTypeEncoding(method);
//        NSLog(@"%p",obj);
    }
    return 0;
}
