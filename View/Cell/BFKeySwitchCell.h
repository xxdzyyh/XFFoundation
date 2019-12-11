//
//  BFKeySwitchCell.h
//  BFMoney
//
//  Created by xiaoniu on 2019/7/31.
//  Copyright © 2019 com.bluefin. All rights reserved.
//

#import "XFTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface BFKeySwitchCell : XFTableViewCell

@property (nonatomic, strong) UILabel *keyLabel;
@property (nonatomic, strong) UISwitch *switchControl;

@end

NS_ASSUME_NONNULL_END
