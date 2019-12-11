//
//  RequestDemoVC.m
//  XFFoundation
//
//  Created by xiaoniu on 2019/1/21.
//  Copyright © 2019 wangxuefeng. All rights reserved.
//

#import "RequestDemoVC.h"
#import "NameCell.h"

@interface RequestDemoVC ()

@end

@implementation RequestDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = [@[@{@"name":@"整个界面会被遮挡直到请求结束"},
                         @{@"name":@"屏幕中间显示loading"},
                         @{@"name":@"状态栏显示网络指示器"}] mutableCopy];
}

- (Class)cellClass {
    return [NameCell class];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0: {
            self.fisrtLoading = YES;
            

        }
            break;
            
        default:
            break;
    }
}

@end
