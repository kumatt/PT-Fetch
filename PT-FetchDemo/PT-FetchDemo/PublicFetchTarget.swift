//
//  PublicFetchTarget.swift
//  PT-FetchDemo
//
//  Created by ZhangJian on 2018/4/17.
//  Copyright © 2018年 Kang. All rights reserved.
//

import UIKit

class PublicFetchTarget: PTFetchProtocol {
    func appentUrlWithShortUrl(url: String!) -> String? {
        return url
    }
    
    func appentParamentsWithShortParament(parament: Dictionary<String, Any>!) -> Dictionary<String, Any>? {
        return parament
    }
    
    func dealRulesWith(data: Data, success: (Any) -> Void, failure: (Any) -> Void) {
        
    }
    
    func dealErrorData(error: Any) -> Any {
        return error
    }
    
    
}
