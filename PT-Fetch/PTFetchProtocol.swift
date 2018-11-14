//
//  PTFetchProtocol.swift
//  PT-FetchDemo
//
//  Created by 小虎 on 2018/11/12.
//  Copyright © 2018 Kang. All rights reserved.
//
//  请求的数据处理协议

import Foundation
@_exported import Alamofire

public typealias PTFetchBlock = (_:Any) -> Void

public protocol PTFetchProtocol:NSObjectProtocol {
    
    func urlByAppending(url:String?) -> String
    
    func paramentByAppending(parament:Dictionary<String,Any>?) -> Dictionary<String,Any>
    
    /// Processing error message
    func mapErrorData(error:Any?) -> Any
    
    func filteredResponseData(data:DataResponse<Data>) -> (Bool,Any?)
    
}

extension PTFetchProtocol{
    func urlByAppending(url:String?) -> String{
        return url ?? String.init()
    }
    
    func paramentByAppending(parament:Dictionary<String,Any>?) -> Dictionary<String,Any>{
        return parament ?? Dictionary.init()
    }
}
