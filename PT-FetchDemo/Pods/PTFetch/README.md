# PTFetch

`PTFetch`本质上是基于面向接口的思想，对 [Alamofire](https://github.com/Alamofire/Alamofire) 的二次封装。

# PTFetchModel

作为数据请求配置模型，所有在HTTP请求中需要的参数和回调都在这里配置。

它不能被直接使用，需创建其子类，遵循`PTFetchProtocol`协议的方法，以此作为请求模型的定制。

```Swift
public typealias PTFetchBlock = (_:Any) -> Void

@objc public protocol PTFetchProtocol {
    
    func urlByAppending(url:String!) -> String?
    
    func paramentByAppending(parament:Dictionary<String,Any>!) -> Dictionary<String,Any>?
    
    /// Filter target data according to rules
    func filteredResponseData(data:Data,success:PTFetchBlock?,failure:PTFetchBlock?)
    
    /// Processing error message
    func mapErrorData(error:Any?) -> Any
}
```

# PTFetchManager

作为请求的主体对象，使用`PTFetchModel`进行数据请求

```Swift
public class func Fetch_PostData(fetchModel:PTFetchModel!) 
   
public class func Fetch_GetData(fetchModel:PTFetchModel!) 
   
public class func Fetch_DeleteData(fetchModel:PTFetchModel!) 
    
public class func Fetch_PutData(fetchModel:PTFetchModel!) 
   
public class func Fetch_UploadData(fetchModel:PTFetchModel!)
```

如果你想要将这个工具导入你的项目 请使用

`pod 'PTFetch', :git=> 'https://github.com/OComme/PT-FetchObjc'`


