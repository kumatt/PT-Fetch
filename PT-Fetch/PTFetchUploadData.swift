//
//  PTFetchUploadData.swift
//  Alamofire
//
//  Created by Mac on 2018/7/17.
//
//  上传数据

import UIKit

public class PTFetchUploadData: NSObject {

    /// 上传数据
    public var uploadData:Data?
    
    /// 数据标识名
    public var uploadName:String?
    
    /// File extensions （such as: png、jpeg、gif、tiff,etc）
    public var contentType:String?
    
    ///Type name (for example image`/`*, etc.)
    public var mimeType:String?
}
