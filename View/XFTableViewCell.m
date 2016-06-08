//
//  XFTableViewCell.m
//  CTQProject
//
//  Created by wangxuefeng on 16/5/27.
//  Copyright © 2016年 code. All rights reserved.
//

#import "XFTableViewCell.h"

@implementation XFTableViewCell

+ (NSString *)identifier {
    return NSStringFromClass([self class]);
}

+ (NSInteger)cellHeight {
    return 44;
}

- (void)configCellWithData:(id)item {
    self.data = item;
    self.textLabel.text = [self.data description];
}

+ (id)cellForTableView:(UITableView *)tableView {
    NSString *cellIdentifer = [self identifier];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    
    if (cell == nil) {
        NSBundle *classBundle = [NSBundle bundleForClass:self];
        // 虽然nib名字可以与cell类名不同，但是貌似没有理由不同
        NSString * path = [classBundle pathForResource:NSStringFromClass(self) ofType:@"nib"];
        
        if (path.length > 0) {
            UINib *nib = [UINib nibWithNibName:NSStringFromClass(self) bundle:classBundle];
            
            //注册以后，dequeueReusableCellWithIdentifier返回必定不为空，只会执行一次
            [tableView registerNib:nib forCellReuseIdentifier:cellIdentifer];
            
            NSArray *nibObjects = [nib instantiateWithOwner:nil options:nil];
            
            NSAssert2(([nibObjects count] > 0) &&
                      [[nibObjects firstObject] isKindOfClass:self], @"Nib '%@' does not appert a valid %@", NSStringFromClass(self), NSStringFromClass(self));
            
            cell = [nibObjects firstObject];
            cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
        } else {
            
            NSAssert1(0, @"Nib with name : %@ not found",NSStringFromClass(self));
            
            return nil;
        }
    }
    
    return cell;
}

@end
