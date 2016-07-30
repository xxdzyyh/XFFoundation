//
//  JXCardViewController.h
//  SMScrollView
//
//  Created by mc008 on 16/1/27.
//  Copyright © 2016年 wxf. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XFCardViewControllerDelegate <NSObject>

- (NSArray *)viewControllersForCardViewController;

@end

@interface XFCardViewController : UIViewController

@property (weak, nonatomic) id<XFCardViewControllerDelegate> delegate;

- (void)selectedViewControllerAtIndex:(NSInteger)index;

@end
