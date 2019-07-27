//
//  Person.h
//  objc-test
//
//  Created by eagle on 2018/8/3.
//

#import <Foundation/Foundation.h>


@interface Person : NSObject
@property (nonatomic,strong) NSString *name;
- (void)speak;
+ (void)test;
- (void)run;
+ (void)run;
@end

