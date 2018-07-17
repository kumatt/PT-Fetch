//
//  PTFetchUploadData.swift
//  Alamofire
//
//  Created by Mac on 2018/7/17.
//

import UIKit

class PTFetchUploadData: NSObject {

    public var uploadData:Data?
    
    public var uploadName:String?
    
    /// File extensions （such as: png、jpeg、gif、tiff,etc）
    public var contentType:String?
    
    ///Type name (for example image`/`*, etc.)
    public var mimeType:String?
}
