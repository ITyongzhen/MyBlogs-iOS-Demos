//
//  AppModel.h
//  objc-test
//
//  Created by eagle on 2019/8/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppModel : NSObject
+ (instancetype)sharedInstance;
-(id)runModuleFunc:(NSString *)moduleName :(NSString *)funcName :(NSArray *)parms hasReturn:(BOOL)hasReturn;
@end

NS_ASSUME_NONNULL_END
