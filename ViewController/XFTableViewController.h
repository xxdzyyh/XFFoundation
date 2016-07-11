//
//  XFTableViewController.h
//  CTQProject
//
//  Created by wangxuefeng on 16/5/28.
//  Copyright © 2016年 code. All rights reserved.
//

#import "XFViewController.h"
#import "XFEmptyView.h"

typedef NS_ENUM(NSUInteger,XFDataType) {
    XFDataTypeRequest,
    XFDataTypeLocal
};


@interface XFTableViewController : XFViewController <UITableViewDelegate, UITableViewDataSource>

// getter
- (UITableView *)tableView;
- (XFEmptyView *)emptyView;

@property (copy  , nonatomic) NSString *emptyTitle;
@property (copy  , nonatomic) NSString *emptyImageName;
@property (assign, nonatomic) XFDataType dataType;
@property (strong, nonatomic) NSMutableArray *dataSource;

- (UITableViewCell *)seperatorCell;

- (float)seperatorCellHeight;

+ (float)heightForLableWithText:(NSString *)text font:(UIFont *)font perferWidth:(float)width;

+ (float)heightForString:(NSString *)string font:(UIFont *)font perferWidth:(float)width;

- (void)refreshTableView;

@end
