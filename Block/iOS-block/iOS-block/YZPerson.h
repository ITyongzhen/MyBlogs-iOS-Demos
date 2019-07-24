//
//  YZPerson.h
//  iOS-block
//
//  Created by eagle on 2019/7/18.
//  Copyright © 2019 yongzhen. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^YZBlock) (void);

@interface YZPerson : NSObject
@property (copy, nonatomic) YZBlock block;
@property (assign, nonatomic) int age;
@end
