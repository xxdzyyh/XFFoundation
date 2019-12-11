//
//  TestModel.h
//  XFFoundation
//
//  Created by wangxuefeng on 17/1/17.
//  Copyright © 2017年 wangxuefeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TestModel : NSObject

@property (copy  , nonatomic) NSString *title;
@property (copy  , nonatomic) NSString *content;
@property (strong, nonatomic) UIColor  *color;

@end
