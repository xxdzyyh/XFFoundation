//
//  ViewController.m
//  XFFoundation
//
//  Created by wangxuefeng on 16/6/8.
//  Copyright © 2016年 wangxuefeng. All rights reserved.
//

#import "ViewController.h"
#import "XFRequest.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    XFRequest *request0 = [[XFRequest alloc] initWithPath:@"" finish:^(XFRequest *request, id result) {

        NSLog(@"%@",result);
        
    }];
    
    XFRequest *request1 = [[XFRequest alloc] initWithPath:@"" finish:^(XFRequest *request, id result) {
        
        NSLog(@"%@",result);
        
    }];
    
    XFRequest *request2 = [[XFRequest alloc] initWithPath:@"" finish:^(XFRequest *request, id result) {
        
        NSLog(@"%@",result);
        
    }];
    
    [self.mainQueue push:request0];
    
    [self.mainQueue push:request1];
    
    [self.mainQueue push:request2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
