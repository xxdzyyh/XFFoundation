//
//  BFInputCell.m
//  BFMoney
//
//  Created by xiaoniu on 2019/7/29.
//  Copyright © 2019 com.bluefin. All rights reserved.
//

#import "BFInputCell.h"
#import "UIView+Utils.h"
#import <Masonry/Masonry.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import "XFMarco.h"

@interface BFInputCell() <UITextFieldDelegate>

@end

@implementation BFInputCell

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
    
    self.viewModel = viewModel;
    
    self.keyLabel.text = vm.key;
    self.valueTextField.placeholder = vm.placeholder;
    self.valueTextField.text = vm.value;
    self.unit = vm.unit;
    self.customUnitView = vm.customUnitView;
    self.valueTextField.keyboardType = vm.keyboardType;
    
    [[self.valueTextField.rac_textSignal takeUntil:self.rac_prepareForReuseSignal] subscribeNext:^(NSString * _Nullable x) {
        vm.value = x;
    }];
}

#pragma mark - Private

- (void)setupSubviews {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.contentView addSubview:self.keyLabel];
    [self.contentView addSubview:self.valueTextField];
}

- (void)setupContraints {
    [self.keyLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [self.keyLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [self.keyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(scaleX(12.5));
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.valueTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.keyLabel.mas_right).offset(scaleX(10));
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView).offset(scaleX(-12));
    }];
}

+ (CGFloat)cellHeight {
    return scaleY(55);
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    if (self.viewModel.textShouldChange) {
        return self.viewModel.textShouldChange(textField.text,toBeString);
    } else if (self.viewModel.maxLength > 0 && [toBeString length] > self.viewModel.maxLength) {
        textField.text = [toBeString substringToIndex:self.viewModel.maxLength];
        return NO;
    } else {
        return YES;
    }   
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
        _valueTextField.delegate = self;
    }
    return _valueTextField;
}

- (UILabel *)unitLabel {
    if (!_unitLabel) {
        _unitLabel = [[UILabel alloc] init];
        
        _unitLabel.font = kFontSize(11);
        _unitLabel.textColor = UIColorFromRGB(0x222222);
    }
    return _unitLabel;
}

- (void)setUnit:(NSString *)unit {
    _unit = unit;
    if (_unit.length > 0) {
        self.unitLabel.text = _unit;
        [self.contentView addSubview:self.unitLabel];
        [self.unitLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        [self.unitLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        [self.unitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_offset(scaleX(-12));
            make.centerY.equalTo(self.contentView);
        }];
        
        [self.valueTextField mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.keyLabel.mas_right).offset(scaleX(10));
            make.centerY.equalTo(self.contentView);
            make.right.equalTo(self.unitLabel.mas_left).offset(scaleX(-5));
        }];
    }
}

- (void)setCustomUnitView:(UIView *)customUnitView {
    _customUnitView = customUnitView;
    if (_customUnitView != nil) {
        [self.contentView addSubview:self.customUnitView];
        
        [self.customUnitView setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        [self.customUnitView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_offset(scaleX(-12));
            make.centerY.equalTo(self.contentView);
            make.size.mas_equalTo(self.customUnitView.size);
        }];
        
        [self.valueTextField mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.keyLabel.mas_right).offset(scaleX(10));
            make.centerY.equalTo(self.contentView);
            make.right.equalTo(self.customUnitView.mas_left).offset(-scaleX(5));
        }];
    }
}

@end
