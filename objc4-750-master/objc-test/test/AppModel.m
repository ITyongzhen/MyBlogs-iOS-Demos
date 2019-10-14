//
//  AppModel.m
//  objc-test
//
//  Created by eagle on 2019/8/8.
//

#import "AppModel.h"

@implementation AppModel

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static AppModel *cls;
    dispatch_once(&onceToken, ^{
        cls = [[[self class] alloc] init];
    });
    return cls;
}


/**
 获取单例

 @param moduleName 类名
 @return 返回单例对象
 */
- (id)getModule:(NSString *)moduleName{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    return [NSClassFromString(moduleName) performSelector:NSSelectorFromString(@"sharedInstance")];
#pragma clang diagnostic pop
}


/**
 判断类是否可以对方法响应

 @param module 类名
 @param funcName 方法名
 @return 能否响应
 */
-(BOOL)moduleIsHaveFunc:(id)module FuncName:(NSString*)funcName
{
    return [module respondsToSelector:NSSelectorFromString(funcName)];
}


/**
 利用performSelector调用函数

 @param moduleName 类名
 @param funcName 方法名
 @param parms 参数，是个数组
 @param hasReturn 是否有返回值
 @return 返回值，如果没有返回值，就返回nil
 */
-(id)runModuleFunc:(NSString *)moduleName :(NSString *)funcName :(NSArray *)parms hasReturn:(BOOL)hasReturn{
    id ret = nil;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    id rxModule = [self getModule:moduleName];
    if (rxModule) {
        if ([self moduleIsHaveFunc:rxModule FuncName:funcName]) {
            if (hasReturn) {
                if (parms == nil || parms.count ==0) {
                    ret = [rxModule performSelector:NSSelectorFromString(funcName)];
                }else if (parms.count == 1){
                    ret = [rxModule performSelector:NSSelectorFromString(funcName) withObject:parms[0]];
                }else if ([parms count] == 2){
                    ret = [rxModule performSelector:NSSelectorFromString(funcName) withObject:parms[0] withObject:parms[1]];
                }
            }else{
                if (parms == nil || [parms count] == 0) {
                    [rxModule performSelector:NSSelectorFromString(funcName)];
                }else if ([parms count] == 1){
                    [rxModule performSelector:NSSelectorFromString(funcName) withObject:parms[0]];
                }else if ([parms count] == 2){
                    [rxModule performSelector:NSSelectorFromString(funcName) withObject:parms[0] withObject:parms[1]];
                }
            }
        }
    }
#pragma clang diagnostic pop
    return ret;
}
@end
