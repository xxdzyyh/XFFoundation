//
//  BFKeyValueArrowCell.h
//  BFMoney
//
//  Created by xiaoniu on 2019/7/29.
//  Copyright © 2019 com.bluefin. All rights reserved.
//

#import "XFTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface BFKeyValueArrowCell : XFTableViewCell

@property (nonatomic, strong) UILabel *keyLabel;
@property (nonatomic, strong) UILabel *valueLabel;
@property (nonatomic, strong) UIImageView *arrowImageView;

@end

NS_ASSUME_NONNULL_END
