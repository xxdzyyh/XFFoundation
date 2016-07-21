//
//  XFViewController.h
//  XFFoundation
//
//  Created by wangxuefeng on 16/6/8.
//  Copyright © 2016年 wangxuefeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XFRequestQueue.h"

typedef NS_ENUM(NSUInteger,XFHUDType) {
    XFHUDTypeDefault,/*<默认是XFHUDTypeProgress*/
    XFHUDTypeNone,/*<不显示*/
    XFHUDTypeProgress,/*<显示菊花*/
    XFHUDTypeNetIndictor/**<状态栏显示小菊花*/
};

typedef NS_ENUM(NSUInteger,XFDataType) {
    XFDataTypeRequest,
    XFDataTypeLocal
};

@interface XFViewController : UIViewController

@property (strong, nonatomic) XFRequestQueue *mainQueue;
@property (assign, nonatomic) XFDataType dataType;
@property (assign, nonatomic) XFHUDType hudType;

@property (assign, nonatomic) BOOL shouldShowErrorView;

@property (assign, nonatomic) BOOL isHUDShowing;

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

- (void)onCustomBackItemClicked:(id)sender;

- (void)showLoginViewController;

- (void)sendDefaultRequest;
@end
