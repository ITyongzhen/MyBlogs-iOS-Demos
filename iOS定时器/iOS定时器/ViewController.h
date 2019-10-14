//
//  ViewController.h
//  iOS定时器
//
//  Created by eagle on 2018/8/16.
//  Copyright © 2018 yongzhen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) NSTimer *timer;
@property (nonatomic,strong) CADisplayLink *link;
@property (strong, nonatomic) dispatch_source_t GCDtimer;
@property (nonatomic,strong) NSString *name;

@end

