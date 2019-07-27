//
//  Person.m
//  objc-test
//
//  Created by eagle on 2018/8/3.
//

#import "Person.h"
#import <objc/runtime.h>
#import "Car.h"

@implementation Person
    
- (void)speak {
    NSLog(@"who is speaking:%@", self);
    //    NSLog(@"speak : %@",self.name);
}
+(void)test{
    NSLog(@"%s",__func__);
}
    
    
#pragma mark 消息转发

#pragma mark  forwardingTargetForSelector
 // 消息转发
//- (id)forwardingTargetForSelector:(SEL)aSelector{
//    //    if (aSelector == @selector(run)) {
//    //        return [[Car alloc] init];
//    //    }
//    return [super forwardingTargetForSelector:aSelector];
//}
    

+ (id)forwardingTargetForSelector:(SEL)aSelector{
        if (aSelector == @selector(run)) {
            return [Car class];
        }
    return [super forwardingTargetForSelector:aSelector];
}
#pragma mark  methodSignatureForSelector forwardInvocation
//// 方法签名：返回值类型、参数类型
//- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
//{
//    if (aSelector == @selector(run)) {
//       return [NSMethodSignature signatureWithObjCTypes:"v16@0:8"];
//    }
//     return [super methodSignatureForSelector:aSelector];
//}
//
//// NSInvocation封装了一个方法调用，包括：方法调用者、方法名、方法参数
////        anInvocation.target 方法调用者
////        anInvocation.selector 方法名
////        [anInvocation getArgument:NULL atIndex:0]
//- (void)forwardInvocation:(NSInvocation *)anInvocation
//{
////    anInvocation.target = [[Car alloc] init];
////    [anInvocation invoke];
//
//   [anInvocation invokeWithTarget:[[Car alloc] init]];
//
//}
//

    
    
    
#pragma mark  methodSignatureForSelector forwardInvocation
// 方法签名：返回值类型、参数类型
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    if (aSelector == @selector(run)) {
        return [NSMethodSignature signatureWithObjCTypes:"i@:i"];
    }
    return [super methodSignatureForSelector:aSelector];
}
    
// NSInvocation封装了一个方法调用，包括：方法调用者、方法名、方法参数
//        anInvocation.target 方法调用者
//        anInvocation.selector 方法名
//        [anInvocation getArgument:NULL atIndex:0]
- (void)forwardInvocation:(NSInvocation *)anInvocation{
    [anInvocation invokeWithTarget:[[Car alloc] init]];
    
    int ret;
    [anInvocation getReturnValue:&ret];
     NSLog(@"%d", ret);
}
    

# pragma mark - 动态解析
    
// 动态解析
//+ (BOOL)resolveInstanceMethod:(SEL)sel{
//
//    if (sel == @selector(run)) {
//        // 获取其他方法 实例方法，或者类方法都可以
//        //            Method method = class_getClassMethod(self, @selector(test));
//
//        Method method = class_getInstanceMethod(self, @selector(speak));
//        // 动态添加test方法的实现
//        class_addMethod(self, sel,
//                        method_getImplementation(method),
//                        method_getTypeEncoding(method));
//
//        //            class_addMethod(self, sel,
//        //                         method_getImplementation(method),
//        //                         "v@:");
//
//        // 返回YES代表有动态添加方法  其实这里返回NO，也是可以的，返回YES只是增加了一些打印
//        return NO;
//    }
//   return [super resolveInstanceMethod:sel];
//}
    
    
    
    
@end
