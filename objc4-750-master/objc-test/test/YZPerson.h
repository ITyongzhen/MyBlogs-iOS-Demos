//
//  YZPerson.h
//  objc-test
//
//  Created by eagle on 2019/8/8.
//

#import <Foundation/Foundation.h>
#import "Car.h"

@interface YZPerson : NSObject
+ (instancetype)sharedInstance;
- (void)run;

- (void)getDoubleWithPrice:(Car*)car;
@end

