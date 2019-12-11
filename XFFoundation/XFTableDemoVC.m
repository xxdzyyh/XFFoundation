//
//  XFTableDemoVC.m
//  XFFoundation
//
//  Created by xiaoniu on 2019/1/7.
//  Copyright © 2019 wangxuefeng. All rights reserved.
//

#import "XFTableDemoVC.h"
#import "NameCell.h"

typedef NS_ENUM(NSUInteger,CellType) {
    CellTypeOne,
    CellTypeTwo,
    CellTypeSeperatorOne,
    CellTypeThree,
    CellTypeSeperatorTwo,
    CellTypeFour,
    CellCount
};

@interface XFTableDemoVC ()

@end

@implementation XFTableDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.dataSource = [@[@{@"name":@"One"},@{@"name":@"Two"},@{@"name":@"SeperatorOne"},@{@"name":@"Three"},@{@"name":@"SeperatorTwo"},@{@"name":@"Four"}] mutableCopy];
}

#pragma mark - <XFCellDelegate>

- (Class)cellClassForCellAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == CellTypeSeperatorOne || indexPath.row == CellTypeSeperatorTwo) {
        return [XFSeperatorCell class];
    } else {
        return [NameCell class];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary * obj = self.dataSource[indexPath.row];
    
    NSLog(@"%@",obj[@"name"]);
//    
//    UIViewController *vc = nil;
//    [self.navigationController pushViewController:vc animated:YES];
}
@end
