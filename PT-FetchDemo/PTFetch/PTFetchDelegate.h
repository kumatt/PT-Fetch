//
//  PTFetchDelegate.h
//  PT-FetchDemo
//
//  Created by BlanBok on 2017/12/18.
//  Copyright © 2017年 OComme. All rights reserved.
//
/*
 创建对象：admin
 功能描述：数据请求的处理方式
 所处位置：
 创建版本：V 0.1
 ----修改对象：
 修改版本：
 修改描述：
 */
#import <Foundation/Foundation.h>

@protocol PTFetchDelegate <NSObject>

/**
 获取完整的路径

 @param urlString 传入路径字符串
 @return 完整路径
 */
+ (NSString* _Nonnull)FetchDelegate_setFullUrlStringWithUrlString:(NSString*_Nonnull)urlString;

/**
 获取完整的配置参数

 @param parameter 传入的配置参数
 @return 完整的配置参数
 */
+ (NSDictionary* _Nonnull)FetchDelegate_getFullParametersWithParameter:(NSDictionary*_Nonnull)parameter;


/**
 处理获取的数据

 @param data 请求到的二进制数据
 @param success 成功回调
 @param failure 失败回调
 */
+ (void)FetchDelegate_setRulesWithData:(NSData* _Nullable)data success:(void (^ __nullable)(id _Nullable responseObject))success failure:(void (^ __nullable)(id _Nullable error))failure;

/**
 错误信息处理
 
 @param error 错误信息
 @return 处理后的错误信息，建议使用自定义的ErrorModel
 */
+ (id _Nullable)FetchDelegate_FailWithError:(id _Nullable)error;

@end
