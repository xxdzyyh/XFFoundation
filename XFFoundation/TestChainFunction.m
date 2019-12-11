//
//  TestChainFunction.m
//  XFFoundation
//
//  Created by wangxuefeng on 2017/8/28.
//  Copyright © 2017年 wangxuefeng. All rights reserved.
//

#import "TestChainFunction.h"

@implementation TestChainFunction

- (TestChainFunction *(^)(NSInteger))add {
    __weak typeof(self) weakSelf = self;
    
    return ^(NSInteger value) {
        weakSelf.balance += value;
        return weakSelf;
    };
}

@end
