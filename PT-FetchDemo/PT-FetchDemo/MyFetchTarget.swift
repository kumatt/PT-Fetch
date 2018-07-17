//
//  MyFetchTarget.swift
//  PT-FetchDemo
//
//  Created by Mac on 2018/7/17.
//  Copyright © 2018年 Kang. All rights reserved.
//

import UIKit
import PTFetch

class MyFetchTarget: PTFetchModel,PTFetchProtocol {

    /// 对数据的处理结果抛错
    enum PublicFetchError:Error {
        /// 数据解析错误
        case NullData
        
        /// 后台提示错误信息
        case ErrorMessage
        
        /// 未知错误
        case UnknownError
    }
    
    func dealResponseData(data:Data) throws -> Dictionary<String,Any> {
        if data.isEmpty {
            throw  PublicFetchError.NullData
        }
        let dict:Dictionary<String,Any> = (try!JSONSerialization.jsonObject(with: data, options: .allowFragments) as? Dictionary<String,Any>)!
        if dict.isEmpty {
            throw  PublicFetchError.NullData
        }
        if dict["code"] as? Int == 0 {
            return dict
        }
        if ((dict["message"] as? String) != nil) {
            throw PublicFetchError.ErrorMessage
        }
        throw PublicFetchError.UnknownError
    }
    
    func urlByAppending(url: String!) -> String? {
        return String(url)
    }
    
    func paramentByAppending(parament: Dictionary<String, Any>!) -> Dictionary<String, Any>? {
        return parament
    }
    
    func filteredResponseData(data: Data, success: PTFetchBlock?, failure: PTFetchBlock?) {
        do{
            let dict:Dictionary<String,Any> = try dealResponseData(data: data)
            if success != nil {
                success!(dict)
            }
        }
        catch{
            if failure == nil {
                return
            }
            switch error {
            case PublicFetchError.NullData:
                failure!("空数据")
            case PublicFetchError.UnknownError:
                failure!("数据异常")
            case PublicFetchError.ErrorMessage:
                do {
                    failure!((try!JSONSerialization.jsonObject(with: data, options: .allowFragments) as? Dictionary<String,Any>)!["message"]! as Any)
                }
            default:
                failure!("网络异常")
            }
         }
    }
        
    func mapErrorData(error: Any?) -> Any {
        if error is String {
            return error!
        }
        return "网络异常"
    }
    

}
