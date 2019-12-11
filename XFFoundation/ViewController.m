//
//  ViewController.m
//  XFFoundation
//
//  Created by wangxuefeng on 16/6/8.
//  Copyright © 2016年 wangxuefeng. All rights reserved.
//

#import "ViewController.h"
#import "XFRequest.h"
#import "AFHTTPSessionManager.h"
#import "XFInfoView.h"
#import "XFLoadingView.h"
#import "XFTopbarDemoViewController.h"
#import "XFCollectionViewFlowLayoutDemoViewController.h"
#import "XFLineHelper.h"
#import <Masonry.h>
#import "XFPageCollectionVC.h"
#import "XFSinglePhotoPicker.h"

@interface ViewController () 

@property (strong, nonatomic) NSString *target;
@property (strong, nonatomic) XFSinglePhotoPicker *picker;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    NSArray *array = @[@[@"XFFlowLayoutView",@"简单的流式布局"],
                       @[@"XFTopbar",@"顶部切换tabbar"],
                       @[@"XFCollectionViewFlowLayout",@"自定义flowLayout"],
                       @[@"XFPageCollectionVC",@"CollectionView 分页"],
                       @[@"XFTableDemoVC",@"表格demo"],
                       @[@"TestImagePostionVC",@"ImagePostion"]];
    
    
    self.dataSource = [NSMutableArray arrayWithArray:array];
    
    self.tableView.separatorColor = [UIColor redColor];
}

#pragma mark - UITableViewDelegate & UITableViewSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataSource.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    
    NSArray *array = self.dataSource[indexPath.row];
    
    cell.textLabel.text = array[0];
    cell.detailTextLabel.text = array[1];
    
    [XFLineHelper addBottomLineToView:cell];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *model = self.dataSource[indexPath.row];
    
    if (indexPath.row == 0) {

    } else if (indexPath.row == 1) {
        XFTopbarDemoViewController *c = [[XFTopbarDemoViewController alloc] init];
        
        [self.navigationController pushViewController:c animated:YES];
    } else if (indexPath.row == 2) {
        XFCollectionViewFlowLayoutDemoViewController *c = [XFCollectionViewFlowLayoutDemoViewController new];
        
        [self.navigationController pushViewController:c animated:YES];
    } else if (indexPath.row == 3) {
        XFPageCollectionVC *c = [XFPageCollectionVC new];
        
        [self.navigationController pushViewController:c animated:YES];
    } else {
        NSArray *array = self.dataSource[indexPath.row];
        
        UIViewController *c = [NSClassFromString(array[0]) new];
        
        [self.navigationController pushViewController:c animated:YES];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 60;
}

#pragma mark - Photo Picker

- (void)photoPickerDemo {
    self.picker = [XFSinglePhotoPicker new];
    
    self.picker.finishPickerBlock = ^(UIImage *image) {
        NSLog(@"%@",image);
    };
    
    [self.picker showActionSheetInView:self.view];
}

#pragma mark - Request

- (void)sendDefaultRequest {
    [XFRequest path:@"" finish:^(XFRequest *request, id result) {
        
    }];
}

@end
