//
//  PTFetchModel.swift
//  PT-FetchDemo
//
//  Created by ZhangJian on 2018/4/17.
//  Copyright © 2018年 Kang. All rights reserved.
//
//  请求的数据模型

import UIKit

open class PTFetchModel: NSObject {
    
    private(set) var delegate:PTFetchProtocol!
    
    required override public init() {
        super.init();
        assert((self as? PTFetchProtocol) != nil, (String(describing: self.classForCoder) + "should conform PTFetchProtocol"))
        self.delegate = (self as! PTFetchProtocol)
    }
    
    //MARK:fetch configure
    /// 请求路径
    public var url:String {
        set{
            _url = newValue
        }
        get{
            return delegate.urlByAppending(url: _url)
        }
    }
    private var _url:String?
    
    /// 配置参数
    public var paraments:Dictionary<String,Any> {
        set{
            _paraments = newValue
        }
        get{
            return delegate.paramentByAppending(parament: _paraments)
        }
    }
    private var _paraments:Dictionary<String,Any>?

    /// 上传文本数据
    public var uploadDatas:Array<PTFetchUploadData>?
    
}
