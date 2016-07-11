//
//  ViewController.m
//  XFFoundation
//
//  Created by wangxuefeng on 16/6/8.
//  Copyright © 2016年 wangxuefeng. All rights reserved.
//

#import "ViewController.h"
#import "XFRequest.h"
#import "AFHTTPSessionManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    
//    XFRequest *request0 = [[XFRequest alloc] initWithPath:@"" finish:^(XFRequest *request, id result) {
//
//        NSLog(@"%@",result);
//        
//    }];
//    
//    [request0 addParameter:@"name" value:@"wangxuefeng"];
//    
//    [request0 start];
////
////    XFRequest *request1 = [[XFRequest alloc] initWithPath:@"" finish:^(XFRequest *request, id result) {
////        
////        NSLog(@"%@",result);
////        
////    }];
////    
////    XFRequest *request2 = [[XFRequest alloc] initWithPath:@"" finish:^(XFRequest *request, id result) {
////        
////        NSLog(@"%@",result);
////        
////    }];
////    
////    [self.mainQueue push:request0];
////    
////    [self.mainQueue push:request1];
////    
////    [self.mainQueue push:request2];
//
    
    [self upload:@"http://localhost:8080/TomcatTest/HelloJSP"];
}


- (void)upload:(NSString *)uploadUrl {
    
    UIImage *image = [UIImage imageNamed:@"red_public_welfare"];
    
    NSData *imageData = UIImagePNGRepresentation(image);
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager setRequestSerializer:[AFJSONRequestSerializer serializer]];

//    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
//    [manager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/plain",@"text/html", nil];
    
    [manager POST:uploadUrl parameters:@{@"111":@"2222"} constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        [formData appendPartWithFileData:imageData name:@"Filedata" fileName:@"xxxx.png" mimeType:@"image/png"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}
@end
