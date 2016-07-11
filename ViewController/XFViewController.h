//
//  XFViewController.h
//  XFFoundation
//
//  Created by wangxuefeng on 16/6/8.
//  Copyright © 2016年 wangxuefeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XFRequestQueue.h"

@interface XFViewController : UIViewController

@property (strong, nonatomic) XFRequestQueue *mainQueue;

@property (assign, nonatomic, getter=isKeyboardShowing) BOOL keyboardShowing;

- (void)setErrorMessage:(NSString *)errorMessage;

/** 显示一个错位的视图 */
- (void)showErrorView;

/**
 *  调用该方法重新发送失败的请求
 */
- (void)retryAfterRequestFailed;


- (void)showLoadingView;

- (void)closeLoadingView;

- (void)showInfoWithStatus:(NSString *)status;

- (void)showCenterInfoWithStatus:(NSString *)status;

+ (UIImage *)imageWithColor:(UIColor *)color;

- (void)showEmptyView;

- (void)hiddenEmptyView;

- (void)onCustomBackItemClicked:(id)sender;

@end
