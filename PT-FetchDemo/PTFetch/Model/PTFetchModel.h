//
//  PTFetchModel.h
//  PT-FetchDemo
//
//  Created by BlanBok on 2017/12/18.
//  Copyright © 2017年 OComme. All rights reserved.
//
/*
 创建对象：admin
 功能描述：数据请求模型
 所处位置：
 创建版本：V 0.1
 ---Edit-----------------------
 修改对象：
 修改版本：
 修改描述：
 */
#import <Foundation/Foundation.h>
#import "PTFetchDelegate.h"

@interface PTFetchModel : NSObject

/**
 设置代理执行者

 @param delegate 代理对象
 */
+ (void)Fetch_setDelegateClass:(Class<PTFetchDelegate> _Nonnull)delegate;

/**
 合理性验证
 */
+ (void)Fetch_VerificationReasonableness;

//=============================forDeal Data======================================
/**
 待处理请求的结果数据
 */
@property (nullable,nonatomic,strong) NSData* responseObject;

/**
 待处理的错误信息
 */
@property (nullable,nonatomic,strong) id error;

//=============================fetch configure======================================
/**
 请求路径
 */
@property (nonnull,nonatomic,copy) NSString *urlString;

/**
 请求参数
 */
@property (nonnull,nonatomic,strong) NSDictionary *parameters;

//=============================upload configure===================================
/**
 上传数据
 */
@property (nonnull,nonatomic,strong) NSData *uploadData;

/**
 上传文件名（参数）
 */
@property (nonnull,nonatomic,copy) NSString *uploadName;

/**
 文件拓展名（例如png、jpeg、gif、tiff等）
 */
@property (nonnull,nonatomic,copy) NSString *contentType;

/**
 类型名（例如image`/`*等）
 */
@property (nonnull,nonatomic,copy) NSString *mimeType;


//=============================block======================================
/**
 请求成功回调
 */
@property (nonatomic,copy) void(^ _Nullable success)(id _Nullable responseObject);


/**
 请求失败回调
 */
@property (nonatomic,copy) void(^ _Nullable failure)(id _Nullable error);

/**
 请求进度
 */
@property (nonatomic,copy) void(^ _Nullable progressing)(NSProgress * _Nonnull progress);


@end
