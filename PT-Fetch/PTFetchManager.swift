//
//  PTFetchManager.swift
//  PT-FetchDemo
//
//  Created by ZhangJian on 2018/4/17.
//  Copyright © 2018年 Kang. All rights reserved.
//
//  request model

import UIKit

public class PTFetchManager: NSObject {
    
    //single instance
    static let sharedInstance = PTFetchManager()
    private override init() {} //This prevents others from using the default '()' initializer for this class.
    
    public class func request(with fetchModel:PTFetchModel , method:HTTPMethod ,headers: HTTPHeaders? = nil, succeed:@escaping PTFetchBlock = {_ in},failued:@escaping PTFetchBlock = {_ in}) {
        Alamofire.request(URL.init(string: fetchModel.url)!, method: method, parameters: fetchModel.paraments, headers: headers).responseData { (responseData) in
            let (enable,resultDict) = fetchModel.delegate.filteredResponseData(data: responseData)
            enable ? succeed(resultDict as Any) : failued(resultDict as Any)
        }
    }
    
    public class func upload(with fetchModel:PTFetchModel,progressHandler:@escaping (Progress) -> Void = {_ in},succeed:@escaping PTFetchBlock = {_ in},failued:@escaping PTFetchBlock = {_ in}) {
        assert(fetchModel.uploadDatas != nil,"uploadData can not be nil")

        let formatter:DateFormatter = DateFormatter.init()
        formatter.dateFormat = "yyyyMMddHHmmss";
        
        //Upload to server
        // 参数解释：
        //withName:和后台服务器的name要一致 ；fileName:可以充分利用写成用户的id，但是格式要写对； mimeType：规定的，要上传其他格式可以自行百度查一下
        //如果需要上传多个文件,就多添加几个
        //multipartFormData.append(imageData, withName: "file", fileName: "123456.jpg", mimeType: "image/jpeg")
        Alamofire.upload(
            multipartFormData: { multipartFormData in
                for (index,dataModel) in fetchModel.uploadDatas!.enumerated(){
                    let fileName:String = "\(formatter.string(from: Date.init()))\(String(describing: dataModel.contentType))"+"-"+String(index)
                    multipartFormData.append(dataModel.uploadData!, withName: dataModel.uploadName!, fileName: fileName, mimeType: dataModel.mimeType!)
                }
                
        },to: fetchModel.url,encodingCompletion: { encodingResult in
            
            switch encodingResult {
            case .success(let upload, _, _):
                //The processing of json after a successful connection to the server
                upload.responseData(completionHandler: { (responseData) in
                    let (enable,resultDict) = fetchModel.delegate.filteredResponseData(data: responseData)
                    enable ? succeed(resultDict as Any) : failued(resultDict as Any)
                })
                
                //Get upload progress
                upload.uploadProgress(queue: DispatchQueue.global(qos: .utility), closure: progressHandler)
            case .failure(let encodingError):
                //Print connection failed
                failued(fetchModel.delegate.mapErrorData(error: encodingError))
            }
        })
        
    }
    
}
