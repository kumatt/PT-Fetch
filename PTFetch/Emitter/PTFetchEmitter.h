//
//  PTFetchEmitter.h
//  PT-FetchDemo
//
//  Created by BlanBok on 2017/12/18.
//  Copyright © 2017年 OComme. All rights reserved.
//
/*
 创建对象：admin
 功能描述：数据请求处理
 所处位置：
 创建版本：V 0.1
---Edit-----------------------
 修改对象：
 修改版本：
 修改描述：
*/

#import <Foundation/Foundation.h>
#import "PTFetchModel.h"

@interface PTFetchEmitter : NSObject

/**
 POST 请求
 
 @param fetchModel 参数模型
 */
+ (void)POSTDataWithFetchModel:(PTFetchModel*_Nonnull)fetchModel;

/**
 GET 请求
 
 @param fetchModel 参数模型
 */
+ (void)GETDataWithFetchModel:(PTFetchModel*_Nonnull)fetchModel;

/**
 delete 请求
 
 @param fetchModel 参数模型
 */
+ (void)DELETEDataWithFetchModel:(PTFetchModel*_Nonnull)fetchModel;


/**
 put 请求
 
 @param fetchModel 参数模型
 */
+ (void)PUTDataWithFetchModel:(PTFetchModel*_Nonnull)fetchModel;

/**
 上传数据
 
 @param fetchModel 参数模型
 */
+ (void)UPLOADDataWithFetchModel:(PTFetchModel*_Nonnull)fetchModel;

@end

