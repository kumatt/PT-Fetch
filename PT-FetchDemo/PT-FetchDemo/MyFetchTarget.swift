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
    func urlByAppending(url: String?) -> String {
        return url ?? ""
    }
    
    func paramentByAppending(parament: Dictionary<String, Any>?) -> Dictionary<String, Any> {
        return parament ?? Dictionary.init()

    }
    
    func filteredResponseData(data: DataResponse<Data>) -> (Bool, Any?) {
        if data.result.value?.isEmpty == true {
            return (false,mapErrorData(error: nil))
        }
        guard let dict = try!JSONSerialization.jsonObject(with: data.result.value!, options: .allowFragments) as? Dictionary<String,Any> else{
            return (false,mapErrorData(error: nil))
        }
        if dict["code"] as? Int == 0 || (dict["message"] as? String) != nil {
            return (false,mapErrorData(error: dict))
        }
        return (true,dict)
    }
        
    func mapErrorData(error: Any?) -> Any {
        if error is String {
            return error!
        }
        return "网络异常"
    }
    

}
