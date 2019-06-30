//
//  YZPerson.h
//  KVCDemo
//
//  Created by eagle on 2019/6/30.
//  Copyright © 2019 yongzhen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YZPerson : NSObject
{
@public
        int age;
        int isAge;
        int _isAge;
        int _age;
}
@property (nonatomic,strong) NSString *name;
@end

NS_ASSUME_NONNULL_END
