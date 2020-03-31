//
//  BFKeySegmentCell.m
//  BFMoney
//
//  Created by xiaoniu on 2019/7/31.
//  Copyright © 2019 com.bluefin. All rights reserved.
//

#import "BFKeySegmentCell.h"
#import "UIView+Utils.h"
#import <Masonry/Masonry.h>
#import "XFMarco.h"

@implementation BFKeySegmentCell

- (instancetype)initWithCellIdentifier:(NSString *)cellId {
    self = [super initWithCellIdentifier:cellId];
    if (self) {
        [self setupSubviews];
        [self setupContraints];
    }
    return self;
}

- (void)setupSubviews {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.contentView addSubview:self.keyLabel];
    [self.contentView addSubview:self.valueTextField];
    [self.contentView addSubview:self.segment];
}

- (void)setupContraints {
    [self.keyLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [self.keyLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [self.keyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(scaleX(12.5));
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.segment mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-scaleX(12));
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(scaleX(94), scaleY(40)));
    }];
    
    [self.valueTextField mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.keyLabel.mas_right).offset(scaleX(10));
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.segment.mas_left);
    }];
}

+ (CGFloat)cellHeight {
    return scaleY(55);
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

- (UITextField *)valueTextField {
    if (!_valueTextField) {
        _valueTextField = [[UITextField alloc] init];
        
        _valueTextField.font = kFontSize(14);
        _valueTextField.textColor = UIColorFromRGB(0x222222);
        _valueTextField.keyboardType = UIKeyboardTypeDefault;
        _valueTextField.textAlignment = NSTextAlignmentRight;
    }
    return _valueTextField;
}

- (UISegmentedControl *)segment {
    if (!_segment) {
        _segment = [[UISegmentedControl alloc] initWithFrame:CGRectMake(0, 0, scaleX(94), scaleY(40))];
    }
    return _segment;                                                         
}

- (void)setUnits:(NSArray *)units {
    _units = units;
    
    for (int i=0; i<_units.count; i++) {
        [self.segment insertSegmentWithTitle:units[i] atIndex:i animated:NO];
    }
}

@end
