//
//  ViewController.m
//  iOS定时器
//
//  Created by eagle on 2018/8/16.
//  Copyright © 2018 yongzhen. All rights reserved.
//

#import "ViewController.h"
#import "YZVC.h"
#import "YZProxy.h"


@interface ViewController ()
{
    __weak NSString *string_weak;
}

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    int a = 10;
    void(^ __weak block)() = ^{
        NSLog(@"a = %d", a);
    };
    NSLog(@"%@", block);
    
    NSString *str = [NSString stringWithFormat:@"abc"];
    NSString *str2 = [NSString stringWithFormat:@"abcabcabcabcabcabcabc"];
    [self test2];
}

-(void) test2{
    
    // 场景一
//        NSString *str =  [NSString stringWithFormat:@"https://ityongzhen.github.io/"];
//        string_weak = str;
    
    // 场景二
    //    @autoreleasepool {
    //        NSString *str =  [NSString stringWithFormat:@"https://ityongzhen.github.io/"];
    //        string_weak = str;
    //    }
    
    NSLog(@"%@",[NSRunLoop currentRunLoop]);
    //    // 场景三
    NSString *str = nil;
    @autoreleasepool {
        str =  [NSString stringWithFormat:@"abc"];
        string_weak = str;
    }
    NSLog(@"string: %@ %s", string_weak,__func__);
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"string: %@ %s", string_weak,__func__);
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"string: %@ %s", string_weak,__func__);
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //  [self.timer invalidate];
    
}
-(void)test3{
    @autoreleasepool {
        NSObject *obj = [[NSObject alloc] init];
    }
    
}
-(void)test{
    
    NSNumber *number1 = @4;
    NSNumber *number2 = @5;
    NSNumber *number3 = @(0xFFFFFFFFFFFFFFF);
    NSString *str = [NSString stringWithFormat:@"1"];;
    NSString *str1 = [NSString stringWithFormat:@"2"];;
    NSString *str2 = [NSString stringWithFormat:@"3"];;
    NSString *str3 = [NSString stringWithFormat:@"4"];;
    NSLog(@"%p %p %p %p %p %p %p ", number1, number2, number3,str,str1,str2,str3);
    //    dispatch_queue_t defaultQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0);
    //
    //    for (int i = 0; i<1000; i++) {
    //        dispatch_async(defaultQueue, ^{
    //            self.name = [NSString stringWithFormat:@"abcaaafdfasdfasfasdsa"];
    //        });
    //    }
}
- (void)GCDTest
{
    
    // 主队列
    //    dispatch_queue_t queue = dispatch_get_main_queue();
    
    // 创建一个队列
    dispatch_queue_t queue = dispatch_queue_create("timer", DISPATCH_QUEUE_SERIAL);
    
    // 创建定时器
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    // 设置时间
    uint64_t start = 2.0; // 2秒后开始执行
    uint64_t interval = 1.0; // 每隔1秒执行
    dispatch_source_set_timer(timer,
                              dispatch_time(DISPATCH_TIME_NOW, start * NSEC_PER_SEC),
                              interval * NSEC_PER_SEC, 0);
    
    // 设置回调
    //    dispatch_source_set_event_handler(timer, ^{
    //        NSLog(@"1111");
    //    });
    dispatch_source_set_event_handler_f(timer, timerFire);
    
    // 启动定时器
    dispatch_resume(timer);
    
    self.GCDtimer = timer;
}

void timerFire(void *param)
{
    NSLog(@"2222 - %@", [NSThread currentThread]);
}



- (void)CADisplayLinkTest{
    // 调用频率和屏幕的刷新帧率一致，60FPS
    self.link = [CADisplayLink displayLinkWithTarget:self selector:@selector(test)];
    [self.link addToRunLoop:[NSRunLoop currentRunLoop]  forMode:NSDefaultRunLoopMode];
    
}


- (void)NSTimerTest{
    
    //    __weak typeof(self) weakSelf = self;
    //
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:[YZProxy proxyWithTarget:self] selector:@selector(test) userInfo:nil repeats:YES];
    
    //    self.timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(test) userInfo:nil repeats:YES];
    //    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
    
    //    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
    //        [weakSelf test];
    //    }];
    
    
}



//- (void)test{
//    NSLog(@"%s",__func__);
//}


-(void)dealloc{
    NSLog(@"%s",__func__);
    [self.timer invalidate];
}

@end
