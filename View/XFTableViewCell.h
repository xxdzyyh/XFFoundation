//
//  XFTableViewCell.h
//  CTQProject
//
//  Created by wangxuefeng on 16/5/27.
//  Copyright © 2016年 code. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XFTableViewCell : UITableViewCell

@property (weak  , nonatomic) id delegate;
@property (strong, nonatomic) id data;

+ (NSString *)identifier;
+ (NSInteger)cellHeight;

+ (id)cellForTableView:(UITableView *)tableView;

- (void)configCellWithData:(id)item;

+ (UIImage *)imageWithColor:(UIColor *)color;

- (UIImage *)originImage:(UIImage *)image scaleToSize:(CGSize)size;

- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

- (void)showInfoWithStatus:(NSString *)status;

@end
