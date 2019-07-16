//
//  main.m
//  iOS-block
//
//  Created by eagle on 2019/7/12.
//  Copyright © 2019 yongzhen. All rights reserved.
//

#import <Foundation/Foundation.h>
// typedef定义
//typedef int (^MyBlockFour3)(int);
//
//@property (nonatomic,copy) MyBlockFour3 block;

static struct __main_block_desc_0 {
    size_t reserved;
    size_t Block_size; //block占用的内存大小
};

struct __block_impl {
    void *isa;
    int Flags;
    int Reserved;
    void *FuncPtr;
};

struct __main_block_impl_0 {
    struct __block_impl impl;
    struct __main_block_desc_0* Desc;
    int age;

};

void test(){
    
    //无参无返回值 定义
    void (^MyBlockOne)(void) = ^{
        NSLog(@"无参无返回值");
    };
    
    // 调用
    MyBlockOne();
    
    
    // 无参有返回值
    int (^MyBlockTwo)(void) = ^{
        NSLog(@"无参有返回值");
        return 2;
    };
    // 调用
    int res = MyBlockTwo();
    
    
    //有参无返回值 定义
    void (^MyBlockThree)(int a) = ^(int a){
        NSLog(@"有参无返回值 a = %d",a);
    };
    
    // 调用
    MyBlockThree(10);
    
    
    //有参有返回值
    int (^MyBlockFour)(int a) = ^(int a){
        NSLog(@"有参有返回值 a = %d",a);
        return a * 2;
    };
    MyBlockFour(4);
}

int age1 = 11;
static int height1 = 22;

// 定义Block
typedef void (^YZBlock)(void);

// 返回值为Block的函数
//YZBlock myblock()
//{
//    int a = 6;
//    return ^{
//        NSLog(@"--------- %d",a);
//    };
//}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSArray *array = @[@1,@4,@5];
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            // code
        }];
        
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            
        });
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            //code to be executed after a specified delay
        });
        
        
        int b = 20;
        YZBlock Block2 = ^{
            NSLog(@"abc %d",b);
        };
         NSLog(@" [Block2 class] = %@", [Block2 class]);
        
        
//        YZBlock Block = myblock();
//        Block();
//        NSLog(@" [Block class] = %@", [Block class]);
        
//
//        void (^block)(void) =  ^{
//            NSLog(@"123");
//        };
//
//        NSLog(@"没有访问auto block.class = %@",[block class]);
//
//
//        auto int a = 10;
//        void (^block1)(void) =  ^{
//            NSLog(@"a = %d",a);
//        };
//
//        NSLog(@"访问了auto block1.class = %@",[block1 class]);
//
//
//        NSLog(@"访问量auto 并且copy block1-copy.class = %@",[[block1 class] copy]);
        
        
//        NSLog(@"block.class.superclass = %@",[[block class] superclass]);
//        NSLog(@"block.class.superclass.superclass = %@",[[[block class] superclass] superclass]);
//        NSLog(@"block.class.superclass.superclass.superclass = %@",[[[[block class] superclass] superclass] superclass]);
//        block();
        
//        static int height  = 30;
//        int age = 20;
//        void (^block)(void) =  ^{
//            NSLog(@"age1 is %d height1 = %d",age1,height1);
//        };
//        age1 = 25;
//        height1 = 35;
//        block();
        
      
        
      

    }
    return 0;
}

//void test1(){
//
//    struct __main_block_impl_0 {
//        struct __block_impl impl;
//        struct __main_block_desc_0* Desc;
//        int age;
//        //构造函数(类似于OC中的init方法) _age是外面传入的
//        __main_block_impl_0(void *fp, struct __main_block_desc_0 *desc, int _age, int flags=0) : age(_age) {
//            //isa指向_NSConcreteStackBlock 说明block就是_NSConcreteStackBlock类型的
//            impl.isa = &_NSConcreteStackBlock;
//            impl.Flags = flags;
//            impl.FuncPtr = fp;
//            Desc = desc;
//        }
//    };
//    //封装了block执行逻辑的函数
//    static void __main_block_func_0(struct __main_block_impl_0 *__cself) {
//        int age = __cself->age; // bound by copy
//
//        NSLog((NSString *)&__NSConstantStringImpl__var_folders_x4_920c4yq936b63mvtj4wmb32m0000gn_T_main_7f3f1b_mi_0,age);
//    }
//
//    static struct __main_block_desc_0 {
//        size_t reserved;
//        size_t Block_size; // 结构体__main_block_impl_0 占用的内存大小
//    } __main_block_desc_0_DATA = { 0, sizeof(struct __main_block_impl_0)};
//
//
//    int main(int argc, const char * argv[]) {
//        /* @autoreleasepool */ { __AtAutoreleasePool __autoreleasepool;
//
//            int age = 20;
//            // block的定义
//            void (*block)(void) = ((void (*)())&__main_block_impl_0((void *)__main_block_func_0, &__main_block_desc_0_DATA, age));
//            // block的调用
//            ((void (*)(__block_impl *))((__block_impl *)block)->FuncPtr)((__block_impl *)block);
//            NSLog((NSString *)&__NSConstantStringImpl__var_folders_x4_920c4yq936b63mvtj4wmb32m0000gn_T_main_7f3f1b_mi_1);
//        }
//        return 0;
//    }
//}
