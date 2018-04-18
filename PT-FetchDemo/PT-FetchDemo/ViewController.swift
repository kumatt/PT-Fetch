//
//  ViewController.swift
//  PT-FetchDemo
//
//  Created by ZhangJian on 2018/4/17.
//  Copyright © 2018年 Kang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        fetch()
    }

    func fetch() {
        let fetchModel:PTFetchModel = PTFetchModel()
        fetchModel.urlString = "http://www.juyuanche.com/api001/user/userInfo"
        fetchModel.uploadName = "user_picture"
        fetchModel.uploadData = UIImagePNGRepresentation(UIImage.init(named: "关闭")!)
        fetchModel.contentType = "png"
        fetchModel.mimeType = "image/*"
        fetchModel.succeess = succeess
        fetchModel.failure  = failure
        PTFetchManager.Fetch_UploadData(fetchModel: fetchModel)
    }
    
    func succeess(_:Any) {
        
    }
    func failure(_:Any) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

