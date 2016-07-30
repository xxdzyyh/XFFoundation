//
//  XFHSwipeViewController.m
//  XFHSwipe
//
//  Created by wangxuefeng on 16/7/30.
//  Copyright © 2016年 wangxuefeng. All rights reserved.
//

#import "XFHSwipeViewController.h"
#import "XFTopTabBar.h"
#import "XFCardViewController.h"
#import "UIView+YYAdd.h"

@interface XFHSwipeViewController () <XFTopTabBarDelegate,XFCardViewControllerDelegate>

@property (strong, nonatomic) NSArray *topbarTitles;

@property (strong, nonatomic) XFCardViewController *cardVC;

@property (strong, nonatomic) NSArray *contentViewControllers;

@property (assign, nonatomic) float topBarHeight;

@end

@implementation XFHSwipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.topbar];
    [self.view addSubview:self.cardVC.view];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.topbar.size = CGSizeMake(self.view.width, self.topBarHeight);
    self.cardVC.view.frame = CGRectMake(0, self.topBarHeight, self.view.width, self.view.height - self.topBarHeight);
}

#pragma mark - XFTopTabBarDelegate

- (NSArray *)titlesForTopTabbar:(XFTopTabBar *)topTabBar {
    return self.topbarTitles;
}

- (void)topTabbar:(XFTopTabBar *)topTabBar didSelectedItemAtIndex:(NSInteger)index {
    
    [self.cardVC selectedViewControllerAtIndex:index];
    
}

#pragma mark - JXCardViewControllerDelegate

- (NSArray *)viewControllersForCardViewController {
    return self.contentViewControllers;
}

#pragma mark - setter & getter 

- (XFTopTabBar *)topbar {
    if (_topbar == nil) {

        float w = [UIScreen mainScreen].bounds.size.width;
        
        _topbar = [[XFTopTabBar alloc] initWithFrame:CGRectMake(0, 0, w, 45)];
        
        _topbar.delegate = self;
    }
    return _topbar;
}

- (XFCardViewController *)cardVC {
    if (_cardVC == nil) {
        _cardVC = [[XFCardViewController alloc] init];

        _cardVC.delegate = self;
    }
    
    return _cardVC;
}

- (NSArray *)contentViewControllers {
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(viewControllersInSwipeView:)]) {
        _contentViewControllers = [self.dataSource viewControllersInSwipeView:self];
    }
    
    return _contentViewControllers;
}

- (NSArray *)topbarTitles {
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(titlesInSwipeView:)]) {
        _topbarTitles = [self.dataSource titlesInSwipeView:self];
    }
    
    return _topbarTitles;
}

- (float)topBarHeight {
    if (self.delegate && [self.delegate respondsToSelector:@selector(heightForTopbarInSwipeView:)]) {
        return [self.delegate heightForTopbarInSwipeView:self];
    } else {
        return 45;
    }
}
@end
