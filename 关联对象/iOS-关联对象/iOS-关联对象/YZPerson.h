//
//  YZPerson.h
//  iOS-关联对象
//
//  Created by eagle on 2019/7/9.
//  Copyright © 2019 yongzhen. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface YZPerson : NSObject

{
    int _age;
}
- (void)setAge:(int)age;
- (int)age;


//@property (assign, nonatomic) int age;


@end

