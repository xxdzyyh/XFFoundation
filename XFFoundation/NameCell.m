//
//  NameCell.m
//  XFFoundation
//
//  Created by xiaoniu on 2019/1/7.
//  Copyright © 2019 wangxuefeng. All rights reserved.
//

#import "NameCell.h"

@implementation NameCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configCellWithData:(id)item {
    NSDictionary *dict = item;
    
    self.leftLabel.text = dict[@"name"];
}
@end
