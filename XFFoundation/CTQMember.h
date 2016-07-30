//
//  CTQMember.h
//  CTQProject
//
//  Created by wangxuefeng on 16/6/15.
//  Copyright © 2016年 code. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTQMember : NSObject

@property (copy, nonatomic) NSString *memberName;

@property (copy, nonatomic) NSString *companyName;

@property (strong, nonatomic) NSNumber *memberId;

@property (copy  , nonatomic) NSString *position;

@property (copy  , nonatomic) NSString *userportrait;

@property (copy  , nonatomic) NSString *introduce;

@end
