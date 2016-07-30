//
//  CTQPeopleView.m
//  CTQProject
//
//  Created by wangxuefeng on 16/7/1.
//  Copyright © 2016年 code. All rights reserved.
//

#import "CTQPeopleView.h"
#import "CTQPeopleCell.h"
#import "CTQMember.h"
#import "YYKit.h"

@interface CTQPeopleView () <UITableViewDelegate,UITableViewDataSource>

@property (assign, nonatomic) float itemWidth;

@end

@implementation CTQPeopleView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    _itemWidth = 80;
//    [self addSubview:self.tableView];
}

- (UITableView *)tableView {
    if (_tableView == nil) {
        
        float h = self.teamMembers.count * _itemWidth;
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.height, h ) style:UITableViewStylePlain];
        
        _tableView.dataSource = self;
        _tableView.delegate   = self;
        _tableView.center     = CGPointMake(320/2, self.height/2);
        _tableView.transform  = CGAffineTransformMakeRotation(-M_PI / 2);
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.tableFooterView = [UIView new];
//        _tableView.bounces = NO;
    }
    return _tableView;
}

#pragma mark - UITableViewDelegate & UITableViewSource

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
}

//- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
//    
//    int index = (targetContentOffset->y+_itemWidth/2)/_itemWidth;
//    
//    targetContentOffset->y = index * _itemWidth;
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    CTQPeopleCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
//    
//    cell.imgvIcon.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.2, 1.2);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.teamMembers.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CTQPeopleCell *cell = [CTQPeopleCell cellForTableView:tableView];
    
        
    CTQMember *data = [CTQMember modelWithDictionary:self.teamMembers[indexPath.row]];
    
    [cell configCellWithData:data];
    
    cell.contentView.transform = CGAffineTransformMakeRotation(M_PI / 2);

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return _itemWidth;
}


- (void)setTeamMembers:(NSArray *)teamMembers {
    _teamMembers = teamMembers;
    
    if (teamMembers.count>0) {
        [self addSubview:self.tableView];
        [self.tableView reloadData];
    }
}

@end
