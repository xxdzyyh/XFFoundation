//
//  CTQMainMemberCell.h
//  CTQProject
//
//  Created by wangxuefeng on 16/6/15.
//  Copyright © 2016年 code. All rights reserved.
//

#import "XFFoundation.h"
#import "CTQPeopleView.h"

@interface CTQMainMemberCell : XFTableViewCell

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *layPeopleViewHeight;

@property (weak, nonatomic) IBOutlet CTQPeopleView *peopleView;

@end
