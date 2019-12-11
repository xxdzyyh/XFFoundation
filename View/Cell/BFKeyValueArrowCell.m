//
//  BFKeyValueArrowCell.m
//  BFMoney
//
//  Created by xiaoniu on 2019/7/29.
//  Copyright © 2019 com.bluefin. All rights reserved.
//

#import "BFKeyValueArrowCell.h"
#import "BFKeyValueVM.h"
#import "UIView+Utils.h"
#import <Masonry/Masonry.h>

@implementation BFKeyValueArrowCell

- (instancetype)initWithCellIdentifier:(NSString *)cellId {
    self = [super initWithCellIdentifier:cellId];
    if (self) {
        [self setupSubviews];
        [self setupContraints];
    }
    return self;
}

#pragma mark - Public Methods

- (void)setCellVM:(id)viewModel {
    BFKeyValueVM *vm = viewModel;
    
    self.keyLabel.text = vm.key;
    self.valueLabel.text = vm.value;
    
    RAC(self.valueLabel,text) = [RACObserve(vm, value) takeUntil:self.rac_prepareForReuseSignal];
}

+ (CGFloat)cellHeight {
    return scaleY(55);
}

#pragma mark - Private

- (void)setupSubviews {
    self.contentView.clipsToBounds = YES;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.contentView addSubview:self.keyLabel];
    [self.contentView addSubview:self.valueLabel];
    [self.contentView addSubview:self.arrowImageView];
}

- (void)setupContraints {
    [self.keyLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [self.keyLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [self.keyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(scaleX(12.5));
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.valueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.keyLabel.mas_right).offset(10);
        make.right.equalTo(self.arrowImageView.mas_left).offset(-scaleX(10));
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(-CeilScaleX(11.5)));
        make.width.equalTo(@(CeilScaleX(8)));
        make.height.equalTo(@(CeilScaleY(13)));
        make.centerY.equalTo(self.contentView);
    }];
}
- (UILabel *)keyLabel {
    if (!_keyLabel) {
        _keyLabel = [[UILabel alloc] init];
        
        _keyLabel.font = kFontSize(14);
        _keyLabel.textColor = UIColorFromRGB(0x222222);
    }
    return _keyLabel;
}

- (UILabel *)valueLabel {
    if (!_valueLabel) {
        _valueLabel = [[UILabel alloc] init];
        
        _valueLabel.font = kFontSize(14);
        _valueLabel.textColor = UIColorFromRGB(0x222222);
        _valueLabel.textAlignment = NSTextAlignmentRight;
    }
    return _valueLabel;
}

- (UIImageView *)arrowImageView {
    if (!_arrowImageView) {
        _arrowImageView = [[UIImageView alloc] init];
        
        _arrowImageView.image = [UIImage imageNamed:@"account_right_arrow"];
    }
    return _arrowImageView;
}

@end
