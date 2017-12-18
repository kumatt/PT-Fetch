# PTFetch
Encapsulation of network data requests

首先，创建一个实现`PTFetchDelegate`代理方法的类

```Objective-C
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

```

并将其配置给`PTFetchModel`

```Objective-C
/**
 设置代理执行者

 @param delegate 代理对象
 */
+ (void)Fetch_setDelegateClass:(Class<PTFetchDelegate> _Nonnull)delegate;
```

之后，便可直接调用`PTFetchEmitter`来进行数据请求

```Objective-C
PTFetchModel *fetchModel = [PTFetchModel new];

fetchModel.urlString = @"http://www.xxx.com/xx/xxx/xxx";
fetchModel.parameters = @{@"key":@"value"};

fetchModel.success = ^(id obj){
    NSLog(@"%@",obj);
};

fetchModel.failure = ^(id error){
    NSLog(@"%@",error);
};

fetchModel.progressing = ^(NSProgress * _Nonnull progress) {
    NSLog(@"%@",progress);
};

[PTFetchEmitter POSTDataWithFetchModel:fetchModel];
```
