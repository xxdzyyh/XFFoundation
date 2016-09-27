//
//  XFTopTabBar.h
//  CTQProject
//
//  Created by wangxuefeng on 16/6/27.
//  Copyright © 2016年 code. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,XFTopBarIndicatorType) {
    XFTopBarIndicatorTypeDefault,
    XFTopBarIndicatorTypeLongLine,/*< 和item宽度一致 */
    XFTopBarIndicatorTypeShortLine/**< 短 */
};

@class XFTopTabBar;

@protocol XFTopTabBarDelegate <NSObject>

- (NSArray *)titlesForTopTabbar:(XFTopTabBar *)topTabBar;

- (void)topTabbar:(XFTopTabBar *)topTabBar didSelectedItemAtIndex:(NSInteger)index;

@end

@interface XFTopTabBar : UIView

@property (strong, nonatomic) NSArray *titles;

@property (weak  , nonatomic) id<XFTopTabBarDelegate> delegate;
@property (assign, nonatomic) float    indicatorWidth;
@property (assign, nonatomic) float    indicatorHeight;
@property (strong, nonatomic) UIColor *indicatorColor;
@property (assign, nonatomic) XFTopBarIndicatorType indicatorType;

@property (strong, nonatomic) UIColor *titleNormalColor;
@property (strong, nonatomic) UIColor *titleSelectColor;
@property (strong, nonatomic) UIFont  *titleFont;
@property (strong, nonatomic) UIFont  *titleSelectFont;


- (void)selectItemAtIndex:(NSUInteger)index;

- (void)setIndicatorCenterX:(float)x;

@end
