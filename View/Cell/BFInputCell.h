//
//  BFInputCell.h
//  BFMoney
//
//  Created by xiaoniu on 2019/7/29.
//  Copyright © 2019 com.bluefin. All rights reserved.
//

#import "XFTableViewCell.h"
#import "BFKeyValueVM.h"

NS_ASSUME_NONNULL_BEGIN
 
@interface BFInputCell : XFTableViewCell

@property (nonatomic, strong) UILabel *keyLabel;
@property (nonatomic, strong) UITextField *valueTextField;
@property (nonatomic, copy  ) NSString *unit;
@property (nonatomic, strong) UILabel *unitLabel;
@property (nonatomic, strong) UIView *customUnitView;

@property (nonatomic, strong) BFKeyValueVM *viewModel;

@end

NS_ASSUME_NONNULL_END
