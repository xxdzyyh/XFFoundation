//
//  BFKeySwitchCell.m
//  BFMoney
//
//  Created by xiaoniu on 2019/7/31.
//  Copyright © 2019 com.bluefin. All rights reserved.
//

#import "BFKeySwitchCell.h"
#import "BFKeyValueVM.h"
#import "UIView+Utils.h"
#import <Masonry/Masonry.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import "XFMarco.h"

@implementation BFKeySwitchCell

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
    self.switchControl.on = vm.isOn;
    
    [self.switchControl.rac_newOnChannel subscribeNext:^(NSNumber * _Nullable x) {
        vm.isOn = x.boolValue; 
    }];
    
}

+ (CGFloat)cellHeight {
    return scaleY(55);
}

#pragma mark - Private

- (void)setupSubviews {
    [self.contentView addSubview:self.keyLabel];
    [self.contentView addSubview:self.switchControl];
}

- (void)setupContraints {
    [self.keyLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [self.keyLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [self.keyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(scaleX(12.5));
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.switchControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-scaleX(12.5));
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(scaleX(44), scaleY(24)));
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

- (UISwitch *)switchControl {
    if (!_switchControl) {
        _switchControl = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, scaleX(44), scaleY(24))];
        
        _switchControl.tintColor = UIColorFromRGB(0x51516B);
        _switchControl.onTintColor = UIColorFromRGB(0x51516B);
    }
    return _switchControl;
}

@end
