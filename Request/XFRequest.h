//
//  XFRequest.h
//  CTQProject
//
//  Created by wangxuefeng on 16/6/21.
//  Copyright © 2016年 code. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XFRequest;

@protocol XFRequestDelegate <NSObject>

- (void)request:(XFRequest *)request finishedWithResult:(id)result;

@end

typedef void(^XFRequestBlock)(XFRequest *request,id result);


@interface XFRequest : NSObject

@property (copy  , nonatomic) NSString *path;

@property (strong, nonatomic, readonly) NSMutableDictionary *params;

+ (NSString *)domain;

/** 使用delegate方式 */
- (instancetype)initWithPath:(NSString *)path;

@property (weak  , nonatomic) id<XFRequestDelegate> delegate;

/** 使用block方式 */
@property (strong, nonatomic) XFRequestBlock finishBlock;

- (instancetype)initWithPath:(NSString *)path finish:(XFRequestBlock)finishBlock;


@property (assign, nonatomic, getter=isCancel) BOOL cancel;

/**
 *  调用执行，才会真正开始请求数据
 */
- (void)start;

- (void)cancel;

/*!  * @brief 添加参数
 * @param value 暂时只支持基本数据类型，不支持JSON类型
 * @param name 参数名
 */
- (void)addParameter:(NSString*)name value:(id)value;

/*!  * @brief 通过字典添加参数*/
- (void)addParameters:(NSDictionary*)parameters;

/*!  * @brief 真正的发送请求*/
- (void)execute:(void(^)(XFRequest *request,BOOL success))completion;

@end
