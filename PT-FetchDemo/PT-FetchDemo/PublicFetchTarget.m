//
//  PublicFetchTarget.m
//  PT-FetchDemo
//
//  Created by BlanBok on 2017/12/18.
//  Copyright © 2017年 OComme. All rights reserved.
//

#import "PublicFetchTarget.h"

@implementation PublicFetchTarget

+ (NSString *)FetchDelegate_setFullUrlStringWithUrlString:(NSString *)urlString
{
    return urlString;
}

+ (NSDictionary *)FetchDelegate_getFullParametersWithParameter:(NSDictionary *)parameter
{
    return parameter;
}

+ (void)FetchDelegate_setRulesWithData:(NSData *)data success:(void (^)(id _Nullable))success failure:(void (^)(id _Nullable))failure
{
    if (success) {
        success(data);
    }
}

+ (id)FetchDelegate_FailWithError:(id)error
{
    return error;
}

@end
