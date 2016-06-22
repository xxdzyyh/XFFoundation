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

/** 显示一个错位的视图 */
- (void)showErrorView;

/**
 *  调用该方法重新发送失败的请求
 */
- (void)retryAfterRequestFailed;


- (void)showLoadingView;

- (void)closeLoadingView;

@end
