//
//  XALiveGiftLayout.h
//  Live
//
//  Created by wangxuefeng on 2017/5/31.
//  Copyright © 2017年 珠海云迈网络科技有限公司. All rights reserved.
//

// 参考文章 http://www.jianshu.com/p/25d96d9c38d3

#import <UIKit/UIKit.h>

/**
 分页显示，横向滑动
 */
@interface XALiveGiftLayout : UICollectionViewFlowLayout

/**
 一页显示多少行
 */
@property (assign, nonatomic) NSUInteger rowCount;

/**
 一行显示几列
 */
@property (nonatomic) NSUInteger columnCount;

@property (strong, nonatomic) NSMutableArray *allAttributes;

@end
