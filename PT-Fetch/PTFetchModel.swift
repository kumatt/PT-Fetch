//
//  PTFetchModel.swift
//  PT-FetchDemo
//
//  Created by ZhangJian on 2018/4/17.
//  Copyright © 2018年 Kang. All rights reserved.
//
//  request processing

import UIKit

public typealias PTFetchBlock = (_:Any) -> Void

@objc public protocol PTFetchProtocol {
    
    func urlByAppending(url:String!) -> String?
    
    func paramentByAppending(parament:Dictionary<String,Any>!) -> Dictionary<String,Any>?
    
    /// Filter target data according to rules
    func filteredResponseData(data:Data,success:PTFetchBlock?,failure:PTFetchBlock?)
    
    /// Processing error message
    func mapErrorData(error:Any?) -> Any
}


open class PTFetchModel: NSObject {
    
    private var delegate:PTFetchProtocol!
    
    required override public init() {
        super.init();
        assert(self.conforms(to: PTFetchProtocol.self), (String(describing: self.classForCoder) + "should conform PTFetchProtocol"))
        self.delegate = self as! PTFetchProtocol;
    }
    
    //MARK:deal data
    public func setResponseData(responseData:Data?){
        self.delegate.filteredResponseData(data: responseData!, success: self.succeess, failure: self.failure)
    }
    
    public func setErrorInfo(errorInfo:Any?){
        if self.failure != nil {
            self.failure!(self.delegate.mapErrorData(error: errorInfo));
        }
    }
    
    //MARK:fetch configure
    /// request path
    public var urlString:String {
        set{
            _urlString = newValue
        }
        get{
            if _urlString?.count == 0 {
                return "";
            }
            return self.delegate.urlByAppending(url: _urlString)!;
        }
    }
    private var _urlString:String?
    
    /// request parameters
    public var paraments:Dictionary<String,Any> {
        set{
            _paraments = newValue
        }
        get{
            if _paraments?.count == 0 {
                return Dictionary.init();
            }
            return (self.delegate.paramentByAppending(parament: _paraments))!
        }
    }
    private var _paraments:Dictionary<String,Any>?
    

    var uploadDatas:Array<PTFetchUploadData>?
    
    //MARK:block
    
    public var succeess:PTFetchBlock?
    
    public var failure:PTFetchBlock?
    
    public var progressing:PTFetchBlock?
    
}
