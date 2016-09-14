//
//  XFTopTabBar.m
//  CTQProject
//
//  Created by wangxuefeng on 16/6/27.
//  Copyright © 2016年 code. All rights reserved.
//

#import "XFTopTabBar.h"

@interface XFTopTabBar ()

@property (strong, nonatomic) UIScrollView *itemsContainer;
@property (strong, nonatomic) UIScrollView *indicatorView;

@property (assign, nonatomic) UIButton *currentBtn;

@end

@implementation XFTopTabBar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)setDelegate:(id<XFTopTabBarDelegate>)delegate {
    _delegate = delegate;
    
    [self setup];
}

- (void)setIndicatorLeft:(float)left {
    CGRect rect = CGRectMake(left, self.indicatorView.frame.origin.y, self.indicatorView.bounds.size.width, self.indicatorHeight);
    
    [self.indicatorView setFrame:rect];
}

- (void)setup {
    if (self.delegate && [self.delegate respondsToSelector:@selector(titlesForTopTabbar:)]) {
        self.titles = [self.delegate titlesForTopTabbar:self];
    }
    
    for (int i=0; i<self.titles.count; i++) {
        NSString *title = self.titles[i];
        
        float w = [self w]/self.titles.count;
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        btn.tag = i;
        btn.frame = CGRectMake(w*i, 0, w, self.itemsContainer.bounds.size.height);
        btn.titleLabel.font = self.titleFont;

        [btn setTitleColor:self.titleNormalColor forState:UIControlStateNormal];
        [btn setTitleColor:self.titleSelectColor forState:UIControlStateSelected];
        [btn setTitle:title forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(onItemClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.itemsContainer addSubview:btn];
        
        if (i == 0) {
            _currentBtn = btn;
            _currentBtn.selected = YES;
            _currentBtn.titleLabel.font = self.titleSelectFont;
        }
    }
    
    [self addSubview:self.itemsContainer];
    [self addSubview:self.indicatorView];
}

- (void)onItemClick:(UIButton *)sender {
    NSInteger index = sender.tag;
    
    _currentBtn.selected = NO;
    
    _currentBtn.titleLabel.font = self.titleFont;
    
    sender.selected = YES;
    sender.titleLabel.font = self.titleSelectFont;
    
    _currentBtn = sender;
    
    [UIView animateWithDuration:0.2 animations:^{
        float x = index * sender.bounds.size.width;
        
        CGRect rect = CGRectMake(x , self.indicatorView.frame.origin.y, self.indicatorView.bounds.size.width, self.indicatorHeight);
        
        [self.indicatorView setFrame:rect];
    }];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(topTabbar:didSelectedItemAtIndex:)]) {
        [self.delegate topTabbar:self didSelectedItemAtIndex:sender.tag];
    }
}

- (void)selectItemAtIndex:(NSUInteger)index {
    _currentBtn.selected = NO;
    _currentBtn.titleLabel.font = self.titleFont;
    
    UIButton *btn = [self.itemsContainer viewWithTag:index];

    btn.selected = YES;
    btn.titleLabel.font = self.titleSelectFont;
    
    _currentBtn = btn;
    
    [UIView animateWithDuration:0.2 animations:^{
        float x = index * btn.bounds.size.width;
        
        CGRect rect = CGRectMake(x , self.indicatorView.frame.origin.y, self.indicatorView.bounds.size.width, self.indicatorHeight);
        
        [self.indicatorView setFrame:rect];
    }];
}

#pragma mark - setter & getter

- (UIScrollView *)itemsContainer {
    if (_itemsContainer == nil) {
        CGRect rect = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height - self.indicatorHeight);
        
        _itemsContainer = [[UIScrollView alloc] initWithFrame:rect];
        
        // 设置为10000,避免viewWithTag找到自己
        _itemsContainer.tag = 10000;
        _itemsContainer.showsVerticalScrollIndicator = NO;
        _itemsContainer.showsHorizontalScrollIndicator = NO;
    }
    return _itemsContainer;
}

- (UIScrollView *)indicatorView {
    if (_indicatorView == nil) {
        float y = [self h] - self.indicatorHeight;
        
        CGRect rect = CGRectMake(0, y, [self w]/self.titles.count, self.indicatorHeight);
        
        _indicatorView = [[UIScrollView alloc] initWithFrame:rect];
        
        _indicatorView.contentSize = CGSizeMake([self w], self.indicatorHeight);
        _indicatorView.showsVerticalScrollIndicator = NO;
        _indicatorView.showsHorizontalScrollIndicator = NO;
        _indicatorView.backgroundColor = self.indicatorColor;
        
        UIView *vColor = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [self w], self.indicatorHeight)];
        
        vColor.backgroundColor = self.indicatorColor;
        [_indicatorView addSubview:vColor];
    }
    return _indicatorView;
}

- (float)indicatorHeight {
    if (_indicatorHeight == 0) {
        _indicatorHeight = 0.5;
    }
    return _indicatorHeight;
}

- (float)w {
    return self.bounds.size.width;
}

- (float)h {
    return self.bounds.size.height;
}

- (UIColor *)indicatorColor {
    if (_indicatorColor == nil) {
        _indicatorColor = [UIColor blackColor];
    }
    return _indicatorColor;
}

- (UIFont *)titleFont {
    if (_titleFont == nil) {
        _titleFont = [UIFont systemFontOfSize:13];
    }
    return _titleFont;
}

- (UIFont *)titleSelectFont {
    if (_titleSelectFont == nil) {
        _titleSelectFont = [UIFont systemFontOfSize:14];
    }
    return _titleSelectFont;
}

@end
