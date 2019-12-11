//
//  XFCollectionViewFlowLayout.m
//  XFFoundation
//
//  Created by wangxuefeng on 17/1/16.
//  Copyright © 2017年 wangxuefeng. All rights reserved.
//

#import "XFCollectionViewFlowLayout.h"

@interface XFCollectionViewFlowLayout ()

@property (assign, nonatomic) CGFloat contentHeight;
@property (strong, nonatomic) NSMutableArray *attrsArray;
@property (strong, nonatomic) NSMutableArray *columentHeights;

@end


@implementation XFCollectionViewFlowLayout

- (void)prepareLayout {
    [super prepareLayout];
    
    self.contentHeight = 0;
    [self.columentHeights removeAllObjects];
    
    for (int i=0; i<self.columnCount; i++) {
        [self.columentHeights addObject:@(self.edgeInsets.top)];
    }
    
    [self.attrsArray removeAllObjects];
    
    NSUInteger count = [self.collectionView numberOfItemsInSection:0];
    
    for (int j=0; j<count; j++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:j inSection:0];
        
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
        
        [self.attrsArray addObject:attrs];
    }
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *arrts = [super layoutAttributesForItemAtIndexPath:indexPath];
    CGFloat collectionViewWidth = self.collectionView.frame.size.width;
    CGFloat width = (collectionViewWidth - self.edgeInsets.left - self.self.edgeInsets.right - (self.columnCount-1)*self.columnMargin) / self.columnCount;
    CGFloat height = self.itemSize.height;
    
    if ([self.dataSource respondsToSelector:@selector(collectionViewFlowLayout:heightForItemAtIndexPath:)]) {
        height = [self.dataSource collectionViewFlowLayout:self heightForItemAtIndexPath:indexPath];
    }
    
    NSUInteger destColumn = 0;
    CGFloat minColumnHeight = [self.columentHeights[0] floatValue];
    for (int i=1; i<self.columnCount; i++) {
        CGFloat columnHeight = [self.columentHeights[i] floatValue];
        
        if (minColumnHeight > columnHeight) {
            minColumnHeight = columnHeight;
            destColumn = i;
        }
    }
    
    CGFloat x = self.edgeInsets.left + destColumn*(width + self.columnMargin);
    CGFloat y = minColumnHeight;
    if (y != self.edgeInsets.top) {
        y+= self.rowMargin;
    }
    
    arrts.frame = CGRectMake(x, y, width, height);
    
    self.columentHeights[destColumn] = @(CGRectGetMaxY(arrts.frame));
    
    CGFloat columentHeight = [self.columentHeights[destColumn] floatValue];
    
    if (self.contentHeight < columentHeight) {
        self.contentHeight = columentHeight;
    }
    
    return arrts;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *rArray = [NSMutableArray array];
    
    for (UICollectionViewLayoutAttributes *cacheAttr in _attrsArray) {
        if (CGRectIntersectsRect(cacheAttr.frame, rect)) {
            [rArray addObject:cacheAttr];
        }
    }
    
    return rArray;
}

- (CGSize)collectionViewContentSize {
    return CGSizeMake(CGRectGetWidth(self.collectionView.frame), self.contentHeight);
}

#pragma mark - setter & getter

- (NSMutableArray *)columentHeights {
    if (_columentHeights == nil) {
        _columentHeights = [NSMutableArray array];
    }
    return _columentHeights;
}

- (NSMutableArray *)attrsArray {
    if (_attrsArray == nil) {
        _attrsArray = [NSMutableArray array];
    }
    return _attrsArray;
}

@end
