//
//  XFBannerScrollView.h
//  CTQProject
//
//  Created by wangxuefeng on 16/5/30.
//  Copyright © 2016年 code. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, XFPageControlPostion) {
    XFPageControlPostionNone = -1,
    XFPageControlPostionDefault,
    XFPageControlPostionLeft,
    XFPageControlPostionCenter,
    XFPageControlPostionRight //default
};

typedef NS_ENUM(NSUInteger, XFPageControlStyle) {
    XFPageControlStyleDefault,
};

@class XFBannerScrollView;

@protocol XFBannerScrollViewDataSource <NSObject>

@required

/**
 *  返回的数组可以是imageName，也可以是http开头的地址
 *
 *  @param bannerScrollerView <#bannerScrollerView description#>
 *
 *  @return
 */
- (NSArray *)imageURLsForBannerScrollView:(XFBannerScrollView *)bannerScrollerView;

@end


@interface XFBannerScrollView : UIScrollView

@property (assign, nonatomic) id<XFBannerScrollViewDataSource> dataSource;

@property (assign, nonatomic) XFPageControlPostion pageControlPostion;

@property (assign, nonatomic) XFPageControlStyle pageControlStyle;

@property (assign, nonatomic) BOOL autoScroll;
@end
