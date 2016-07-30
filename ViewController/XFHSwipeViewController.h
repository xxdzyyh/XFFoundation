//
//  XFHSwipeViewController.h
//  XFHSwipe
//
//  Created by wangxuefeng on 16/7/30.
//  Copyright © 2016年 wangxuefeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XFTopTabBar.h"

@class XFHSwipeViewController;

@protocol XFHSwipeViewControllerDataSource <NSObject>

- (NSArray *)viewControllersInSwipeView:(XFHSwipeViewController *)swipe;

- (NSArray *)titlesInSwipeView:(XFHSwipeViewController *)swipe;

@end

@protocol XFHSwipeViewControllerDelegate <NSObject>

/*! 默认为45 */
- (float)heightForTopbarInSwipeView:(XFHSwipeViewController *)swipe;

/*! 默认为2  */
- (float)heightForTopbarIndictorInSwipeView:(XFHSwipeViewController *)swipe;

@end

@interface XFHSwipeViewController : UIViewController

@property (strong, nonatomic) XFTopTabBar *topbar;

@property (weak, nonatomic) id<XFHSwipeViewControllerDataSource> dataSource;

@property (weak, nonatomic) id<XFHSwipeViewControllerDelegate> delegate;

@end
