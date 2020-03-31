//
//  BFEmptyCell.m
//  BFMoney
//
//  Created by xiaoniu on 2019/7/30.
//  Copyright © 2019 com.bluefin. All rights reserved.
//

#import "BFEmptyCell.h"
#import "UIView+Utils.h"
#import <Masonry/Masonry.h>
#import "XFMarco.h"

@implementation BFEmptyCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = UIColorFromRGB(0xF8F8F8);
}

+ (CGFloat)cellHeight {
    return scaleY(10);
}

@end
