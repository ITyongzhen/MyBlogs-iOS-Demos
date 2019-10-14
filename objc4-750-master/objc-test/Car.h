//
//  Car.h
//  objc-test
//
//  Created by eagle on 2018/8/3.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject


@property (nonatomic,assign) int price;
- (void)run;
+ (void)run;
- (int)test:(int)age;
@end

