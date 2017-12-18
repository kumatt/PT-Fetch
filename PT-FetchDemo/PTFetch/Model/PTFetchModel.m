//
//  PTFetchModel.m
//  PT-FetchDemo
//
//  Created by BlanBok on 2017/12/18.
//  Copyright © 2017年 OComme. All rights reserved.
//

#import "PTFetchModel.h"

@implementation PTFetchModel
static Class<PTFetchDelegate> fetchDelegate = nil;

+ (void)Fetch_setDelegateClass:(Class<PTFetchDelegate>)delegate
{
    fetchDelegate = delegate;
}

+(void)Fetch_VerificationReasonableness
{
    NSAssert(fetchDelegate, @"PTFetchModel需配置 Fetch_setDelegateClass:类方法");
    NSAssert([fetchDelegate conformsToProtocol:@protocol(PTFetchDelegate)], @"Fetch_setDelegateClass:类方法配置参数需遵恤PTFetchDelegate代理方法");
}

- (NSString *)urlString
{
    return [fetchDelegate FetchDelegate_setFullUrlStringWithUrlString:_urlString];
}

- (NSDictionary *)parameters
{
    return [fetchDelegate FetchDelegate_getFullParametersWithParameter:_parameters];
}

#pragma mark-set
- (void)setResponseObject:(NSData *)responseObject
{
    [fetchDelegate FetchDelegate_setRulesWithData:responseObject success:self.success failure:self.failure];
}

- (void)setError:(id)error
{
    if (self.failure) {
        self.failure([fetchDelegate FetchDelegate_FailWithError:error]);
    }
}

@end
