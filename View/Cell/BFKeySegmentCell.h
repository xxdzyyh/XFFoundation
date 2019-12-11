//
//  BFKeySegmentCell.h
//  BFMoney
//
//  Created by xiaoniu on 2019/7/31.
//  Copyright © 2019 com.bluefin. All rights reserved.
//

#import "XFTableViewCell.h"

/**
 投资期限
 */

NS_ASSUME_NONNULL_BEGIN

@interface BFKeySegmentCell : XFTableViewCell

@property (nonatomic, strong) UILabel *keyLabel;
@property (nonatomic, strong) UITextField *valueTextField;
@property (nonatomic, copy  ) NSArray *units;
@property (nonatomic, strong) UISegmentedControl *segment;

@end

NS_ASSUME_NONNULL_END
