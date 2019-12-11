//
//  XFPageCollectionVC.m
//  XFFoundation
//
//  Created by wangxuefeng on 2017/5/31.
//  Copyright © 2017年 wangxuefeng. All rights reserved.
//

#import "XFPageCollectionVC.h"

#import "TestModel.h"
#import "TestModelCollectionViewCell.h"
#import <Chameleon.h>
#import "XALiveGiftLayout.h"

@interface XFPageCollectionVC () <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *dataSources;

@end

@implementation XFPageCollectionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (int i=0; i<15 ; i++) {
        TestModel *model = [TestModel new];
        
        model.title = [NSString stringWithFormat:@"%d",i];
        model.content = [NSString stringWithFormat:@"content+%d",i];
        model.color = [UIColor randomFlatColor];
        
        [self.dataSources addObject:model];
    }
    
    XALiveGiftLayout *layout = [[XALiveGiftLayout alloc] init];
    
    CGRect rect = [UIScreen mainScreen].bounds;

    
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.columnCount = 5;
    layout.rowCount    = 2;
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.headerReferenceSize = CGSizeMake(0, 0);
    layout.itemSize = CGSizeMake((rect.size.width)/5.0, 100);

    self.collectionView.collectionViewLayout = layout;
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"TestModelCollectionViewCell" bundle:nil]
          forCellWithReuseIdentifier:@"TestModelCollectionViewCell"];
    
    self.collectionView.pagingEnabled = YES;
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
}

#pragma mark - 

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TestModelCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TestModelCollectionViewCell" forIndexPath:indexPath];
    
    if (indexPath.item < self.dataSources.count) {
        TestModel *model = self.dataSources[indexPath.row];
        
        cell.lblTitle.text = model.title;
        cell.lblContent.text = model.content;
        cell.contentView.backgroundColor = model.color;

    } else {
        cell.contentView.backgroundColor = [UIColor whiteColor];
    }
    
    return cell;
}

- (NSMutableArray *)dataSources {
    if (_dataSources == nil) {
        _dataSources = [NSMutableArray array];
    }
    return _dataSources;
}

@end
