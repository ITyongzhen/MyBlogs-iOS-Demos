//
//  main.m
//  iOS-block
//
//  Created by eagle on 2019/7/12.
//  Copyright © 2019 yongzhen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YZPerson.h"

// 定义block
typedef void (^YZBlock)(void);


int main(int argc, const char * argv[]) {
    @autoreleasepool {
     
       __block NSObject *obj = [[NSObject alloc]init];
        YZBlock block = ^{
            
            NSLog(@"%p",obj);
        };
         block();
    }
    return 0;
}

void test2(){
    __block int age = 10;
    int num = 8;
    NSObject *obj = [[NSObject alloc]init];
    NSObject *obj2 = [[NSObject alloc]init];
    __weak NSObject *weakObj2 = obj2;
    YZBlock block = ^{
        NSLog(@"age = %d",age);
        NSLog(@"num = %d",num);
        NSLog(@"obj = %p",obj);
        NSLog(@"weakObj2 = %p",weakObj2);
        NSLog(@"block内部修改之后age = %d",age);
    };
    
    block();
    NSLog(@"block调用完 age = %d",age);
}





//void test(){
//    YZBlock block;
//
//    {
//        YZPerson *person = [[YZPerson alloc]init];
//        person.age = 10;
//        //
//        //            block = [^{
//        //                NSLog(@"---------%d", person.age);
//        //            } copy];
//
//        __weak YZPerson *weakPerson = person;
//
//        block = ^{
//            NSLog(@"---------%d", person.age);
//        };
//
//        NSLog(@"block.class = %@",[block class]);
//        // MRC下，需要手动释放
//        //            [person release];
//    }
//
//    NSLog(@"block销毁");
//    //        [block release];
//
//
//}


/*
 
 typedef void (*YZBlock)(void);
 
 // 结构体 __Block_byref_age_0
 struct __Block_byref_age_0 {
 void *__isa; //isa指针
 __Block_byref_age_0 *__forwarding; // 指向自身的指针
 int __flags;
 int __size;
 int age; //使用值
 };
 
 struct __main_block_impl_0 {
 struct __block_impl impl;
 struct __main_block_desc_0* Desc;
 // 这里多了__Block_byref_age_0类型的结构体
 __Block_byref_age_0 *age; // by ref
 // fp是函数地址  desc是描述信息  __Block_byref_age_0 类型的结构体  *_age  flags标记
 __main_block_impl_0(void *fp, struct __main_block_desc_0 *desc, __Block_byref_age_0 *_age, int flags=0) : age(_age->__forwarding) {
 impl.isa = &_NSConcreteStackBlock;
 impl.Flags = flags;
 impl.FuncPtr = fp; //fp是函数地址
 Desc = desc;
 }
 };
 static void __main_block_func_0(struct __main_block_impl_0 *__cself) {
 __Block_byref_age_0 *age = __cself->age; // bound by ref
 //这里先调用__forwarding再调用age
 (age->__forwarding->age) = 20;
 NSLog((NSString *)&__NSConstantStringImpl__var_folders_x4_920c4yq936b63mvtj4wmb32m0000gn_T_main_e88eae_mi_0,(age->__forwarding->age));
 }
////// static void __main_block_copy_0(struct __main_block_impl_0*dst, struct __main_block_impl_0*src) {_Block_object_assign((void*)&dst->age, (void*)src->age, 8/*BLOCK_FIELD_IS_BYREF*/

//static void __main_block_dispose_0(struct __main_block_impl_0*src) {_Block_object_dispose((void*)src->age, 8/*BLOCK_FIELD_IS_BYREF*/
//                                                                                          );}
//
//static struct __main_block_desc_0 {
//    size_t reserved;
//    size_t Block_size;
//    void (*copy)(struct __main_block_impl_0*, struct __main_block_impl_0*);
//    void (*dispose)(struct __main_block_impl_0*);
//} __main_block_desc_0_DATA = { 0, sizeof(struct __main_block_impl_0), __main_block_copy_0, __main_block_dispose_0};
//int main(int argc, const char * argv[]) {
//    /* @autoreleasepool */ { __AtAutoreleasePool __autoreleasepool;
//        // 这是原始的代码 __Block_byref_age_0
//        __attribute__((__blocks__(byref))) __Block_byref_age_0 age = {(void*)0,(__Block_byref_age_0 *)&age, 0, sizeof(__Block_byref_age_0), 10};
//
//        //这是简化之后的代码 __Block_byref_age_0
//        __Block_byref_age_0 age = {
//            0, //赋值给 __isa
//            (__Block_byref_age_0 *)&age,//赋值给 __forwarding,也就是自身的指针
//            0, // 赋值给__flags
//            sizeof(__Block_byref_age_0),//赋值给 __size
//            10 // age 使用值
//        };
//
//        // 这是原始的 block代码
//        YZBlock block = ((void (*)())&__main_block_impl_0((void *)__main_block_func_0, &__main_block_desc_0_DATA, (__Block_byref_age_0 *)&age, 570425344));
//
//        // 这是简化之后的 block代码
//        YZBlock block = (&__main_block_impl_0(
//                                              __main_block_func_0,
//                                              &__main_block_desc_0_DATA,
//                                              &age,
//                                              570425344));
//
//        ((void (*)(__block_impl *))((__block_impl *)block)->FuncPtr)((__block_impl *)block);
//        NSLog((NSString *)&__NSConstantStringImpl__var_folders_x4_920c4yq936b63mvtj4wmb32m0000gn_T_main_e88eae_mi_1,(age.__forwarding->age));
//
//
//
//    }
//    return 0;
//}
//
//
// */
