//
//  ViewController.m
//  PT-FetchDemo
//
//  Created by BlanBok on 2017/12/18.
//  Copyright © 2017年 OComme. All rights reserved.
//

#import "ViewController.h"
#import "PTFetchEmitter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self fetch];
}

- (void)fetch
{
    PTFetchModel *fetchModel = [PTFetchModel new];
    
    fetchModel.urlString = @"http://www.juyuanche.com/api001/user/userInfo";
    fetchModel.uploadName = @"user_picture";
    fetchModel.uploadData = UIImagePNGRepresentation([UIImage imageNamed:@"关闭"]);
    fetchModel.contentType = @"png";
    fetchModel.mimeType = @"image/*";
    
    fetchModel.success = ^(id obj){
        NSLog(@"%@",obj);
    };
    
    fetchModel.failure = ^(id error){
        NSLog(@"%@",error);
    };
    
    fetchModel.progressing = ^(NSProgress * _Nonnull progress) {
        NSLog(@"%@",progress);
    };
    
    [PTFetchEmitter UPLOADDataWithFetchModel:fetchModel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
