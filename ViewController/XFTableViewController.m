//
//  XFTableViewController.m
//  CTQProject
//
//  Created by wangxuefeng on 16/5/28.
//  Copyright © 2016年 code. All rights reserved.
//

#import "XFTableViewController.h"
#import "YYKit.h"

@interface XFTableViewController () {
    UITableView *_tableView;
    XFEmptyView *_emptyView;
}

@end

@implementation XFTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.tableView.frame = self.view.bounds;
}

- (UITableViewCell *)seperatorCell {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    cell.backgroundColor = [UIColor colorWithRed:0.949 green:0.949 blue:0.949 alpha:1.00];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (float)seperatorCellHeight {
    return 10;
}

- (void)showEmptyView {
    
    if (self.emptyView.superview && self.emptyView.superview != self.tableView) {
        
        [self.emptyView removeFromSuperview];
    }

    [self.tableView addSubview:self.emptyView];
}

- (void)hiddenEmptyView {
    [self.emptyView removeFromSuperview];
}

#pragma mark - setter & getter 

- (UITableView *)tableView {

        if (nil == _tableView) {
            _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
            
            _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
            _tableView.delegate = self;
            _tableView.dataSource = self;
            _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
            _tableView.showsVerticalScrollIndicator = NO;
            _tableView.showsHorizontalScrollIndicator = NO;
            _tableView.tableFooterView = [UIView new];
            
            [self.view addSubview:_tableView];
        }
    return _tableView;
}

- (XFEmptyView *)emptyView {
    if (_emptyView == nil) {
        _emptyView = [[XFEmptyView alloc] initWithTitle:self.emptyTitle
                                                  image:self.emptyImageName];
    }
    return _emptyView;
}

+ (float)heightForString:(NSString *)string font:(UIFont *)font perferWidth:(float)width {
    
    NSDictionary *dict = @{NSFontAttributeName:font};
    
    CGRect rect = [string boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    
    return rect.size.height;
}

+ (float)heightForLableWithText:(NSString *)text font:(UIFont *)font perferWidth:(float)width {
    
    UILabel *lable = [[UILabel alloc] init];
    
    lable.text = text;
    lable.font = font;
    lable.preferredMaxLayoutWidth = width;
    lable.numberOfLines = 0;
    
    return lable.intrinsicContentSize.height;
}

- (void)setDataSource:(NSMutableArray *)dataSource {
    if (_dataSource != dataSource) {
        
        _dataSource = dataSource;
        
        [self.tableView reloadData];
        
        if (dataSource.count == 0) {
            
            [self showEmptyView];
        } else {
            
            [self hiddenEmptyView];
        }
    }
}

@end
