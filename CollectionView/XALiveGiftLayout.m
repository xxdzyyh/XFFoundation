//
//  XALiveGiftLayout.m
//  Live
//
//  Created by wangxuefeng on 2017/5/31.
//  Copyright © 2017年 珠海云迈网络科技有限公司. All rights reserved.
//

#import "XALiveGiftLayout.h"

@implementation XALiveGiftLayout

- (void)prepareLayout {
    [super prepareLayout];
    
    NSUInteger count = [self.collectionView numberOfItemsInSection:0];
    for (NSUInteger i = 0; i<count; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:indexPath];
        
        if (attributes) {
             [self.allAttributes addObject:attributes];
        }
    }
}

- (CGSize)collectionViewContentSize {
    return [super collectionViewContentSize];
}

/**
 相当于映射

 @param indexPath
 @return <#return value description#>
 */
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSUInteger item = indexPath.item;
    NSUInteger x;
    NSUInteger y;
    [self targetPositionWithItem:item resultX:&x resultY:&y];
    NSUInteger item2 = [self originItemAtX:x y:y];
    NSIndexPath *theNewIndexPath = [NSIndexPath indexPathForItem:item2 inSection:indexPath.section];
    
    UICollectionViewLayoutAttributes *theNewAttr = [super layoutAttributesForItemAtIndexPath:theNewIndexPath];
    
    // 重新设置indexPath
    theNewAttr.indexPath = indexPath;
    
    return theNewAttr;
}

/**
 可见区域

 @param rect <#rect description#>
 @return <#return value description#>
 */
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray *attributes = [super layoutAttributesForElementsInRect:rect];
    
    NSMutableArray *tmp = [NSMutableArray array];
    
    for (UICollectionViewLayoutAttributes *attr in attributes) {
        for (UICollectionViewLayoutAttributes *attr2 in self.allAttributes) {
            if (attr.indexPath.item == attr2.indexPath.item) {
                [tmp addObject:attr2];
                break;
            }
        }
    }
    return tmp;
}

// 根据 item 计算目标item的位置
// x 横向偏移  y 竖向偏移
- (void)targetPositionWithItem:(NSUInteger)item
                       resultX:(NSUInteger *)x
                       resultY:(NSUInteger *)y {
    NSUInteger page = item/(self.columnCount*self.rowCount);
    
    NSUInteger theX = item % self.columnCount + page * self.columnCount;
    NSUInteger theY = item / self.columnCount - page * self.rowCount;
    if (x != NULL) {
        *x = theX;
    }
    if (y != NULL) {
        *y = theY;
    }
    
    NSLog(@"%lu -> (%lu,%lu)",item,*x,*y);
}

// 根据偏移量计算item
- (NSUInteger)originItemAtX:(NSUInteger)x y:(NSUInteger)y {
    NSUInteger item = x * self.rowCount + y;
    return item;
}


#pragma mark - setter & getter

- (NSMutableArray *)allAttributes {
    if (_allAttributes == nil) {
        _allAttributes = [NSMutableArray array];
    }
    return _allAttributes;
}

- (NSUInteger)rowCount {
    if (_rowCount == 0) {
        _rowCount = 1;
    }
    return _rowCount;
}

- (NSUInteger)columnCount {
    if (_columnCount == 0) {
        _columnCount = 5;
    }
    return _columnCount;
}
@end
