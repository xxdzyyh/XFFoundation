//
//  CTQMainMemberCell.m
//  CTQProject
//
//  Created by wangxuefeng on 16/6/15.
//  Copyright © 2016年 code. All rights reserved.
//

#import "CTQMainMemberCell.h"
#import "XFTableViewController.h"

@implementation CTQMainMemberCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configCellWithData:(id)item {
    [super configCellWithData:item];
    
    if (item && [(NSArray *)item count] == 0) {
        
        XFEmptyView *emptyView = [[XFEmptyView alloc] initWithTitle:@"暂无团队成员信息" image:@"nodata"];
        
        [self.peopleView addSubview:emptyView];
    }
    
    self.peopleView.teamMembers = item;
}

+ (NSInteger)cellHeight {
    return 120;
}

@end
