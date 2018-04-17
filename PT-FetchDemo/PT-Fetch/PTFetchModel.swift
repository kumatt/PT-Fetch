//
//  PTFetchModel.swift
//  PT-FetchDemo
//
//  Created by ZhangJian on 2018/4/17.
//  Copyright © 2018年 Kang. All rights reserved.
//
//数据请求处理

import UIKit

typealias FetchBlock = (_:Any) -> Void

protocol PTFetchProtocol {
    
    /// 拼接请求路径
    func appentUrlWithShortUrl(url:String!) -> String?
    
    /// 拼接配置参数
    func appentParamentsWithShortParament(parament:Dictionary<String,Any>!) -> Dictionary<String,Any>?
    
    /// 根据规则筛选数据
    func dealRulesWith(data:Data,success:FetchBlock,failure:FetchBlock)
    
    ///处理错误信息
    func dealErrorData(error:Any) -> Any
}


class PTFetchModel: NSObject {
    
    static var fetchDelegate:PTFetchProtocol?
    class func delegate(delegate:PTFetchProtocol) {
        fetchDelegate = delegate
    }
    
    //MARK:deal data
    var responseObject:Data?{
        set{
            assert(PTFetchModel.fetchDelegate != nil, "PTFetchModel 必须设置 代理对象")
            PTFetchModel.fetchDelegate?.dealRulesWith(data: newValue!, success: self.succeess!, failure: self.failure!)
        }
        get{
            return nil
        }
    }
    
    var errorInfo:Any?{
        set{
            assert(PTFetchModel.fetchDelegate != nil, "PTFetchModel 必须设置 代理对象")
            if (self.failure != nil) {
                self.failure!(PTFetchModel.fetchDelegate?.dealErrorData(error: newValue as Any)as Any)
            }
        }
        get{
            return nil
        }
    }
    
    //MARK:fetch configure
    /// 请求路径
    var urlString:String {
        set{
            _urlString = newValue
        }
        get{
            assert(PTFetchModel.fetchDelegate != nil, "PTFetchModel 必须设置 代理对象")
            return (PTFetchModel.fetchDelegate?.appentUrlWithShortUrl(url: _urlString))!
        }
    }
    private var _urlString:String?
    
    /// 请求参数
    var paraments:Dictionary<String,Any> {
        set{
            _paraments = newValue
        }
        get{
            assert(PTFetchModel.fetchDelegate != nil, "PTFetchModel 必须设置 代理对象")
            return (PTFetchModel.fetchDelegate?.appentParamentsWithShortParament(parament: _paraments))!
        }
    }
    private var _paraments:Dictionary<String,Any>?
    
    //MARK:upload configure
    ///上传数据
    var uploadData:Data?

    /// 上传文件名（参数）
    var uploadName:String?
    
    /// 文件拓展名（例如png、jpeg、gif、tiff等）
    var contentType:String?
    
    /// 类型名（例如image`/`*等）
    var mimeType:String?
    
    //MARK:bLOCK
    
    ///成功回调
    var succeess:FetchBlock?
    
    /// 失败回调
    var failure:FetchBlock?
    
    /// 请求进度
    var progressing:FetchBlock?


    
    
}
