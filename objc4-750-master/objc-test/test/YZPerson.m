//
//  YZPerson.m
//  objc-test
//
//  Created by eagle on 2019/8/8.
//

#import "YZPerson.h"

@implementation YZPerson

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static YZPerson *cls;
    dispatch_once(&onceToken, ^{
        cls = [[[self class] alloc] init];
    });
    return cls;
}

- (void)run{
    NSLog(@"%s",__func__);
}


- (void)getDoubleWithPrice:(Car*)car{
     NSLog(@"%s",__func__);
    NSLog(@"getImpAddressWithObject 中car地址 %p",car);
   
}




@end
