//
//  PublicFetchTarget.swift
//  PT-FetchDemo
//
//  Created by ZhangJian on 2018/4/17.
//  Copyright © 2018年 Kang. All rights reserved.
//

import UIKit

class PublicFetchTarget: PTFetchProtocol {
    
    /// 对数据的处理结果抛错
    enum PublicFetchError:Error {
        /// 数据解析错误
        case NullData
        
        /// 后台提示错误信息
        case ErrorMessage
        
        /// 未知错误
        case UnknownError
    }
    
    func dealDataInZhangGui(data:Data) throws -> Dictionary<String,Any> {
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
    
    func dealRulesWith(data: Data, success: (Any) -> Void, failure: (Any) -> Void) {
        do{
            let dict:Dictionary<String,Any> = try dealDataInZhangGui(data: data)
            success(dict)
        }
        catch{
            switch error {
            case PublicFetchError.NullData:
                failure("空数据")
            case PublicFetchError.UnknownError:
                failure("数据异常")
            case PublicFetchError.ErrorMessage:
                do {
                    failure((try!JSONSerialization.jsonObject(with: data, options: .allowFragments) as? Dictionary<String,Any>)!["message"]! as Any)
                }
            default:
                failure("网络异常")
            }
        }
    }
    
    func appentUrlWithShortUrl(url: String!) -> String? {
        return String(url)
    }
    
    func appentParamentsWithShortParament(parament: Dictionary<String, Any>!) -> Dictionary<String, Any>? {
        return parament
    }
    
    func dealErrorData(error: Any) -> Any {
        if error is String {
            return error
        }
        return "网络异常"
    }

}
