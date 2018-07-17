//
//  ViewController.swift
//  PT-FetchDemo
//
//  Created by ZhangJian on 2018/4/17.
//  Copyright © 2018年 Kang. All rights reserved.
//

import UIKit
//import PTFetch

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        fetch()
    }

    func fetch() {
        
        let uploadData = PTFetchUploadData();
        uploadData.uploadName = "user_picture"
        uploadData.uploadData = UIImagePNGRepresentation(UIImage.init(named: "关闭")!)
        uploadData.contentType = "png"
        uploadData.mimeType = "image/*"
        
        
        let fetchModel:MyFetchTarget = MyFetchTarget()
        fetchModel.urlString = "http://www.ccc"
        
        fetchModel.uploadDatas = [uploadData];
        
        fetchModel.succeess = {(_:Any) in
            
        }
        fetchModel.failure  = {(_:Any) in
            
        }
        
        PTFetchManager.Fetch_UploadData(fetchModel: fetchModel)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

