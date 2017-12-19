//
//  PTFetchEmitter.m
//  PT-FetchDemo
//
//  Created by BlanBok on 2017/12/18.
//  Copyright © 2017年 OComme. All rights reserved.
//

#import "PTFetchEmitter.h"

@interface PTFetchEmitter ()

/**
 HTTP会话管理
 */
@property (nonnull,nonatomic,strong) AFHTTPSessionManager *sessionManager;

@end

@implementation PTFetchEmitter

+ (instancetype)sharedFetchEmitter
{
    static PTFetchEmitter *fetchEmitter = nil;
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        fetchEmitter = [[self allocWithZone:NULL] init] ;
    });
    return fetchEmitter;
    
}

#pragma mark-API
+ (void)POSTDataWithFetchModel:(PTFetchModel *)fetchModel
{
    [PTFetchModel Fetch_VerificationReasonableness];
    [[self sharedFetchEmitter]postDataWithFetchModel:fetchModel];
}

+ (void)GETDataWithFetchModel:(PTFetchModel *)fetchModel
{
    [PTFetchModel Fetch_VerificationReasonableness];
    [[self sharedFetchEmitter]getDataWithFetchModel:fetchModel];
}

+ (void)DELETEDataWithFetchModel:(PTFetchModel *)fetchModel
{
    [PTFetchModel Fetch_VerificationReasonableness];
    [[self sharedFetchEmitter]deleteDataWithFetchModel:fetchModel];
}

+ (void)PUTDataWithFetchModel:(PTFetchModel *)fetchModel
{
    [PTFetchModel Fetch_VerificationReasonableness];
    [[self sharedFetchEmitter]putDataWithFetchModel:fetchModel];
}

+ (void)UPLOADDataWithFetchModel:(PTFetchModel *)fetchModel
{
    [PTFetchModel Fetch_VerificationReasonableness];
    [[self sharedFetchEmitter]UpLoadDataWithFetchModel:fetchModel];
    
}

#pragma mark-HTTPSession

- (void)postDataWithFetchModel:(PTFetchModel *)fetchModel
{
    [self.sessionManager POST:fetchModel.urlString parameters:fetchModel.parameters progress:fetchModel.progressing success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        fetchModel.responseObject = responseObject;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fetchModel.error = error;
    }];
}

- (void)getDataWithFetchModel:(PTFetchModel *)fetchModel
{
    [self.sessionManager GET:fetchModel.urlString parameters:fetchModel.parameters progress:fetchModel.progressing success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        fetchModel.responseObject = responseObject;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fetchModel.error = error;
    }];
}

- (void)deleteDataWithFetchModel:(PTFetchModel *)fetchModel
{
    [self.sessionManager DELETE:fetchModel.urlString parameters:fetchModel.parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        fetchModel.responseObject = responseObject;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fetchModel.error = error;
    }];
}

- (void)putDataWithFetchModel:(PTFetchModel *)fetchModel
{
    [self.sessionManager PUT:fetchModel.urlString parameters:fetchModel.parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        fetchModel.responseObject = responseObject;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fetchModel.error = error;
    }];
}


- (void)UpLoadDataWithFetchModel:(PTFetchModel *)fetchModel
{
    NSAssert(fetchModel.uploadData, @"uploadData can not be nil");
    NSAssert(fetchModel.uploadName, @"uploadName can not be nil");
    NSAssert(fetchModel.contentType, @"contentType can not be nil");
    NSAssert(fetchModel.mimeType, @"mimeType can not be nil");
    
    NSData *uploadData = fetchModel.uploadData;
    [self.sessionManager.requestSerializer setValue:@"no-cache" forHTTPHeaderField:@"Cache-Control"];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyyMMddHHmmss";
    NSString *str = [formatter stringFromDate:[NSDate date]];
    NSString *fileName = [NSString stringWithFormat:@"%@.%@", str,fetchModel.contentType];
    
    [self.sessionManager POST:fetchModel.urlString parameters:fetchModel.parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:uploadData name:fetchModel.uploadName fileName:fileName mimeType:fetchModel.mimeType];
    } progress:fetchModel.progressing success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        fetchModel.responseObject = responseObject;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fetchModel.error = error;
    }];
    
}

#pragma mark-lazyload
- (AFHTTPSessionManager *)sessionManager
{
    if (_sessionManager == nil) {
        _sessionManager = [AFHTTPSessionManager manager];
        _sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
        _sessionManager.requestSerializer.timeoutInterval = 10;
    }
    return _sessionManager;
}

@end
