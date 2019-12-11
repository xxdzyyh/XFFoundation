//
//  XFCollectionViewFlowLayoutDemoViewController.m
//  XFFoundation
//
//  Created by wangxuefeng on 17/1/17.
//  Copyright © 2017年 wangxuefeng. All rights reserved.
//

#import "XFCollectionViewFlowLayoutDemoViewController.h"

#import "XFCollectionViewFlowLayout.h"
#import <ChameleonFramework/Chameleon.h>
#import "TestModel.h"
#import "TestModelCollectionViewCell.h"

@interface XFCollectionViewFlowLayoutDemoViewController ()<XFCollectionViewFlowLayoutDataSource,UICollectionViewDataSource,UICollectionViewDelegate>

@property (strong, nonatomic) XFCollectionViewFlowLayout *flowLayout;
@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *dataSources;

@end

@implementation XFCollectionViewFlowLayoutDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (int i=0; i<10 ; i++) {
        TestModel *model = [TestModel new];
        
        model.title = [NSString stringWithFormat:@"%d",i];
        model.content = [NSString stringWithFormat:@"content+%d",i];
        model.color = [UIColor randomFlatColor];
        
        [self.dataSources addObject:model];
    }
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"TestModelCollectionViewCell" bundle:nil]
          forCellWithReuseIdentifier:@"TestModelCollectionViewCell"];
    
    [self.view addSubview:self.collectionView];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSources.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TestModelCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TestModelCollectionViewCell" forIndexPath:indexPath];
    
    TestModel *model = self.dataSources[indexPath.row];
    
    cell.lblTitle.text = model.title;
    cell.lblContent.text = model.content;
    cell.contentView.backgroundColor = model.color;
    
    return cell;
}

#pragma mark - XFCollectionViewFlowLayoutDataSource

- (CGFloat)collectionViewFlowLayout:(XFCollectionViewFlowLayout *)collectionViewFlowLayout heightForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return 100+indexPath.row*10;
}

#pragma mark - setter & getter

- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        _collectionView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:self.flowLayout];
        
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
    }
    return _collectionView;
}

- (XFCollectionViewFlowLayout *)flowLayout {
    if (_flowLayout == nil) {
        _flowLayout = [[XFCollectionViewFlowLayout alloc] init];
        
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        _flowLayout.dataSource = self;
        _flowLayout.columnCount = 2;
    }
    return _flowLayout;
}

- (NSMutableArray *)dataSources {
    if (_dataSources == nil) {
        _dataSources = [NSMutableArray array];
    }
    return _dataSources;
}

@end
