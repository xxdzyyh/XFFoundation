//
//  BFKeyValueCell.m
//  BFMoney
//
//  Created by xiaoniu on 2019/7/30.
//  Copyright © 2019 com.bluefin. All rights reserved.
//

#import "BFKeyValueCell.h"
#import "BFKeyValueVM.h"
#import "UIView+Utils.h"
#import <Masonry/Masonry.h>
#import "XFMarco.h"

@implementation BFKeyValueCell

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
}

+ (CGFloat)cellHeight {
    return scaleY(55);
}

#pragma mark - Private

- (void)setupSubviews {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.contentView addSubview:self.keyLabel];
    [self.contentView addSubview:self.valueLabel];
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
        make.right.equalTo(self.contentView).offset(-scaleX(10));
        make.centerY.equalTo(self.contentView);
    }];
}

#pragma mark - Property

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

@end
