//
//  ViewController.m
//  RunLoop
//
//  Created by eagle on 2019/6/15.
//  Copyright © 2019 yongzhen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
//void observeRunLoopActicities(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info)
//{
//    switch (activity) {
//        case kCFRunLoopEntry:
//            NSLog(@"kCFRunLoopEntry");
//            break;
//        case kCFRunLoopBeforeTimers:
//            NSLog(@"kCFRunLoopBeforeTimers");
//            break;
//        case kCFRunLoopBeforeSources:
//            NSLog(@"kCFRunLoopBeforeSources");
//            break;
//        case kCFRunLoopBeforeWaiting:
//            NSLog(@"kCFRunLoopBeforeWaiting");
//            break;
//        case kCFRunLoopAfterWaiting:
//            NSLog(@"kCFRunLoopAfterWaiting");
//            break;
//        case kCFRunLoopExit:
//            NSLog(@"kCFRunLoopExit");
//            break;
//        default:
//            break;
//    }
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    //    // 先到子线程
    //    dispatch_async(dispatch_get_global_queue(0, 0), ^{
    //        // 通过performSelector 回到主线程
    //        [self performSelectorOnMainThread:@selector(test) withObject:nil waitUntilDone:YES];
    //    });
    //
    //    [NSTimer scheduledTimerWithTimeInterval:2.0 repeats:NO block:^(NSTimer * _Nonnull timer) {
    //        NSLog(@"NSTimer");
    //    }];
    
    
    // 创建Observer
//        CFRunLoopObserverRef observer = CFRunLoopObserverCreate(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0, observeRunLoopActicities, NULL);
//        // 添加Observer到RunLoop中
//        CFRunLoopAddObserver(CFRunLoopGetMain(), observer, kCFRunLoopCommonModes);
//        // 释放
//        CFRelease(observer);
    
    
    
    // 创建Observer
//    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
//        switch (activity) {
//            case kCFRunLoopEntry: {
//                CFRunLoopMode mode = CFRunLoopCopyCurrentMode(CFRunLoopGetCurrent());
//                NSLog(@"kCFRunLoopEntry - %@", mode);
//                CFRelease(mode);
//                break;
//            }
//
//            case kCFRunLoopExit: {
//                CFRunLoopMode mode = CFRunLoopCopyCurrentMode(CFRunLoopGetCurrent());
//                NSLog(@"kCFRunLoopExit - %@", mode);
//                CFRelease(mode);
//                break;
//            }
//
//            default:
//                break;
//        }
//    });
//    // 添加Observer到RunLoop中
//    CFRunLoopAddObserver(CFRunLoopGetMain(), observer, kCFRunLoopCommonModes);
//    // 释放
//    CFRelease(observer);
    
    
}

-(void)timer{
    
    // NSDefaultRunLoopMode、UITrackingRunLoopMode才是真正存在的模式
    // NSRunLoopCommonModes并不是一个真的模式，它只是一个标记
    // 如果设置了NSRunLoopCommonModes  timer能在_commonModes数组中存放的模式下工作
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
    //    [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
    //        NSLog(@"%d", ++count);
    //    }];
}
-(void)test{
    NSLog(@"这个打印也是为了打断点");
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
        NSLog(@"这个打印只是为了打断点");
//    [NSTimer scheduledTimerWithTimeInterval:3.0 repeats:NO block:^(NSTimer * _Nonnull timer) {
//        NSLog(@"定时器-----------");
//    }];
}

@end
