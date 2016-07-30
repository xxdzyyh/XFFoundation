//
//  CTQPeopleCell.h
//  CTQProject
//
//  Created by wangxuefeng on 16/7/1.
//  Copyright © 2016年 code. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XFFoundation.h"

@interface CTQPeopleCell : XFTableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imgvIcon;

@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;

@end
