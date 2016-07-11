//
//  XFRefreshTableViewController.m
//  CTQProject
//
//  Created by wangxuefeng on 16/7/4.
//  Copyright © 2016年 code. All rights reserved.
//

#import "XFRefreshTableViewController.h"

#import <MJRefresh/MJRefresh.h>

@interface XFRefreshTableViewController ()

@end

@implementation XFRefreshTableViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        _canUpdateData = YES;
        _canAppendData = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // default
    if (_canUpdateData) {
        self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(updateData)];
    } else {
        
        [self.tableView setMj_header:nil];
    }
    
    if (_canAppendData) {
        self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(appendData)];
    } else {
        
        [self.tableView setMj_footer:nil];
    }
}

- (void)setCanAppendData:(BOOL)canAppendData {
    _canAppendData = canAppendData;
    
    if (canAppendData) {
        self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(appendData)];
    } else {
        [self.tableView setMj_footer:nil];
    }
}

- (void)setCanUpdateData:(BOOL)canUpdateData {
    _canUpdateData = canUpdateData;
    
    if (canUpdateData) {
        self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(updateData)];
    } else {
        [self.tableView setMj_header:nil];
    }
}

- (void)appendData {
    
}

- (void)updateData {
    
}

- (void)setDataSource:(NSMutableArray *)dataSource {
    [super setDataSource:dataSource];
    
    if (dataSource.count == 0) {
        self.hasMoreData = NO;
    }
}

@end
