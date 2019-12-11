//
//  BFKeyValueCell.h
//  BFMoney
//
//  Created by xiaoniu on 2019/7/30.
//  Copyright © 2019 com.bluefin. All rights reserved.
//

#import "XFTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface BFKeyValueCell : XFTableViewCell

@property (nonatomic, strong) UILabel *keyLabel;
@property (nonatomic, strong) UILabel *valueLabel;

@end

NS_ASSUME_NONNULL_END
