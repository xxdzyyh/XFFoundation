//
//  XFViewController.m
//  XFFoundation
//
//  Created by wangxuefeng on 16/6/8.
//  Copyright © 2016年 wangxuefeng. All rights reserved.
//

#import "XFViewController.h"
#import <SVProgressHUD/SVProgressHUD.h>

@interface XFViewController ()

@property (strong, nonatomic) UIView * errorView;

@end

@implementation XFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - event response

- (void)retryAfterRequestFailed {
    [self.mainQueue execute];
}

- (void)showErrorView {
    if (!self.errorView.superview) {
        [self.view addSubview:self.errorView];
    }
}

- (void)closeErrorView {
    if (self.errorView.superview) {
        [self.errorView removeFromSuperview];
    }
}

- (void)showLoadingView {
    [SVProgressHUD show];
}

- (void)closeLoadingView {
    [SVProgressHUD dismiss];
}

#pragma mark - request queue

- (void)mainRequestStart {
    [self closeLoadingView];
    [self showLoadingView];
}

- (void)mainRequestFinish {
    [self closeLoadingView];
}

- (NSNumber *)mainRequestFailure {
    [self closeLoadingView];
    
    [self showErrorView];
    
    return @1;
}

- (void)mainRequestSuccess {
    
}

#pragma mark - getter & setter

- (UIView *)errorView {
    if (_errorView == nil) {
        UIControl *control = [[UIControl alloc] initWithFrame:self.view.bounds];
        
        control.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        
        UILabel *lable = [[UILabel alloc] initWithFrame:control.bounds];
        
        lable.text = @"网络异常";
        lable.textAlignment = NSTextAlignmentCenter;
        
        [control addSubview:lable];
        [control addTarget:self action:@selector(retryAfterRequestFailed) forControlEvents:UIControlEventTouchUpInside];
        
        _errorView = control;
    }
    return _errorView;
}

-(XFRequestQueue *)mainQueue {
    if (_mainQueue == nil) {
        _mainQueue = [[XFRequestQueue alloc] initWithName:@"mainQueue"];
        
        _mainQueue.target = self;
        _mainQueue.requestStartSelector   = @selector(mainRequestStart);
        _mainQueue.requestSuccessSelector = @selector(mainRequestSuccess);
        _mainQueue.requestFinishSelector  = @selector(mainRequestFinish);
        _mainQueue.requestFailureSelector = @selector(mainRequestFailure);
    }
    return _mainQueue;
}

@end