//
//  TestChainFunction.h
//  XFFoundation
//
//  Created by wangxuefeng on 2017/8/28.
//  Copyright © 2017年 wangxuefeng. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  要使用.去调用就必须是属性的getter,所以定义成为属性
 *  
 *  要连续调用，就必须返回对象自身，一般的属性只是返回属性自身，所以需要使用block
 */
@interface TestChainFunction : NSObject

@property (assign, nonatomic) NSInteger balance;

@property (strong, nonatomic, readonly) TestChainFunction* (^add)(NSInteger);

@end
