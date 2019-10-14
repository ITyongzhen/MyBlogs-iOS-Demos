//
//  main.m
//  iOS定时器
//
//  Created by eagle on 2018/8/16.
//  Copyright © 2018 yongzhen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
//for (int i = 0; i < 600; i++) {
//    NSObject *obj = [[NSObject alloc] init];
//}

extern void _objc_autoreleasePoolPrint(void);

int main(int argc, char * argv[]) {
    @autoreleasepool {
        for (int i = 0; i < 1600; i++) {
            NSObject *p3 = [[NSObject alloc] init];
        }
        _objc_autoreleasePoolPrint();
            //打印的时候，最里面的@autoreleasepool已经退出了
        
        
       
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
