//
//  XFTopbarDemoViewController.m
//  XFFoundation
//
//  Created by wangxuefeng on 16/12/22.
//  Copyright © 2016年 wangxuefeng. All rights reserved.
//

#import "XFTopbarDemoViewController.h"
#import "UIView+Utils.h"
#import "XFTopTabBar.h"
#import "XFMarco.h"

@interface XFTopbarDemoViewController () <XFTopTabBarDelegate>

@property (strong, nonatomic) XFTopTabBar *topbar;

@property (strong, nonatomic) UIScrollView *scrollView;

@property (strong, nonatomic) UIViewController *vc0;
@property (strong, nonatomic) UIViewController *vc1;
@property (strong, nonatomic) UIViewController *vc2;

@end

@implementation XFTopbarDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;

    [self.scrollView addSubview:self.vc0.view];
    [self.scrollView addSubview:self.vc1.view];
    [self.scrollView addSubview:self.vc2.view];
    
    [self.view addSubview:self.scrollView];
    
    self.topbar.scrollView = self.scrollView;
    [self.view addSubview:self.topbar];
    
    self.topbar.delegate = self;
}

- (void)tapAction {
    
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];

    self.topbar.frame = CGRectMake(0, 0, self.view.width, 45);
    self.scrollView.frame = CGRectMake(0, self.topbar.bottom, self.view.width, self.view.height-self.topbar.height);
    
    self.scrollView.contentSize = CGSizeMake(self.view.width*3,self.scrollView.height);
}

#pragma mark - 

- (NSArray *)titlesForTopTabbar:(XFTopTabBar *)topTabBar {
    return @[@"头条", @"美食", @"玩乐"];
}

#pragma mark - setter & getter

- (UIViewController *)vc0 {
    if (_vc0 == nil) {
        _vc0 = [[UIViewController alloc] init];
        
        _vc0.view.frame = CGRectMake(0, 0, XFScreenSize.width, XFScreenSize.height-64-45);
        _vc0.view.backgroundColor = [UIColor lightTextColor];
    }
    return _vc0;
}

- (UIViewController *)vc1 {
    if (_vc1 == nil) {
        _vc1 = [[UIViewController alloc] init];
        
        _vc1.view.frame = CGRectMake(XFScreenSize.width, 0, XFScreenSize.width, XFScreenSize.height-64-45);
        _vc1.view.backgroundColor = [UIColor yellowColor];
    }
    return _vc1;
}

- (UIViewController *)vc2 {
    if (_vc2 == nil) {
        _vc2 = [[UIViewController alloc] init];
        
        _vc2.view.frame = CGRectMake(XFScreenSize.width*2, 0, XFScreenSize.width, XFScreenSize.height-64-45);
        _vc2.view.backgroundColor = [UIColor greenColor];
    }
    return _vc2;
}

- (XFTopTabBar *)topbar {
    if (_topbar == nil) {
        _topbar = [[XFTopTabBar alloc] initWithFrame:CGRectMake(0, 0, XFScreenSize.width, 45)];
        
        _topbar.backgroundColor    = [UIColor whiteColor];
        _topbar.normalStateColor   = [UIColor grayColor];
        _topbar.selectedStateFont  = [UIFont systemFontOfSize:17];
        _topbar.selectedStateColor = [UIColor greenColor];
    }
    return _topbar;
}

- (UIScrollView *)scrollView {
    if (_scrollView == nil) {
        _scrollView = [UIScrollView new];
        
        _scrollView.pagingEnabled = YES;
        _scrollView.backgroundColor = [UIColor orangeColor];
    }
    return _scrollView;
}

@end
