//
//  XFCollectionViewFlowLayout.h
//  XFFoundation
//
//  Created by wangxuefeng on 17/1/16.
//  Copyright © 2017年 wangxuefeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XFCollectionViewFlowLayout;

@protocol XFCollectionViewFlowLayoutDataSource <NSObject>

- (CGFloat)collectionViewFlowLayout:(XFCollectionViewFlowLayout *)collectionViewFlowLayout heightForItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface XFCollectionViewFlowLayout : UICollectionViewFlowLayout

@property (weak, nonatomic) id<XFCollectionViewFlowLayoutDataSource> dataSource;

@property (assign, nonatomic) NSUInteger columnCount;
@property (assign, nonatomic) UIEdgeInsets edgeInsets;

@property (assign, nonatomic) CGFloat rowMargin;
@property (assign, nonatomic) CGFloat columnMargin;

@end
