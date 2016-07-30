//
//  CTQMemberView.m
//  XFFoundation
//
//  Created by wangxuefeng on 16/7/21.
//  Copyright © 2016年 wangxuefeng. All rights reserved.
//

#import "CTQMemberView.h"
#import "CTQMember.h"
#import "YYKit.h"

@interface CTQMemberView ()

@property (strong, nonatomic) NSArray *members;

@end

@implementation CTQMemberView

- (instancetype)initWithMember:(NSArray *)members {
    self = [super init];
    if (self) {
        
        _members = members;
        self.autoresizesSubviews = NO;
        
        [self setup];
    }
    return self;
}

- (void)setup {
    for (int i=0;i<self.members.count;i++) {
        
        UIView *view = [self singleMemberView];
        
        view.left = 80 * i;
        view.size = CGSizeMake(80, 110);
        
        [self addSubview:view];
    }
    
    self.contentSize = CGSizeMake(80*self.members.count, 110) ;
}

- (CGSize)intrinsicContentSize {
    
    float w = 80*self.members.count;

    if (w > [UIScreen mainScreen].bounds.size.width) {
        w = [UIScreen mainScreen].bounds.size.width;
    }
    return CGSizeMake(w, 110);
}

- (UIView *)singleMemberView {
    return [[[NSBundle mainBundle] loadNibNamed:@"CTQSingleMemberView" owner:nil options:nil] lastObject];
}

@end
