//
//  CTQPeopleCell.m
//  CTQProject
//
//  Created by wangxuefeng on 16/7/1.
//  Copyright © 2016年 code. All rights reserved.
//

#import "CTQPeopleCell.h"
#import "CTQMember.h"
#import "UIView+YYAdd.h"
#import "YYKit.h"

@implementation CTQPeopleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.imgvIcon.layer.cornerRadius = self.imgvIcon.width/2;
    self.imgvIcon.clipsToBounds = YES;
}

- (void)addSubview:(UIView *)view {
    if ([view isKindOfClass:NSClassFromString(@"UITableViewCellContentView")]) {
        [super addSubview:view];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configCellWithData:(id)item {
    [super configCellWithData:item];
    
    CTQMember *data = (CTQMember *)item;
    
    self.lblName.text = data.memberName;
    self.lblTitle.text = data.position;
    
    if (data.userportrait.length > 0) {
    
        self.imgvIcon.imageURL = [NSURL URLWithString:data.userportrait];
    } else {
        
        UILabel *label = [[UILabel alloc] init];
        
        label.textColor = [UIColor whiteColor];
        label.text = [data.memberName substringToIndex:1];
        label.size = label.intrinsicContentSize;
        label.center = CGPointMake(self.imgvIcon.width/2, self.imgvIcon.height/2);
        
        
        [self.imgvIcon addSubview:label];
        
        UIImage *image = [self imageWithColor:[UIColor orangeColor] size:self.imgvIcon.size];
        
        [self.imgvIcon setImage:image];
    }
}


@end
