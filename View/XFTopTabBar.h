//
//  XFTopTabBar.h
//  CTQProject
//
//  Created by wangxuefeng on 16/6/27.
//  Copyright © 2016年 code. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XFTopTabBar;

@protocol XFTopTabBarDelegate <NSObject>

- (NSArray *)titlesForTopTabbar:(XFTopTabBar *)topTabBar;

- (void)topTabbar:(XFTopTabBar *)topTabBar didSelectedItemAtIndex:(NSInteger)index;

@end

@interface XFTopTabBar : UIView

@property (strong, nonatomic) NSArray *titles;
@property (assign, nonatomic) float indicatorHeight;
@property (weak  , nonatomic) id<XFTopTabBarDelegate> delegate;

@property (strong, nonatomic) UIColor *indicatorColor;

@property (strong, nonatomic) UIColor *titleNormalColor;
@property (strong, nonatomic) UIColor *titleSelectColor;
@property (strong, nonatomic) UIFont  *titleFont;
@property (strong, nonatomic) UIFont  *titleSelectFont;


- (void)selectItemAtIndex:(NSUInteger)index;

- (void)setIndicatorLeft:(float)left;

@end
